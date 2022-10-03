DROP TABLE top_salaries;
CREATE TABLE top_salaries
(salary	NUMBER(8,2));
commit;

PROMPT Top N Earners.
ACCEPT p_num prompt 'How many top earners?'

DECLARE
    num NUMBER;
    sal hr.employees.salary%type;
    cursor emp_cursor is
        SELECT DISTINCT SALARY INTO sal FROM HR.EMPLOYEES ORDER BY SALARY desc ;
BEGIN
    num := &p_num;
    open emp_cursor;
    loop
        fetch emp_cursor into sal;
        EXIT WHEN emp_cursor%ROWCOUNT > num+1 OR emp_cursor%NOTFOUND;
        if(sal IS NOT NULL) then insert into top_salaries values(sal); end if;
        commit;
    end loop;
    close emp_cursor;
END;
/
select * from top_salaries;