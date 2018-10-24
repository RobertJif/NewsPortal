create or replace procedure HapusArtikel
is
cursor e_data1 is
select id,judul from artikel where id=getviewartikel;
e_rec1 e_data1%rowtype;
begin
for e_rec1 in e_data1 loop
delete from artikel where id=e_rec1.id;
delete from kategori_artikel where id_artikel=e_rec1.id;
dbms_output.put_line('Artikel '||e_rec1.judul||' berhasil dihapus');
end loop;
commit;
end;
