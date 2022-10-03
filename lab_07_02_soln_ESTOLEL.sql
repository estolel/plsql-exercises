DEFINE p_deptno NUMBER;


DECLARE
    deptno NUMBER := &p_deptno;
    cursor emp_cursor is
        select last_name, salary, manager_id 
        from hr.employees 
        where DEPARTMENT_ID = &p_deptno;
BEGIN
    for emp_record in emp_cursor 
    loop
        if emp_record.salary < 5000 AND emp_record.manager_id in (101,124) then 
            dbms_output.put_line (emp_record.last_name|| ' Due for a raise.');
        else
            dbms_output.put_line (emp_record.last_name|| ' Not due for a raise.');
        end if;
    end loop;
END;
/