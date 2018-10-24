create or replace procedure TambahKategoriArtikel(input1 in varchar)
is
cursor e_data1 is
select id from kategori where upper(nama)=upper(input1);
e_rec1 e_data1%rowtype;
cursor e_data2 is
select judul from artikel where id=getviewartikel;
e_rec2 e_data2%rowtype;
begin
for e_rec1 in e_data1 loop
insert into kategori_artikel values(autokategori_artikel,getviewartikel,e_rec1.id);
end loop;
commit;
for e_rec2 in e_data2 loop
dbms_output.put_line('Kategori '||initcap(input1)||' berhasil ditambahkan untuk artikel dengan judul '||e_rec2.judul);
end loop;
end;
