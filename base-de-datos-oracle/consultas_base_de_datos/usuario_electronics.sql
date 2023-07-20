create table productos (
    nombre varchar2(10),
    id number (5),
    fecha_creacion date,
    proveedor varchar2 (50),
    categoria varchar2(20),
    primary key (id)
);

create table ventas(
     fecha date,
     id_producto number(5),
     cliente varchar2 (50),
     metodo_pago varchar2(20),
     referencia number,
     foreign key (id_producto) references productos(id)
);

insert into productos (nombre, id, fecha_creacion, proveedor, categoria)
values ('tv rv-25',2468, to_date('2020-08-16','yyyy-mm-dd'), 'dende SPA','televisores');

SELECT * FROM productos;

insert into ventas(fecha,id_producto,cliente,metodo_pago,referencia)
values(to_date('2021-02-01','yyyy-mm-dd'),2468,'bruce lee','efectivo',34414);
insert into ventas (fecha,id_producto,cliente,metodo_pago,referencia)
values(to_date('2020-11-15','yyyy-mm-dd'),2468,'chuck norris','debito',43224);

select * from ventas;

update ventas set cliente='chuck norris norris' where referencia=43224;

update ventas set metodo_pago='credito' where referencia=43224; 

--borrado de tabla
create table ventas2(
     fecha date,
     id_producto number(5),
     cliente varchar2 (50),
     metodo_pago varchar2(20),
     referencia number,
     foreign key (id_producto) references productos(id)
);

insert into ventas2(fecha,id_producto,cliente,metodo_pago,referencia)
values(to_date('2021-02-01','yyyy-mm-dd'),2468,'bruce lee','efectivo',34414);
insert into ventas2 (fecha,id_producto,cliente,metodo_pago,referencia)
values(to_date('2020-11-15','yyyy-mm-dd'),2468,'chuck norris','debito',43224);

select * from ventas2;

delete from ventas2;

drop table ventas2;
--
SELECT * FROM productos;
--creacion y eleminicaion de columnas
--eliminar fecha creacion
alter table productos
drop (fecha_creacion);

--agregar nueva propiedad llamada color
alter table productos
add color varchar2 (15);
