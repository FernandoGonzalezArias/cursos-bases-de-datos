--creación usuario
--alter session set "_ORACLE_SCRIPT"=true;
--create user peliculas identified by 1234;
--grant all privileges to peliculas;

create table peliculas(
    id number,
    titulo varchar2(100),
    anio_estreno number,
    director varchar2(30),
primary key (id)
);

create table reparto(
    id_peliculas number,
    reparto varchar2(40),
    FOREIGN key (id_peliculas) references peliculas (id)
);

select * from peliculas;
select * from reparto;

--3 obtener el id de le pelicula titanic
select * from peliculas where upper(titulo)=upper('titanic');

--4 listar a todos los actores que aparecen en la pelicula titanic
select *from reparto where id_peliculas=2; 

-- 5 consultar en cuantas peliculas del top 100 participa harrison ford
select count(*)titulo_que_Participa from reparto
where upper(reparto)=upper('Harrison Ford');

--6 indicar las peliculas estrenadas entre los años 1990 y 1999
--ordenadas por titulo de manera ascendente
select * from peliculas where anio_estreno
between 1990 and 1999 order by titulo asc;

--7. hacer una consulta SQL que agrupe los titulos con su longitud,
--la longitud debe ser nombrado para la consulta como "longitud_titulo"
 select length(titulo) longitud_titulo from peliculas group by titulo;
 
 --8 consultar cual es la longitud mas grande entre
 --todos los titulos de las peliculas
  select max(length(titulo)) longitud_mas_grande from peliculas;

