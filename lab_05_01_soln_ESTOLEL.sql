DROP TABLE messages;
CREATE TABLE messages (results VARCHAR2(80));
COMMIT;

begin 

    FOR i IN 1..10 LOOP
        if i != 6 AND i != 8 then
            insert into
                messages
            values
                (i);
        end if;
    END LOOP;
commit;
end;