DROP TABLE emp;
CREATE TABLE emp AS SELECT * FROM  hr.employees;
ALTER TABLE emp DROP COLUMN stars;
ALTER TABLE emp ADD stars VARCHAR2(50);

DEFINE empno = 176 

declare
    asterisk emp.stars%type := null;
    sal emp.salary%type;
    asterisk_count number := 0;
begin 
    select SALARY into sal from emp where employee_id = '&empno';
    asterisk_count := floor(sal/1000);
    dbms_output.put_line ('asterisk_count: '|| asterisk_count);
    for i IN 1..asterisk_count
    loop
      asterisk := concat(asterisk,'*');
    end loop;
    update emp set stars = asterisk where employee_id = '&empno';
    commit;
end;
/
select * from emp where employee_id = '&empno';