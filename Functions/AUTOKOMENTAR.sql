create or replace function autokomentar
 return number is autoid number(10);
begin
 select max(id)+1 into autoid
 from komentar;
 return autoid;
end;
