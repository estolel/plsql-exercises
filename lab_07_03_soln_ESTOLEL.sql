
declare 
    cursor dept_cursor is
        select distinct department_name, department_id 
        from hr.departments 
        where department_id < 100
        order by department_id;
    cursor emp_cursor(lv_dept_id NUMBER) is
        select last_name, job_id, hire_date, salary 
        from hr.employees 
        where employee_id < 120 AND
        department_id = lv_dept_id;
    v_dept_name hr.departments.department_name%type;
    v_dept_id hr.departments.department_id%type;
    v_emp_last_name hr.employees.last_name%type;
    v_emp_job_id hr.employees.job_id%type;
    v_emp_hire_date hr.employees.hire_date%type;
    v_emp_salary hr.employees.salary%type;
begin
    open dept_cursor;
    loop
        fetch dept_cursor into v_dept_name, v_dept_id;
        dbms_output.put_line('dept name: '||v_dept_name ||' || dept id: ' ||v_dept_id);
        open emp_cursor(v_dept_id);
        loop
            fetch emp_cursor 
            into v_emp_last_name, v_emp_job_id, v_emp_hire_date, v_emp_salary;
            dbms_output.put_line('emp name: ' ||v_emp_last_name 
            ||' || emp job: ' ||v_emp_job_id
            ||' || emp hire date: ' ||v_emp_hire_date
            ||' || emp salary: ' ||v_emp_salary
            );
        EXIT WHEN emp_cursor%NOTFOUND;
        end loop;
        close emp_cursor;
        dbms_output.put_line('');
        dbms_output.put_line('');
        EXIT WHEN dept_cursor%NOTFOUND;
    end loop;
    close dept_cursor;

end;