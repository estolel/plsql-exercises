set serveroutput on;
DROP PROCEDURE ADD_JOB;
DROP PROCEDURE UPD_JOB;
DROP PROCEDURE DEL_JOB;

CREATE OR REPLACE PROCEDURE ADD_JOB(new_job_id hr.jobs.job_id%type, new_job_title hr.jobs.job_title%type) 
IS
BEGIN
dbms_output.put_line('Adding job: '||new_job_id);
INSERT INTO hr.jobs(job_id, job_title) values (new_job_id, new_job_title);
END ADD_JOB;
/
CREATE OR REPLACE PROCEDURE UPD_JOB(v_job_id hr.jobs.job_id%type, new_job_title hr.jobs.job_title%type)
IS
BEGIN
dbms_output.put_line('Updating job: '||v_job_id);
update HR.JOBS set JOB_TITLE = new_job_title where job_id = v_job_id;
EXCEPTION
when NO_DATA_FOUND then
    dbms_output.put_line('No job found with Job ID: '||v_job_id);
END UPD_JOB;
/
CREATE OR REPLACE PROCEDURE DEL_JOB(v_job_id hr.jobs.job_id%type)
IS
BEGIN
dbms_output.put_line('Deleting job: '||v_job_id);
DELETE FROM HR.JOBS where job_id = v_job_id;
EXCEPTION
when NO_DATA_FOUND then
    dbms_output.put_line('No job found with Job ID: '||v_job_id);
END DEL_JOB; 
/
EXECUTE ADD_JOB('IT_DBA_EST', 'Database Administrator_EST_2');
EXECUTE ADD_JOB('ST_MAN_EST', 'Stock Manager_EST_2');
EXECUTE UPD_JOB('IT_DBA_EST', 'Database Administrator');
EXECUTE DEL_JOB('IT_DBA_EST');
select * from hr.jobs;