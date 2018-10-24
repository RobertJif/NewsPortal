create or replace function autoviewartikel
 return number is autoid number(10);
begin
 select max(id)+1 into autoid
 from viewartikel;
 return autoid;
end;
