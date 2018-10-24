create or replace procedure Login(input1 in char,input2 in char)
is
cursor e_data1 is
select id,nama,email,hak_akses,level_user from users where email=input1 and password=input2 and hak_akses=1;
e_rec1 e_data1%rowtype;
begin
for e_rec1 in e_data1 loop
insert into loggedin values(e_rec1.id,e_rec1.email,e_rec1.nama,e_rec1.hak_akses,e_rec1.level_user);
end loop;
commit;
dbms_output.put_line(case nvl(getusersession,0) when 0 then 'You must first verified your email, Login Failed' else 'Login Successful' end);
end;
