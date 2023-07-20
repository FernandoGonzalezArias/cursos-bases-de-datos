--desafio guiado operaciones en una tabla
--PARTE 1
-- 2. creacion tabla post
create table post(
    id number,
    nombre_usuario varchar2(50),
    fecha_creacion date,
    contenido varchar2(300),
    descripcion varchar2(100),
    primary key (id)
);

--3. insertar 3 post, 2 para "pamela" y uno para "carlos"
insert into post values(1,'pamela',to_date('01-04-2022','dd-mm-yyyy'),'contenido del post 1','descripcion post 1');
insert into post values(2,'pamela',to_date('02-04-2022','dd-mm-yyyy'),'contenido del post 2','descripcion post 2');
insert into post values(3,'carlos',to_date('02-04-2022','dd-mm-yyyy'),'contenido del post 3','descripcion post 3');

select * from post;

--4. modificar la tabla post agregando la columna titulo
alter table post add titulo varchar2(10);

--5. agregar titulo a las publicaciones ya ingresadas
update post set titulo='titulo 1' where id=1;
update post set titulo='titulo 2' where id=2;
update post set titulo='titulo 3' where id=3;

--6 insertar 2 post para el usuario pedro
insert into post values(4,'pedro',to_date('05-04-2022','dd-mm-yyyy'),'contenido del post 4','descripcion post 4','titulo 4');
insert into post values(5,'pedro',to_date('05-04-2022','dd-mm-yyyy'),'contenido del post 5','descripcion post 5','titulo 5');

--7 eliminar el post de carlos
delete from post where nombre_usuario ='carlos'; 

--8 ingresar nuevo post para carlos
insert into post values(6,'carlos',to_date('06-04-2022','dd-mm-yyyy'),'contenido del post 3','descripcion post 6','titulo 6');
 
 --PARTE 2
 -- creacion de tabla comentario
 create table comentario(
    id number,
    fecha date,
    contenido varchar2(300),
    id_post number,
    foreign key (id_post) references post(id)
 );
 
 --crear 2 comentarios para el post de pamela y 4 para el de carlos
 INSERT into comentario values(1,to_date('01-04-2022','dd-mm-yyyy'),'el contenido del comentario 1 del post 1',1);
 INSERT into comentario values(2,to_date('01-04-2022','dd-mm-yyyy'),'el contenido del comentario 2 del post 1',1);
 
 INSERT into comentario values(3,to_date('06-04-2022','dd-mm-yyyy'),'el contenido del comentario 1 del post 6',6);
 INSERT into comentario values(4,to_date('06-04-2022','dd-mm-yyyy'),'el contenido del comentario 2 del post 6',6);
 INSERT into comentario values(5,to_date('07-04-2022','dd-mm-yyyy'),'el contenido del comentario 3 del post 6',6);
 INSERT into comentario values(6,to_date('07-04-2022','dd-mm-yyyy'),'el contenido del comentario 4 del post 6',6);
 
 SELECT * FROM comentario;
 
 --3 crear nuevo post para margarira
 insert into post values(7,'margarita',to_date('07-04-2022 13:30:00','dd-mm-yyyy HH24:MI.SS'),'contenido del post 7','descripcion post 7','titulo 7');
 
 
--4 ingresar5 comentarios para el post de margarita

 INSERT into comentario values(7,to_date('07-04-2022','dd-mm-yyyy'),'el contenido del comentario 1 del post 7',7);
 INSERT into comentario values(8,to_date('07-04-2022','dd-mm-yyyy'),'el contenido del comentario 2 del post 7',7);
 INSERT into comentario values(9,to_date('07-04-2022','dd-mm-yyyy'),'el contenido del comentario 3 del post 7',7);