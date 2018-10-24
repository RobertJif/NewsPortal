create or replace procedure TambahRekening(input1 in char,input2 in char)
is
cursor e_data1 is
select id from loggedin;
e_rec1 e_data1%rowtype;
begin
for e_rec1 in e_data1 loop
insert into rekening values(autorekening,input1,input2,e_rec1.id);
end loop;
commit;
dbms_output.put_line('Kategori Berhasil Ditambahkan');
end;
