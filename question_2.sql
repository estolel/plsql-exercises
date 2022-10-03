define a_number number;



begin 
    if MOD(&a_number,2) = 0 then
        dbms_output.put_line('EVEN!');
    elsif MOD(&a_number,2) > 0 then
        dbms_output.put_line('ODD!');
    end if;
end;
/