CREATE OR REPLACE FUNCTION group48_case_n_t_job_summary_fn(
    p_startdate string,
    p_enddate   string
) RETURN SYS_REFCURSOR IS
    job_summary SYS_REFCURSOR;
    v_converted_startdate DATE := GROUP48_PKG.INPUT_DATE(p_startdate);
    v_converted_enddate DATE := GROUP48_PKG.INPUT_DATE(p_enddate);
BEGIN
    
    GROUP48_PKG.GET_CMPLTD_JOBS(v_converted_startdate, v_converted_enddate);
    OPEN job_summary for select
                        j_ordr_cde as JO_Number,
                        vendor_cde as Vendor_Code,
                        vendor_name as Vendor_Name,
                        ofce_cde as Office_Code,
                        issu_dt_loc as Issue_Date,
                        actvy_dt_loc as Activity_Date,
                        ccy as Currency,
                        ttl as Total_Amount,
                        ttl_inv as Total_Invoiced_Amount,
                        ttl_uninv as Uninvoiced_Amount,
                        usr as Username
                        from j_inv_job;
    
    return job_summary;
    
END;
/
COMMIT;

