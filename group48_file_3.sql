create or replace procedure get_cmpltd_jobs
    (   start_date in DATE default trunc(SYSDATE, 'MM'),
        end_date in DATE default sysdate) 
        
    
    IS
    too_long exception;
    BEGIN

    if(months_between(start_date, end_date)<-1) then
        raise too_long;
    end if;
        --TABLE1
        delete from grp48_j_order_basic_lev_comp_nt;

        INSERT INTO grp48_j_order_basic_lev_comp_nt
            SELECT    table1.j_ordr_uuid,
                      table1.j_ordr_cde,
                      table1.vendor_cde,
                      table1.vendor_name,
                      table1.ofce_cde,
                      table1.issu_dt_loc,
                      table1.actvy_dt_loc,
                      table2.usr
        FROM j_ordr_basic_rvw table1,
             j_ordr_memo_rvw  table2
        WHERE table1.ofce_cde    = 'LEV'
        AND   table1.status      = 'Completed'
        AND   table1.j_ordr_type = 'Non-Transportation'
        AND   table1.j_ordr_uuid = table2.j_ordr_uuid
        AND table1.issu_dt_loc BETWEEN start_date AND end_date
        AND table1.match_ind = 0;



--        SELECT * FROM grp48_j_order_basic_lev_comp_nt;



        --table2
        delete from j_ordr_nt_uuid;

        INSERT INTO j_ordr_nt_uuid
        SELECT  b.n_t_ordr_uuid, 
                a.j_ordr_cde,
                a.vendor_cde,
                a.vendor_name,
                a.ofce_cde,
                a.issu_dt_loc,
                a.actvy_dt_loc,
                a.usr
        FROM ir2owner.grp48_j_order_basic_lev_comp_nt a,
             n_t_ordr_rvw                   b
        WHERE a.j_ordr_cde  = b.j_ordr_cde
        AND   a.j_ordr_uuid = b.j_ordr_uuid;



--        SELECT * FROM j_ordr_nt_uuid;
--        SELECT * FROM n_t_job_rvw;



        --table 3
        delete from  j_job_uuid;
        INSERT INTO ir2owner.j_job_uuid
        SELECT  b.n_t_job_uuid,
                a.j_ordr_cde,
                a.vendor_cde,
                a.vendor_name,
                a.ofce_cde,
                a.issu_dt_loc,
                a.actvy_dt_loc,
                a.usr
        FROM n_t_job_rvw b,
             ir2owner.j_ordr_nt_uuid a
        WHERE b.n_t_ordr_uuid = a.j_ordr_uuid;        
        --AND   a.j_item_owner_uuid = b.n_t_job_uuid;
--        SELECT * FROM n_t_job_rvw;
--        select * from j_item_basic_uuid;
--        select * from j_item_job_uuid ORDER BY j_item_job_uuid DESC;
--        select * from j_item_rvw WHERE j_item_owner_uuid = 2837529194618015;
        --table 3.1

        delete from j_item_uuid;
        INSERT INTO ir2owner.j_item_uuid(j_item_uuid)
        SELECT a.j_item_uuid
        FROM j_item_rvw a,
             j_job_uuid b
        WHERE a.j_item_owner_uuid = b.j_job_uuid;

        ----table 4
        --DROP TABLE j_item_revised_uuid;
        --CREATE TABLE j_item_revised_uuid (j_item_uuid NUMBER(20));
        --INSERT INTO ir2owner.j_item_revised_uuid(j_item_uuid)
        --SELECT b.j_item_uuid
        --FROM j_revised_cost_rvw  a,
        --     ir2owner.j_item_rvw b
        --WHERE a.j_revised_cost_owner_uuid = b.j_item_uuid;
        --
        --select * from j_item_revised_uuid
        --
        ----table 5
        --DROP TABLE j_item_addl_uuid;
        --CREATE TABLE j_item_addl_uuid (j_item_uuid NUMBER(20));
        --INSERT INTO ir2owner.j_item_addl_uuid(j_item_uuid)
        --SELECT DISTINCT b.j_item_uuid
        --FROM j_addl_cost_rvw a,
        --     j_item_rvw      b
        --WHERE a.j_addl_cost_owner_uuid = b.j_item_uuid;
        --select * from j_item_addl_uuid



        --table 

        delete from j_inv_job;
        INSERT INTO j_inv_job ( ccy ,
                        ttl_inv ,
                        j_ordr_cde ,
                        vendor_cde ,
                        vendor_name ,
                        ofce_cde ,
                        issu_dt_loc ,
                        actvy_dt_loc ,
                        usr)
        SELECT b.ttl_amt_ccy, b.ttl_amt,a.j_ordr_cde,
                a.vendor_cde,
                a.vendor_name,
                a.ofce_cde,
                a.issu_dt_loc,
                a.actvy_dt_loc,
                a.usr
        FROM j_ordr_inv_item_rvw          b,
             j_ordr_inv_item_entry_rvw    c,
             ir2owner.j_job_uuid a
        WHERE b.j_ordr_inv_uuid = c.j_ordr_inv_uuid
        AND   c.job_uuid       = a.j_job_uuid;
        commit;
--        select * from j_inv_job;
--        select * from j_ordr_inv_item_basic_uuid

    exception 
        when too_long then
            DBMS_OUTPUT.PUT_LINE (months_between(start_date,end_date));
    END get_cmpltd_jobs;
/

create or replace function input_date(date_string string) 
return date is
    BEGIN
            return to_date(date_string);
end input_date;
/

create or replace procedure group48_get_revised_ttl(in_job_id in j_inv_job.j_job_uuid%type,
    ttl out number )
    is
        
    begin
        select sum(cost_amt) into ttl from grp48_revise_uuid where job_id = in_job_id group by job_id ;
        
    exception
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE ('not found.');
    end group48_get_revised_ttl;
    
   
   create or replace procedure group48_get_original_ttl(in_job_id in j_inv_job.j_job_uuid%type,
    ttl out number )
    is
        
    begin
        select sum(orig_cost_amt) into ttl from j_item_rvw  where j_item_owner_uuid = in_job_id group by j_item_owner_uuid;
        
    exception
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE ('not found.');
end group48_get_original_ttl;
/

create or replace procedure group48_get_addl_cost
(in_job_id j_inv_job.j_job_uuid%type, ttl in out number )
    is
    addl number(25,2);
    begin
       select sum(cost_amt) into addl from grp48_addl_uuid WHERE job_id = in_job_id;

       if addl IS NOT NULL THEN
            ttl := ttl + addl;
       end if;

    exception
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE ('not found.');
    end group48_get_addl_cost;
    /