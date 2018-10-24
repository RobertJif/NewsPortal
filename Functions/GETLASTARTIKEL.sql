create or replace function getlastartikel(input1 in varchar,input2 in varchar)
 return number is autoid number(10);
begin
 select id into autoid
 from artikel where judul=input1 and deskripsi=input2;
 return autoid;
end;
