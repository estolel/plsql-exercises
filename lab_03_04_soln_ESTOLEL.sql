VARIABLE basic_percent NUMBER
VARIABLE pf_percent NUMBER
SET SERVEROUTPUT ON

PROMPT Please enter your employee number.
ACCEPT employee_number prompt 'Please enter your employee number.';

DECLARE
    hello_world VARCHAR2(25);
    today DATE:=SYSDATE;
    tomorrow TODAY%TYPE;
    fname VARCHAR2(15);
    emp_sal NUMBER(10);
    emp_basic_sal NUMBER(10,3);
    emp_contribution NUMBER(10,3);
BEGIN
    hello_world :='world';
    tomorrow := today+1;
    :basic_percent:=45;
    :pf_percent:=12;

SELECT first_name, salary INTO fname, emp_sal FROM hr.employees WHERE employee_id='&employee_number' ;




emp_contribution:=(emp_sal*(:basic_percent/100))*(:pf_percent/100);

dbms_output.put_line ('Hello '|| fname);
dbms_output.put_line ('YOUR SALARY IS: '|| emp_sal);
dbms_output.put_line ('YOUR CONTRIBUTION TOWARDS PF: '|| emp_contribution);

--dbms_output.put_line ('date today: '|| today);
--dbms_output.put_line ('date tomorrow: '|| tomorrow);
END;
/
--PRINT basic_percent;
--PRINT pf_percent;