define a_number number;

declare
asterisk varchar(255);
begin 
    for i in 1..&a_number
    LOOP
        asterisk := '';
        for x in 1..i
        LOOP
            asterisk := concat(asterisk, '*');
        END LOOP;
        dbms_output.put_line(asterisk);
    END LOOP;
end;
/