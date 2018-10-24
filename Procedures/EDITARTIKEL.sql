create or replace procedure EditArtikel(input1 in varchar,input2 in varchar)
is
cursor e_data1 is
select id from artikel where id=getviewartikel;
e_rec1 e_data1%rowtype;
cursor e_data2 is
select judul from artikel where id=getviewartikel;
e_rec2 e_data2%rowtype;
begin
for e_rec1 in e_data1 loop
update artikel set judul=input1,deskripsi=input2 where id=e_rec1.id and to_date(tanggal)+getdue(id)<sysdate;
end loop;
commit;
for e_rec2 in e_data2 loop
dbms_output.put_line('Artikel '||e_rec2.judul||' berhasil diedit');
end loop;
end;
