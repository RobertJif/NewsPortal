create or replace procedure Logout
is
cursor e_data1 is
select id from users;
e_rec1 e_data1%rowtype;
begin
delete from loggedin;
commit;
dbms_output.put_line('You are no longer logged in');
end;
