create or replace function autoartikel
 return number is autoid number(10);
begin
 select max(id)+1 into autoid
 from artikel;
 return autoid;
end;
