create or replace function getviewartikel
 return number is autoid number(10);
begin
 select id_artikel into autoid from viewartikel where id_user=getusersession() and id=(select max(id) from viewartikel);
 return autoid;
end;
