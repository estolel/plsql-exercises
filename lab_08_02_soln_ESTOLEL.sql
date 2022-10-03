SET SERVEROUPUT ON
DELETE FROM messages;

DEFINE sal NUMBER := 6000;

declare
    ename hr.employees.last_name%type;
    emp_sal hr.employees.salary%type;
    no_employee_found EXCEPTION;
begin
    select last_name, salary into ename,emp_sal 
    from hr.employees 
    where salary = emp_sal;    
    insert into messages values('Employee Name: '||ename||' Employee Salary: '||emp_sal||'');
exception
    when no_data_found THEN
        dbms_output.put_line('No employee with a salary of '||emp_sal);
        insert into messages values('No employee with a salary of '||emp_sal);
    when too_many_rows  THEN
        dbms_output.put_line('More than one employee with a salary of '||emp_sal||'.');
        insert into messages values('More than one employee with a salary of '||emp_sal||'.');
end;
/

select * from messages;
