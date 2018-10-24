create or replace function autorekening
 return number is autoid number(22);
begin
 select max(id)+1 into autoid
 from rekening;
 return autoid;
end;
