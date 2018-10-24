create or replace procedure HalamanArtikel(id_artikel_param in number)
is
cursor e_data1 is
select a.id,judul, deskripsi,tanggal, case status when 1 then 'Pending' when 2 then 'Diterima' when 3 then 'Ditolak' else 'Deleted' end status, b.nama
from artikel a
join users b
on a.id_user=b.id
where a.id=id_artikel_param and status=2;
e_rec1 e_data1%rowtype;
cursor e_data2 is
select komentar.id, komentar.deskripsi , users.id "id_user", users.nama penulis
from komentar
join users
on komentar.id_user=users.id
where komentar.id_artikel=id_artikel_param;
e_rec2 e_data2%rowtype;
cursor e_data3 is
select distinct kategori.nama kategori, id_artikel,id_kategori
from kategori_artikel, artikel, kategori
where artikel.id=id_artikel_param and kategori_artikel.id_artikel=artikel.id and kategori.id=kategori_artikel.id_kategori
order by artikel.id;
e_rec3 e_data3%rowtype;
begin
dbms_output.put_line('----------LIPUTAN BOHONG----------');
for e_rec1 in e_data1 loop
dbms_output.put_line(''||e_rec1.judul);
dbms_output.put_line('Dipost oleh: '||e_rec1.nama||' pada '||e_rec1.tanggal);
dbms_output.put_line('');
dbms_output.put_line(e_rec1.deskripsi);
dbms_output.put_line('');
insert into viewartikel values(autoviewartikel,e_rec1.id,getusersession);
end loop;
dbms_output.put_line('Kategori ');
for e_rec3 in e_data3 loop
dbms_output.put(e_rec3.kategori||' ');
end loop;
dbms_output.put_line('');
dbms_output.put_line('');
dbms_output.put_line('Komentar');
for e_rec2 in e_data2 loop
dbms_output.put_line(e_rec2.penulis||' mengatakan');
dbms_output.put_line(e_rec2.deskripsi||' ');
dbms_output.put_line('');
end loop;
dbms_output.put_line('');
end;
