 -- creacion tabla usuario
create table usuario(
   id number primary key,
   email varchar2(25)
);

-- creacion tabla post
create table post(
   id number primary key,
   usuario_id number,
   titulo varchar2(80),
   fecha date,
   foreign key(usuario_id)references usuario(id)
);

--creacion tabla de comentario
create table comentario(
   id number primary key,
   post_id number,
   usuario_id number,
   texto varchar2(300),
   fecha date,
   foreign key(post_id) references post(id),
   foreign key(usuario_id) references usuario(id)
);

--poblado de datos
INSERT INTO USUARIO(ID, EMAIL) VALUES ( 1 ,'usuario01@hotmail.com');
INSERT INTO USUARIO(ID, EMAIL) VALUES ( 2 , 'usuario02@gmail.com');
INSERT INTO USUARIO(ID, EMAIL) VALUES ( 3 , 'usuario03@gmail.com');
INSERT INTO USUARIO(ID, EMAIL) VALUES ( 4 , 'usuario04@hotmail.com');
INSERT INTO USUARIO(ID, EMAIL) VALUES ( 5 , 'usuario05@yahoo.com');
INSERT INTO USUARIO(ID, EMAIL) VALUES ( 6 , 'usuario06@hotmail.com');
INSERT INTO USUARIO(ID, EMAIL) VALUES ( 7 , 'usuario07@yahoo.com');
INSERT INTO USUARIO(ID, EMAIL) VALUES ( 8 , 'usuario08@yahoo.com');
INSERT INTO USUARIO(ID, EMAIL) VALUES ( 9 , 'usuario09@yahoo.com');

INSERT INTO POST (ID, USUARIO_ID, TITULO, FECHA) VALUES ( 1 , 1 , 'Post 1: Esto es malo', TO_DATE(' 2020-06-29 ', 'yyyy-mm-dd'));
INSERT INTO POST (ID, USUARIO_ID, TITULO, FECHA) VALUES ( 2 , 5 , 'Post 2: Esto es malo', TO_DATE(' 2020-06-20 ', 'yyyy-mm-dd'));
INSERT INTO POST (ID, USUARIO_ID, TITULO, FECHA) VALUES ( 3 , 1 , 'Post 3: Esto esexcelente', TO_DATE(' 2020-05-30 ', 'yyyy-mm-dd'));
INSERT INTO POST (ID, USUARIO_ID, TITULO, FECHA) VALUES ( 4 , 9 , 'Post 4: Esto es bueno',TO_DATE(' 2020-05-09 ', 'yyyy-mm-dd'));
INSERT INTO POST (ID, USUARIO_ID, TITULO, FECHA) VALUES ( 5 , 7 , 'Post 5: Esto es bueno ',TO_DATE(' 2020-07-10 ', 'yyyy-mm-dd'));
INSERT INTO POST (ID, USUARIO_ID, TITULO, FECHA) VALUES ( 6 , 5 , 'Post 6: Esto es excelente ', TO_DATE(' 2020-07-18 ', 'yyyy-mm-dd'));
INSERT INTO POST (ID, USUARIO_ID, TITULO, FECHA) VALUES ( 7 , 8 , 'Post 7: Esto es excelente ', TO_DATE(' 2020-07-07 ', 'yyyy-mm-dd'));
INSERT INTO POST (ID, USUARIO_ID, TITULO, FECHA) VALUES ( 8 , 5 , 'Post 8: Esto es excelente ', TO_DATE(' 2020-05-14 ', 'yyyy-mm-dd'));
INSERT INTO POST (ID, USUARIO_ID, TITULO, FECHA) VALUES ( 9 , 2 , 'Post 9: Esto es bueno',TO_DATE(' 2020-05-08 ', 'yyyy-mm-dd'));
INSERT INTO POST (ID, USUARIO_ID, TITULO, FECHA) VALUES ( 10 , 6 , 'Post 10: Esto es bueno', TO_DATE(' 2020-06-02 ', 'yyyy-mm-dd'));
INSERT INTO POST (ID, USUARIO_ID, TITULO, FECHA) VALUES ( 11 , 4 , 'Post 11: Esto es bueno', TO_DATE(' 2020-05-05 ', 'yyyy-mm-dd'));
INSERT INTO POST (ID, USUARIO_ID, TITULO, FECHA) VALUES ( 12 , 9 , 'Post 12: Esto es malo', TO_DATE(' 2020-07-23 ', 'yyyy-mm-dd'));
INSERT INTO POST (ID, USUARIO_ID, TITULO, FECHA) VALUES ( 13 , 5 , 'Post 13: Esto es excelente',TO_DATE(' 2020-05-30 ', 'yyyy-mm-dd'));
INSERT INTO POST (ID, USUARIO_ID, TITULO, FECHA) VALUES ( 14 , 8 , 'Post 14: Esto es excelente', TO_DATE(' 2020-05-01 ', 'yyyy-mm-dd'));
INSERT INTO POST (ID, USUARIO_ID, TITULO, FECHA) VALUES ( 15 , 7 , 'Post 15: Esto es malo',TO_DATE(' 2020-06-17 ', 'yyyy-mm-dd'));

