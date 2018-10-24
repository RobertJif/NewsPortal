create or replace procedure HapusKategoriArtikel(input1 in varchar)
is
cursor e_data1 is
select id from kategori where upper(nama)=upper(input1);
e_rec1 e_data1%rowtype;
cursor e_data2 is
select judul from artikel where id=getviewartikel;
e_rec2 e_data2%rowtype;
begin
for e_rec1 in e_data1 loop
delete from kategori_artikel where id_kategori=e_rec1.id and id_artikel=getviewartikel;
end loop;
for e_rec2 in e_data2 loop
dbms_output.put_line('Kategori '||initcap(input1)||' untuk artikel '||e_rec2.judul||' berhasil dihapus');
end loop;
commit;
end;
