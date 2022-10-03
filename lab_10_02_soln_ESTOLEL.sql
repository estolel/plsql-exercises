CREATE OR REPLACE FUNCTION GET_JOB
RETURN VARCHAR2 IS
TITLE HR.JOBS.JOB_TITLE%TYPE;
BEGIN
    select job_title
    into TITLE
    from hr.jobs
    where job_id like 'SA_REP';
    return TITLE;
END GET_JOB;
/
CREATE OR REPLACE FUNCTION GET_ANNUAL_COMP(emp_sal hr.employees.salary%type, emp_com hr.employees.commission_pct%type)
RETURN VARCHAR2 IS
annual_salary  hr.employees.salary%type;
BEGIN
    return (emp_sal*12) + (emp_com*emp_sal*12);
END GET_ANNUAL_COMP; 
/



begin 
     dbms_output.put_line(GET_JOB);
END;
/

select employee_id, last_name, salary, commission_pct, GET_ANNUAL_COMP(salary, commission_pct) as "Annual Compensation" from hr.employees;