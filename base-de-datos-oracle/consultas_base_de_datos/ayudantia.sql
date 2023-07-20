/*CREACION DE LAS TABLAS*/
CREATE TABLE BOOTCAMP
(
ID NUMBER,
NOMBRE VARCHAR(30),
DESCRIPCION VARCHAR(150),
DURACION_MESES INT,
PRIMARY KEY(ID)
);

CREATE TABLE RELATOR
(
RUT VARCHAR(15),
NOMBRE VARCHAR(15),
TIPOCONTRATO VARCHAR(15),
SUELDO NUMBER,
ID_BOOTCAMP NUMBER,
PRIMARY KEY(RUT),
FOREIGN KEY(ID_BOOTCAMP) REFERENCES BOOTCAMP(ID)
);

CREATE TABLE ALUMNOS
(
RUT VARCHAR(15),
NOMBRE VARCHAR(30),
CORREO VARCHAR(30),
TELEFONO VARCHAR(15),
ID_BOOTCAMP NUMBER,
RUT_RELATOR VARCHAR(15),
PRIMARY KEY(RUT),
FOREIGN KEY(RUT_RELATOR) REFERENCES RELATOR(RUT),
FOREIGN KEY(ID_BOOTCAMP) REFERENCES BOOTCAMP(ID)
);

/*poblando tablas*/
insert into bootcamp (ID,NOMBRE,DESCRIPCION,DURACION_MESES)values(1,'Full stack java','bootcamp para aprender Java y otros lenguajes',5);
insert into bootcamp (ID,NOMBRE,DESCRIPCION,DURACION_MESES)values(2,'Programacion y diseño UX/IU','bootcamp para aprender diseño web',4);
insert into bootcamp (ID,NOMBRE,DESCRIPCION,DURACION_MESES)values(3,'Full stack javascript','bootcamp para aprender javascript y otros lenguajes',5);
insert into bootcamp (ID,NOMBRE,DESCRIPCION,DURACION_MESES)values(4,'Ciencia de datos','bootcamp para aprender a manejar datos',5);

insert into relator(RUT, NOMBRE, TIPOCONTRATO, SUELDO, ID_BOOTCAMP)values ('16018433-3','Walter White','honorario',2000000,1);
insert into relator(RUT, NOMBRE, TIPOCONTRATO, SUELDO, ID_BOOTCAMP)values ('16018444-3','Steve Austin','honorario',1500000,2);
insert into relator(RUT, NOMBRE, TIPOCONTRATO, SUELDO, ID_BOOTCAMP)values ('16018555-3','Vicente McMAn','contrato',2000000,3);
insert into relator(RUT, NOMBRE, TIPOCONTRATO, SUELDO, ID_BOOTCAMP)values ('16018777-3','Juana Snow','contrato',1200000,4);

insert into alumnos(RUT, NOMBRE, CORREO, TELEFONO, ID_BOOTCAMP, RUT_RELATOR) values('1111111-1','Juan Perez','juanP@mimail.com','5555555',1,'16018433-3');
insert into alumnos(RUT, NOMBRE, CORREO, TELEFONO, ID_BOOTCAMP, RUT_RELATOR) values('2222222-2','Alan Brito','alanB@mimail.com','7777777',1,'16018433-3');
insert into alumnos(RUT, NOMBRE, CORREO, TELEFONO, ID_BOOTCAMP, RUT_RELATOR) values('3333333-3','Jesse Pinkman','jpinkman@mimail.com','8888888',1,'16018433-3');
insert into alumnos(RUT, NOMBRE, CORREO, TELEFONO, ID_BOOTCAMP, RUT_RELATOR) values('4444444-3','Barbara Flores','cami@mimail.com','44444444',2,'16018444-3');
insert into alumnos(RUT, NOMBRE, CORREO, TELEFONO, ID_BOOTCAMP, RUT_RELATOR) values('5555555-1','Alvaro Soto','alvaro@mimail.com','99999',2,'16018444-3');
insert into alumnos(RUT, NOMBRE, CORREO, TELEFONO, ID_BOOTCAMP, RUT_RELATOR) values('7777777-2','Felipe Sureda','alanB@mimail.com','7777777',4,'16018777-3');
insert into alumnos(RUT, NOMBRE, CORREO, TELEFONO, ID_BOOTCAMP, RUT_RELATOR) values('8888888-3','Skayler White','skayler@mimail.com','8888888',4,'16018777-3');

select * from bootcamp;
select * from relator;
select * from alumnos;

