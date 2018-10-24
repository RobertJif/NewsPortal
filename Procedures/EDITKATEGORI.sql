create or replace procedure EditKategori(input2 in char,input1 in char,input3 in number)
is
cursor e_data1 is
select id from kategori where upper(nama)=upper(input2);
e_rec1 e_data1%rowtype;
begin
for e_rec1 in e_data1 loop
update kategori set nama=initcap(input1),due=input3 where id=e_rec1.id;
dbms_output.put_line(case nvl(e_rec1.id,0) when 0 then 'Kategori dengan nama '||input2 ||' tidak ditemukan.' else 'Kategori '||initcap(input2)||' berhasil diubah menjadi '||initcap(input1) end);
end loop;
commit;
end;
