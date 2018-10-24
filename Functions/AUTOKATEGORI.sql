create or replace function autokategori
 return number is autoid number(10);
begin
 select max(id)+1 into autoid
 from kategori;
 return autoid;
end;
