create or replace procedure Daftar(input1 in varchar,input2 in varchar,input3 in varchar)
is
cursor e_data1 is
select * from loggedin;
e_rec1 e_data1%rowtype;
begin
insert into users values(autousers,input3,input1,input2,0,2);
commit;
dbms_output.put_line('Hi '||initcap(input1));
dbms_output.put_line('Silahkan melakukan verifikasi email anda!');
end;
