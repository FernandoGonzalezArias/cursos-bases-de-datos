--creación de tabla pizzas
create table pizzas(
 id number primary key,
 stock number check(stock>=0),
 costo number,
 nombre varchar2(30)
);

create table ventas(
    cliente varchar2(30),
    fecha date,
    monto number,
    pizza number,
    foreign key(pizza) references pizzas(id)
);

--4. Agregar 1 registro a la tabla “pizzas” seteando como stock inicial 0.
commit;
insert into pizzas values(1,0,12000,'Fugaza');
commit;

select * from pizzas;
select * from ventas;
--5. Realizar una transacción que registre una nueva pizza con un stock positivo mayor a 1.
insert into pizzas values(2,10,13000,'Cuatro estaciones');
commit;

--6. Realizar una transacción que registre una venta con la pizza con stock 0 e intentar actualizar su stock restándole 1.
set transaction name 'restar stock';
insert into ventas values('Donatello',to_date('12-04-2022','dd-mm-yyyy'),12000,1);
update pizzas set stock= stock -1 where id=1;
rollback;

--7 Realizar una transacción que intente registrar 1 venta por cada pizza, guardando un SAVEPOINT luego de la primera venta 
--y volviendo a este punto si surge un error.
