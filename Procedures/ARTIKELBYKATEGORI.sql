create or replace procedure ArtikelbyKategori (input1 in char)
is
 cursor e_data is select artikel.judul, artikel.tanggal, artikel.deskripsi ,(select nama from users where id=artikel.id_user) penulis 
from artikel
join kategori_artikel
on artikel.id=kategori_artikel.id_artikel and kategori_artikel.id_kategori=(select id from kategori where lower(nama)=input1);
 e_rec e_data%rowtype;
begin
 dbms_output.put_line('----------------------------------------News Portal Kami----------------------------------------');
 for e_rec in e_data loop
  dbms_output.put_line(''||e_rec.judul );
  dbms_output.put_line(''|| substr(e_rec.deskripsi,0,80)||' ...' );
  dbms_output.put_line('Dipost :'||e_rec.tanggal );
  dbms_output.put_line('Oleh :'|| e_rec.penulis);
  dbms_output.put_line('');
end loop;
end;
