SET SERVEROUTPUT ON



create or replace function input_date(date_string string) 
return date is
    BEGIN
            return to_date(date_string);
end input_date;
/

DECLARE
        cursor results is
                SELECT table1.J_ORDR_CDE FROM j_ordr_basic_rvw table1,
                                 j_ordr_memo_rvw  table2
                                    WHERE table1.ofce_cde    = 'LEV'
                                    AND   table1.status      = 'Completed'
                                    AND   table1.j_ordr_type = 'Non-Transportation'
                                    AND   table1.j_ordr_uuid = table2.j_ordr_uuid
                                    AND table1.issu_dt_loc BETWEEN input_date('&start') AND input_date('&start')
                                    AND table1.match_ind = 0;
BEGIN 
    for result_record in results
    loop
        dbms_output.put_line(result_record.J_ORDR_CDE);
    end loop;
end;

/
--describe j_ordr_basic_rvw;
--select count(*) from j_inv_job;
