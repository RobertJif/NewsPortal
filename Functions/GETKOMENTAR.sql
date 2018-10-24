create or replace FUNCTION getKomentar(input1 in number)
RETURN CLIENT_table_type
PIPELINED
AS
BEGIN
   FOR v_Rec IN (select komentar.id, komentar.deskripsi , users.id "id_user", users.nama "Nama Penulis"
from komentar
join users
on komentar.id_user=users.id
where komentar.id_artikel=input1) LOOP
      PIPE ROW (CLIENT_type(v_Rec.CLIENT_Id, v_Rec.CLIENT_Group));
   END LOOP;
RETURN;
END;
