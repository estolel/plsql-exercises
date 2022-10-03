VARIABLE dept_id NUMBER
VARIABLE rows_deleted VARCHAR2(30)
SET SERVEROUTPUT ON

DECLARE
    max_deptno NUMBER;
    dept_name hr.departments.department_name%TYPE := 'Education';
BEGIN
    SELECT MAX(department_id) INTO max_deptno from hr.departments;
    dbms_output.put_line ('The maximum department_id is: '|| max_deptno);
    :dept_id := max_deptno+10;
    
    dbms_output.put_line ('department_name: '|| dept_name);
    dbms_output.put_line ('department_id: '|| :dept_id);
    INSERT INTO hr.departments(department_name,department_id,location_id) VALUES (dept_name, :dept_id, null);
    :rows_deleted := (SQL%ROWCOUNT || ' row deleted.');
    commit;
END;
/

PRINT rows_deleted


--SELECT department_name FROM hr.departments where department_id = :dept_id;