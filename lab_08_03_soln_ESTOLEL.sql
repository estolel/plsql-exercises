SET SERVEROUPUT ON

declare
    childrecord_exists exception;
    pragma EXCEPTION_INIT(childrecord_exists, -02292);
begin
    dbms_output.put_line('Deleting department 40.....');
    delete from hr.departments where department_id=40;
exception
    when childrecord_exists then
        dbms_output.put_line('Error: '||SQLERRM);
end;

