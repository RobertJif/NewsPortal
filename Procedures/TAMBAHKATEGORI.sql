create or replace procedure TambahKategori(input1 in varchar)
is
cursor e_data1 is
select * from loggedin;
e_rec1 e_data1%rowtype;
begin
for e_rec1 in e_data1 loop
insert into kategori values(autokategori,input1);
end loop;
commit;
dbms_output.put_line('Kategori Berhasil Ditambahkan');
end;
