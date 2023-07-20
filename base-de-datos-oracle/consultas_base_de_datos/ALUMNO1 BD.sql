
CREATE TABLE cuentas (
numero_cuenta NUMBER NOT NULL  PRIMARY KEY,
balance NUMBER CHECK (balance >= 0)
-- check valida la condición que el monto sea mayor a cero
);

select* from cuentas;

insert into cuentas values(1,1000);
insert into cuentas values(2,1000);

commit;
set transaction name 'cuentas_update';
update cuentas set balance =balance -1000 where numero_cuenta=1;
update cuentas set balance =balance +1000 where numero_cuenta=2;
commit;

commit;
set transaction name 'cuentas_update2';
update cuentas set balance =balance +1000 where numero_cuenta=2;
update cuentas set balance =balance -1000 where numero_cuenta=1;
rollback;

commit;
set transaction name 'crea_cuenta';
insert into cuentas values (3,5000);
savepoint nueva_cuenta;
update cuentas set balance =balance +3000 where numero_cuenta=3;
update cuentas set balance =balance -3000 where numero_cuenta=2;
rollback to nueva_cuenta;

show autocommit;
set autocommit on;

