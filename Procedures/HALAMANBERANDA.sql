create or replace procedure HalamanBeranda
is
 cursor e_data is 
  select * from kategori;
  e_rec e_data%rowtype;
  cursor e_data2 is 
  select a.judul,
   a.tanggal,b.nama penulis,a.deskripsi isi from artikel a,users b
where a.id_user=b.id order by a.id desc;
  e_rec2 e_data2%rowtype;
begin
 dbms_output.put_line('------------------------------------News Portal Kami------------------------------------');
 for e_rec in e_data loop
  dbms_output.put( e_rec.nama ||'  ');
 end loop;
  dbms_output.put_line('');
  dbms_output.put_line('BERANDA');
  dbms_output.put_line('');
for e_rec2 in e_data2 loop
  dbms_output.put_line(''|| e_rec2.judul);
  dbms_output.put_line(''|| substr(e_rec2.isi,0,80)||' ...');
  dbms_output.put_line('Dipost : '|| e_rec2.tanggal);
  dbms_output.put_line('Oleh '||e_rec2.penulis);
  dbms_output.put_line('');
 end loop;
end;
