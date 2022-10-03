

SET SERVEROUTPUT ON



DECLARE
    max_deptno NUMBER;
    
BEGIN
    SELECT MAX(department_id) INTO max_deptno from hr.departments;
    dbms_output.put_line ('The maximum department_id is: '|| max_deptno);
END;
/