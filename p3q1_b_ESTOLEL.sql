CREATE OR REPLACE PACKAGE JOB_PKG IS
    PROCEDURE ADD_JOB(new_job_id hr.jobs.job_id%type, new_job_title hr.jobs.job_title%type);
    PROCEDURE UPD_JOB(v_job_id hr.jobs.job_id%type, new_job_title hr.jobs.job_title%type);
    PROCEDURE DEL_JOB(v_job_id hr.jobs.job_id%type);
    FUNCTION GET_JOB;
END;
/
SHOW ERRORS;

CREATE OR REPLACE PACKAGE BODY JOB_PKG AS
    PROCEDURE ADD_JOB(new_job_id hr.jobs.job_id%type, new_job_title hr.jobs.job_title%type) 
    IS BEGIN
    dbms_output.put_line('Adding job: '||new_job_id);
    INSERT INTO hr.jobs(job_id, job_title) values (new_job_id, new_job_title);
    END ADD_JOB;

    PROCEDURE UPD_JOB(v_job_id hr.jobs.job_id%type, new_job_title hr.jobs.job_title%type)
    IS BEGIN
    dbms_output.put_line('Updating job: '||v_job_id);
    update HR.JOBS set JOB_TITLE = new_job_title where job_id = v_job_id;
    EXCEPTION
    when NO_DATA_FOUND then
        dbms_output.put_line('No job found with Job ID: '||v_job_id);
    END UPD_JOB;

    PROCEDURE DEL_JOB(v_job_id hr.jobs.job_id%type)
    IS BEGIN
    dbms_output.put_line('Deleting job: '||v_job_id);
    DELETE FROM HR.JOBS where job_id = v_job_id;
    EXCEPTION
    when NO_DATA_FOUND then
        dbms_output.put_line('No job found with Job ID: '||v_job_id);
    end DEL_JOB;
    
    FUNCTION GET_JOB
    RETURN VARCHAR2 IS
    TITLE HR.JOBS.JOB_TITLE%TYPE;
    BEGIN
        select job_title
        into TITLE
        from hr.jobs
        where job_id like 'SA_REP';
        return TITLE;
    END GET_JOB;
END JOB_PKG; 
/
EXECUTE JOB_PKG.ADD_JOB('IT_SYSAN_EST', 'SYSTEMS ANALYST');
select * from hr.jobs;