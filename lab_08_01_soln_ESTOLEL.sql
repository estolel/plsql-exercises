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
    IF SQL%NOTFOUND THEN
        RAISE no_employee_found;
    ELSIF SQL%ROWCOUNT>1 THEN
        dbms_output.put_line('More than one employee with a salary of '||emp_sal||'.');
        insert into messages values('More than one employee with a salary of '||emp_sal||'.');
    else 
        dbms_output.put_line('No employee with a salary of '||emp_sal||'.');
        insert into messages values('No employee with a salary of '||emp_sal||'.');
    END IF;
exception
    when no_data_found THEN
        dbms_output.put_line('No employee with a salary of '||emp_sal);
        insert into messages values('No employee with a salary of '||emp_sal);
end;
/

select * from messages;