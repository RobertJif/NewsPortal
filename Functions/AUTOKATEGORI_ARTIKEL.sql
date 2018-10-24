create or replace function autokategori_artikel
 return number is autoid number(10);
begin
 select max(id)+1 into autoid
 from kategori_artikel;
 return autoid;
end;
