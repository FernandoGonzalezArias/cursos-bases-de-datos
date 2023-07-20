--creación usuario
alter session set "_ORACLE_SCRIPT"=true;
create user usuario_pizzeria  identified by 1234;
grant all privileges to usuario_pizzeria  ;