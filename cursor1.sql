
SET SERVEROUTPUT on



declare
    start_date DATE := to_date ('01/12/2008', 'DD/MM/YYYY');
    end_date DATE := to_date ('29/12/2008', 'DD/MM/YYYY');
    CURSOR cursor1 IS 
        SELECT table1.j_ordr_uuid,
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
        AND table1.status      = 'Completed'
        AND table1.j_ordr_type = 'Non-Transportation'
        AND table1.j_ordr_uuid = table1.j_ordr_uuid
        AND table1.issu_dt_loc BETWEEN start_date AND end_date
        AND table1.match_ind = 0;
begin
    open cursor1;
    for table_record in cursor1
    loop
        dbms_output.put_line(table_record.j_ordr_uuid);
    end loop;
    close cursor1;
end;

