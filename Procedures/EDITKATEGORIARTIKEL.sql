create or replace procedure EditKategoriArtikel(input2 in varchar,input1 in varchar)
is
cursor e_data1 is
select id from kategori_artikel where id_artikel=getviewartikel and id_kategori=(select id from kategori where upper(nama)=upper(input2));
e_rec1 e_data1%rowtype;
cursor e_data2 is
select judul from artikel where id=getviewartikel;
e_rec2 e_data2%rowtype;
begin
for e_rec1 in e_data1 loop
update kategori_artikel set id_kategori=(select id from kategori where upper(nama)=upper(input1)) where id=e_rec1.id;
end loop;
commit;
for e_rec2 in e_data2 loop
dbms_output.put_line('Kategori '||initcap(input2)||' untuk judul artikel '||e_rec2.judul||' berhasil diubah menjadi '||initcap(input1));
end loop;
end;
