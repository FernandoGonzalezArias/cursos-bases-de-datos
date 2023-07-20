--creacion tablas

CREATE TABLE directorio_telefonico
(
    nombre VARCHAR2(25),
    apellido VARCHAR2(25),
    numero_telefonico VARCHAR2(8),
    direccion Varchar2(255),
    edad NUMBER,
    PRIMARY KEY (numero_telefonico)
);

SELECT * FROM directorio_telefonico;

CREATE TABLE agenda(
  nick VARCHAR2(25),
  numero_telefonico VARCHAR2(8),
  FOREIGN KEY (numero_telefonico) REFERENCES
  directorio_telefonico(numero_telefonico)
);

SELECT * FROM agenda;
--insertando registros al directorio telefonico
INSERT INTO directorio_telefonico (nombre, apellido, numero_telefonico, direccion, edad)
values('Pepe','Lota','1111','Rosas #111',35);
INSERT INTO directorio_telefonico (nombre, apellido, numero_telefonico, direccion, edad)
values('Germán','Pinto','2222','La punta del cerro #222',36);
INSERT INTO directorio_telefonico (nombre, apellido, numero_telefonico, direccion, edad)
values('Aaron','Ubilla','3333','La punta del cerro #221',30);

--insertando registros a la agenda
insert into agenda (nick, numero_telefonico)values ('pplotita','1111');
insert into agenda (nick, numero_telefonico)values ('gelmins','2222');

update directorio_telefonico set direccion='villa los leones' where numero_telefonico='3333';
