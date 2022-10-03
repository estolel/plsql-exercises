SET SERVEROUTPUT ON
DECLARE
hello_world VARCHAR2(25);
today DATE:=SYSDATE;
tomorrow TODAY%TYPE;
BEGIN
hello_world :='world';
tomorrow := today+1;
dbms_output.put_line ('hello '|| hello_world);
dbms_output.put_line ('date today: '|| today);
dbms_output.put_line ('date tomorrow: '|| tomorrow);
END;