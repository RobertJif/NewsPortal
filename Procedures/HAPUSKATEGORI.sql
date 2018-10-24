create or replace procedure HapusKategori(input1 in varchar)
is
cursor e_data1 is
select id from kategori where upper(nama)=upper(input1);
e_rec1 e_data1%rowtype;
begin
for e_rec1 in e_data1 loop
delete from kategori where id=e_rec1.id;
dbms_output.put_line('Kategori '||initcap(input1)||' berhasil dihapus');
end loop;
commit;
end;
