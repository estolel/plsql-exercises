
DEFINE input_char VARCHAR2;

declare
    ascii_value NUMBER;
    is_upper boolean;
BEGIN
    ascii_value := ASCII('&input_char');
    dbms_output.put_line(ascii_value);
    if ascii_value > 96 AND ascii_value <123 then
        dbms_output.put_line('LOWERCASE!');
    elsif ascii_value > 64 AND ascii_value <91  then
        dbms_output.put_line('UPPERCASE!');
    else
        dbms_output.put_line('INVALID!');
    end if;
end;
