create or replace function getusersession
 return number is autoid number(10);
begin
 select max(id) into autoid
 from loggedin;
 return autoid;
end;
