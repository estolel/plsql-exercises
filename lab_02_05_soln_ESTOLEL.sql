VARIABLE basic_percent NUMBER
VARIABLE pf_percent NUMBER
SET SERVEROUTPUT ON
DECLARE
hello_world VARCHAR2(25);
today DATE:=SYSDATE;
tomorrow TODAY%TYPE;
fname VARCHAR2(15);
emp_sal NUMBER(10);
emp_basic_sal NUMBER(10);
BEGIN
hello_world :='world';
tomorrow := today+1;
:basic_percent:=45;
:pf_percent:=12;
emp_contribution:=emp_sal*basic_percent;
SELECT first_name, salary INTO fname, emp_sal FROM employees WHERE employee_id=110;
dbms_output.put_line ('hello '|| fname);
dbms_output.put_line ('YOUR SALARY IS: '|| fname);
dbms_output.put_line ('hello '|| fname);

--dbms_output.put_line ('date today: '|| today);
--dbms_output.put_line ('date tomorrow: '|| tomorrow);
END;
/
--PRINT basic_percent;
--PRINT pf_percent;