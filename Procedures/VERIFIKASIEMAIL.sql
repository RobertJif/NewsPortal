create or replace procedure VerifikasiEmail(input1 in varchar)
is
cursor e_data1 is
select id from users where email=input1;
e_rec1 e_data1%rowtype;
begin
for e_rec1 in e_data1 loop
update users set hak_akses=1 where id=e_rec1.id;
end loop;
commit;
dbms_output.put_line('Hi '||initcap(input1));
dbms_output.put_line('Verifikasi email berhasil! Ayo mulai menulis!!');
end;
