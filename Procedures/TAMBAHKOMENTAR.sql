create or replace procedure TambahKomentar(input1 in varchar)
is
cursor e_data1 is
select * from viewartikel where id_user=getusersession() and id=(select max(id) from viewartikel);
e_rec1 e_data1%rowtype;
begin
dbms_output.put_line('Komentar Berhasil Ditambahkan');
for e_rec1 in e_data1 loop
insert into komentar values(autokomentar,input1,e_rec1.id_artikel,e_rec1.id_user);
HalamanArtikel(e_rec1.id_artikel);
end loop;
commit;
end;
