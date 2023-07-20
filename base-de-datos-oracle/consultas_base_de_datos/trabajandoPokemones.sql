/*create table pokemones (
   pokedex number,
   nombre varchar2(20),
   tipo1 varchar2(15),
   tipo2 varchar(15),
   primary key (pokedex) 

);

create table mis_pokemones(
     pokedex number,
     fecha_captura date,
     lugar varchar2(20),
     huevo varchar2(5),
     peso number(6,2),
     estatura number(3,1),
     foreign key (pokedex) references 
     pokemones(pokedex)
     
     ); */
     
     select * from pokemones;
     --selecciono todos los pokemones y muestro su pokedex y nombre
     select pokedex, nombre from pokemones;
     --pokemones que su tipo 1 sea fuego
     select * from pokemones where tipo1='fuego';
     --muestra pokemones que tienen tipo agua 
     select * from pokemones where tipo1='agua' or tipo2='agua';
     --pokemones que tienen sus tipos 1 y tipo2 agua
     select * from pokemones where tipo1='agua' and tipo2='agua';
     
     select * from mis_pokemones;
     
    --ver picachu
    select * from pokemones where pokedex=25;
     --listar los pokemones cuya columna sea mayor a 50
     select * from pokemones where pokedex>50;
     --listar los primeros 22 registros de la tabla pokemon
     select * from pokemones where rownum <=22;
     -- alias pokename nro_pokedex
     select pokedex nro_pokedex, nombre pokename from pokemones;
     -- saber cuantos resgistros tiene la tabla
     select count(pokedex) cantidad_pokemones from pokemones;
     --cantidad de pokemones agrupados por la columna tipo 2
     select count(*)cantidad_tipo2, tipo2 from pokemones
     where tipo2 is not null
     group by tipo2
     order by cantidad_tipo2, tipo2;
     --pseo total de pokemones agrupados por lugar de captura
     select sum(peso) peso_total,lugar from mis_pokemones group by lugar;
     --ordenar pokemones por su peso en forma decendente
     select * from mis_pokemones order by peso desc;
    
 --5. todas las comunas donde se atrapó rattata 19
 select distinct (lugar) from mis_pokemones where pokedex=19;
--6. obtener el id del pokemon pikachu
select * from pokemones where upper(nombre)=upper('pikachu');
--7. cuantos pokemones hay de tipo veneno
select count(pokedex) from pokemones where tipo1='veneno' or tipo2='veneno';
--8. indicar el número pokedex y el lugar de los pokemones atrapados en Marzo del 2019, ordenados por Lugar de manera ascendente
select * from mis_pokemones where fecha_captura
between '01-03-2019' and '31-03-2019' order by lugar asc;
--9. consulta que agrupe los lugares donde se han atrapado pokemones, con su longitud
 select length(lugar) longitud, lugar from mis_pokemones 
 group by lugar order by longitud asc;
--10. maxima longitud de lugares
     select max(length(lugar)) maxima_longitud from mis_pokemones group by lugar;
     --inner join
     select * from pokemones p inner join mis_pokemones mp on p.pokedex=mp.pokedex;
     -- monstrar nombres de pokemones salidos de un huevo
     select p.nombre, mp.huevo from  pokemones p inner join mis_pokemones mp
     on p.pokedex=mp.pokedex
     where mp.huevo='true';
     --pokemones los cuales su pokedex sea 20,50,150
     select * from pokemones where pokedex in (20,50,150); 
    
    --pokemones con pokedex distintas a 5
    select * from pokemones where pokedex !=5;
    --like que su pokedex tenga el numero 5 al final
    select * from pokemones where pokedex like '%5';
    --pokemones que empiecen en p
    select * from pokemones where nombre like 'p%';
    --mostrar pokemones que en su nombre lleven ee
    select * from pokemones where nombre like '%ee%';
     --pokemones con pokedex entre 20 y 30
     
     
     -- (left join)toda la informacion disponible de los pokemones
     --sin importar si lo he capturado o no 
     select * from pokemones p left join mis_pokemones mp
     on p.pokedex=mp.pokedex;
     
     -- (left join sin los datos comunes)los pokemones que me faltan por capturar
     select p.pokedex, p.nombre from pokemones p left join mis_pokemones mp
     on p.pokedex=mp.pokedex
     where mp.pokedex is null;
     
     --full outer join
     select * from pokemones p full outer join mis_pokemones mp
on p.pokedex=mp.pokedex;

--subquery
--obtener como resultado los nombres de los pokemones obtenidos por huevos
select * from pokemones p inner join mis_pokemones mp
on p.pokedex=mp.pokedex
where mp.huevo='true';

--mediante subquery en where
--select * from pokemones p where p.pokedex in(1,2,3);
--select pokedex from mis_pokemones where huevo='true', --obtiene mis pokemones de huevo

select * from pokemones p
where p.pokedex in(select pokedex from mis_pokemones where huevo='true');
     
--mediante from
select p.pokedex, p.nombre from pokemones p inner join
(
select pokedex from mis_pokemones where huevo='true' -- tabla temporal creada a partir de un select
) t_mp_huevo on t_mp_huevo.pokedex= p.pokedex;

--obtener los nombres de los pokemones capturados que tienen 
-- un peso mayor a 200 kilos
select p.pokedex, p.nombre, t_mp_huevo.peso from pokemones p inner join
(select pokedex,peso,huevo from mis_pokemones where peso>200) 
t_mp_huevo on t_mp_huevo.pokedex= p.pokedex;

