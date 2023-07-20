-- creacion tabla rol

create table rol(
    id number,
    nombre varchar2(15),
    descripcion varchar2(100),
    primary key (id)--clave primaria 

);

--creacion tabla usuario
create table usuario(
    rut varchar2(12) primary key,
    nombre varchar2(50),
    telefono varchar2(15),
    mail varchar2(25),
    genero char(1),
    fecha_nacimiento date,
    id_rol number,
    foreign key (id_rol)references rol(id)--clave foranea

);

--poblando tabla rol
insert into rol values(1,'administrador','control total');
insert into rol values(2,'marketing','editar y crear anuncios');
insert into rol values(3,'editor','editar articulos');
insert into rol values(4,'suscriptor','leer articulos');

--poblando tabla usuario
alter table usuario modify mail varchar2(25);
insert into usuario values('1-9','juan soto','9999999','juan.soto@gmail.com','m',to_date('24-06-2000','dd-mm-yyyy'),1);
insert into usuario values('2-7','jorge perez','88888888','jorge.perez@gmail.com','m',to_date('12-03-1998','dd-mm-yyyy'),4);
insert into usuario values('3-5','sara morales','7777777','sara.morales@gmail.com','f',to_date('11-02-1990','dd-mm-yyyy'),null);

select* from rol;
select * from usuario;

--inner join(registros en comun)
select * from usuario u inner join rol r
on u.id_rol=r.id;

--left join(muestra todos los registros de la  tabla izquierda,
--tengan o no la cvlave foranea referenciada en la tabla derecha)
select * from usuario u left join rol r
on u.id_rol=r.id;

--(left join)roles que no han sido asignados a ningun usuario
select r.id,r.nombre, r.descripcion from rol r left join usuario u
on r.id=u.id_rol
where u.id_rol is null;

--full outer join
select * from usuario u full outer join rol r
on u.id_rol=r.id;

-- full outer join sin comunes
select * from usuario u full outer join rol r
on u.id_rol=r.id where u.id_rol is null or r.id is null ; 