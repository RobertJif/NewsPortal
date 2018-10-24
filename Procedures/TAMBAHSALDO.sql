create or replace procedure TambahSaldo(input1 in number,input2 in number)
is
cursor e_data1 is
select id from loggedin;
e_rec1 e_data1%rowtype;
begin
for e_rec1 in e_data1 loop
UPDATE users SET saldo=CASE  
WHEN e_rec1.id = 1 THEN saldo+input2
ELSE saldo+0
END;
end loop;
commit;
end;
