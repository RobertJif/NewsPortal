create or replace procedure TambahArtikel(input1 in varchar,input2 in varchar,input3 in varchar)
is
cursor e_data1 is
select * from loggedin;
e_rec1 e_data1%rowtype;
cursor e_data2 is
select id from kategori where upper(nama)=upper(input3);
e_rec2 e_data2%rowtype;
begin
for e_rec1 in e_data1 loop
insert into artikel values(autoartikel,input1,sysdate,input2,1,e_rec1.id);
end loop;
commit;
for e_rec2 in e_data2 loop
insert into kategori_artikel values(autokategori_artikel,getlastartikel(input1,input2),e_rec2.id);
dbms_output.put_line('Terima kasih telah menulis artikel!!');
dbms_output.put_line('Artikel akan direview oleh Team Liputan Bohong.');
dbms_output.put_line('ID artikel anda adalah '||getlastartikel(input1,input2));
end loop;
commit;
end;
