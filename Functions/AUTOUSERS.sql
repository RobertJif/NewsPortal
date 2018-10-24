create or replace function autousers
 return number is autoid number(10);
begin
 select max(id)+1 into autoid
 from users;
 return autoid;
end;
