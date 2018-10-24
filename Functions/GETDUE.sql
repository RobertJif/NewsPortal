create or replace function getdue(input1 in number)
 return number is autoid number(22);
begin
 select sum(b.due) into autoid
 from kategori_artikel a,kategori b
 where a.id_artikel=input1
 group by a.id_artikel;
 return autoid;
end;