INSERT INTO COMENTARIO (ID, USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES ( 1 , 3 , 1 , 'Este es el comentario 1 ', TO_DATE(' 2020-07-08 ', 'yyyy-mm-dd'));
INSERT INTO COMENTARIO (ID, USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES ( 2 , 4 , 2 , 'Este es el comentario 2 ', TO_DATE(' 2020-06-07 ', 'yyyy-mm-dd'));
INSERT INTO COMENTARIO (ID, USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES ( 3 , 6 , 3 , 'Este es el comentario 3 ', TO_DATE(' 2020-06-16 ', 'yyyy-mm-dd'));
INSERT INTO COMENTARIO (ID, USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES ( 4 , 2 , 4 , 'Este es el comentario 4 ', TO_DATE(' 2020-06-15 ', 'yyyy-mm-dd'));
INSERT INTO COMENTARIO (ID, USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES ( 5 , 6 , 5 , 'Este es el comentario 5 ', TO_DATE(' 2020-05-14 ', 'yyyy-mm-dd'));
INSERT INTO COMENTARIO (ID, USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES ( 6 , 3 , 6 , 'Este es el comentario 6 ', TO_DATE(' 2020-07-08 ', 'yyyy-mm-dd'));
INSERT INTO COMENTARIO (ID, USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES ( 7 , 6 , 7 , 'Este es el comentario 7 ', TO_DATE(' 2020-05-22 ', 'yyyy-mm-dd'));
INSERT INTO COMENTARIO (ID, USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES ( 8 , 6 , 8 , 'Este es el comentario 8 ', TO_DATE(' 2020-07-09 ', 'yyyy-mm-dd'));
INSERT INTO COMENTARIO (ID, USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES ( 9 , 8 , 9 , 'Este es el comentario 9 ', TO_DATE(' 2020-06-30 ', 'yyyy-mm-dd'));
INSERT INTO COMENTARIO (ID, USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES ( 10 , 8 , 10 , 'Este es el comentario 10',TO_DATE(' 2020-06-19 ', 'yyyy-mm-dd'));
INSERT INTO COMENTARIO (ID, USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES ( 11 , 5 , 11 , 'Este es el comentario 11',TO_DATE(' 2020-05-09 ', 'yyyy-mm-dd'));
INSERT INTO COMENTARIO (ID, USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES ( 12 , 8 , 12 , 'Este es el comentario 12',TO_DATE(' 2020-06-17 ', 'yyyy-mm-dd'));
INSERT INTO COMENTARIO (ID, USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES ( 13 , 1 , 13 , 'Este es el comentario 13',TO_DATE(' 2020-05-01 ', 'yyyy-mm-dd'));
INSERT INTO COMENTARIO (ID, USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES ( 14 , 2 , 14 , 'Este es el comentario 14',TO_DATE(' 2020-05-31 ', 'yyyy-mm-dd'));
INSERT INTO COMENTARIO (ID, USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES ( 15 , 4 , 15 , 'Este es el comentario 15',TO_DATE(' 2020-06-28 ', 'yyyy-mm-dd'));

--consultas
select * from usuario;
select * from post;
select * from comentario;

--4. seleccionar el correo, id y titulo de todos los post publicados por el usuario
select u.email, p.id, p.titulo from usuario u inner join post p
on u.id=p.usuario_id;

--5. listar el correo, id y el detalle de todos los comentarios
-- que no hayan sido realizados por el usuario con email usuario06@hotmail.com
select u.email, c.id, c.texto from usuario u inner join comentario c 
on u.id=c.usuario_id where u.email<> 'usuario06@hotmail.com' ;

--6. listar los usuarios que no hayan publicado ningun post
select * from usuario u left join post p 
on u.id=p.usuario_id where p.usuario_id is null;

--7. listar todos los post con sus comentarios ( incluyendo aquellos 
-- que no poseen comentarios)
select * from post p inner join comentario c on 
p.id=c.post_id;

--8. listar todos los usuarios que hayan publicado post en junio
select * from usuario u inner join post p on u.id=usuario_id
--where p.fecha between to_date('01-06-2020','dd-mm-yyyy') and to_date('30-06-2020','dd-mm-yyyy');
where to_char(p.fecha,'mm')=06;