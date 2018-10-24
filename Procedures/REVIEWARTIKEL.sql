create or replace procedure ReviewArtikel(input1 in varchar,input2 in number)
is
cursor e_data1 is
select id,case upper(input1) when 'TERIMA' then 2 when 'TOLAK' then 3 else 1 end stats,judul from artikel where id=input2;
e_rec1 e_data1%rowtype;
begin
for e_rec1 in e_data1 loop
update artikel set status=e_rec1.stats where id=e_rec1.id;
dbms_output.put_line('Artikel '||e_rec1.judul||' berhasil di'||lower(input1));
end loop;
commit;
end;