--joineo mediante la comparativa de clave primaria de tabla bootcamp (id)
--y la foranea en alumnos(id_bootcamp)
--datos de alumnos y nombre de el bootcamp al que pertenece
select a.rut, a.nombre, a.correo, b.descripcion from alumnos a inner join bootcamp b on a.id_bootcamp= b.id;

--relator que gana 2000000
select rut, nombre from relator where sueldo=2000000;

--profesores que trabajan como honorarios
select * from relator where tipocontrato='honorario';

-- que su correo comience con 'al' o su bootcamp sea codigo 1
select * from alumnos
where correo like 'al%' or id_bootcamp=1 ;

--bootcamp que duren menos de 5 meses
select * from bootcamp where duracion_meses<5;
select * from bootcamp where duracion_meses<=5;
select * from bootcamp where duracion_meses<5;

--alumnos cuyo bootcamp no sea full stack java
select rut, nombre from alumnos where id_bootcamp !=1;

select a.rut, a.nombre from alumnos a inner join bootcamp b on a.id_bootcamp=b.id
where upper(b.nombre) not like upper ('%FULL stack java%') ;

-- relatores que pertenezcan a bootcamp 1 o 2
select * from relator where id_bootcamp in(1,2);

--el mayor sueldo de relatores
select max(sueldo) from relator;

-- el menor sueldo relatores
select min(sueldo) from relator;

-- cantidad de bootcamp que son full stack
select count(id) cantidad_full_stack from bootcamp where nombre like '%Full stack%';

-- suma de sueldo de relatores contratados
select sum(sueldo) suma_sueldos from relator where tipocontrato='contrato';

-----------EJERCICIOS-----------------

--1 suma cantidad de bootcamp que no son full stack
select count(id) cantidad from bootcamp b where b.nombre not like ('%Full stack %');

--2 suma de sueldos de docentes que trabajan como honorarios
select sum(sueldo) suma_sueldos_honorarios from  relator  where tipocontrato='honorario';

--3 largo del correo mas extenso de alumnos(muestre solo el numero)
 select max(length(correo)) correo_mas_extenso from alumnos ;
 
--4 nombre del bootcamp que dura menos
select nombre from bootcamp where duracion_meses=(select min (duracion_meses)from bootcamp);

-- group by
--contar cantidad de relatores por cada tipo de contrato
select count(tipocontrato)cantidad,tipocontrato from relator group by tipocontrato;

--sumar sueldos relatores segun tipo de contrato
select sum(sueldo)suma_sueldos, tipocontrato from relator group by tipocontrato;

--inner join
select * from relator r inner join bootcamp b on r.id_bootcamp=b.id;
select * from bootcamp;
select * from relator;

insert into bootcamp values(5,'Emprendimiento digital','bootcamp para aprender programacion y administracion',4);
insert into relator values('20111222-1','Pepe Lota', 'honorario',1100000,null);

--left join
select * from relator r left join bootcamp b on r.id_bootcamp=b.id;
-- si quisiera saber que relator no tiene asignado aun un bootcamp
select r.rut, r.nombre from relator r left join bootcamp b on r.id_bootcamp=b.id
where b.id is null;

select * from bootcamp  left join relator on bootcamp.id=relator.id_bootcamp;

-- si quisieramos saber los bootcamp que no tienen asignado un docente
select bootcamp.id, bootcamp.nombre from bootcamp  left join relator on bootcamp.id=relator.id_bootcamp
where relator.rut is null;

select * from bootcamp;
select * from relator;
select * from alumnos;
---------- EJERCICIOS 2---------    
--1. Nombre del relator y alumno, donde el relator tiene el rut 16018433-3.
select r.nombre nombre_relator, a.nombre nombre_alumno from relator r inner join alumnos a
on r.rut=a.rut_relator
where r.rut= '16018433-3';

--2. Nombre y duración de los bootcamp en donde los relatores ganan 2 millones.
select b.nombre, b.duracion_meses duracion from bootcamp b inner join relator r on
b.id=r.id_bootcamp where r.sueldo=2000000;

--3. Muestre el nombre y cantidad de alumnos de los profesores. (pista: use group by).
select r.nombre, count(a.rut) from alumnos a inner join relator r on a.rut_relator=r.rut
group by r.nombre ;

--4. Muestre el nombre y la descripción de los bootcamp que no tienen alumnos.
select b.nombre, b.descripcion from bootcamp b left join alumnos a on b.id=a.id_bootcamp
where a.rut is null;

--.