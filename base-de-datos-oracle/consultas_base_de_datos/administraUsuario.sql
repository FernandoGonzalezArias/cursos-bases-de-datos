
--creacion usuario
--alter session set "_ORACLE_SCRIPT"=true;
--create user mi isuario identified by 1234;
--grant all privileges to alumno1;


--usuario donde etsoy parado
select user from dual;

alter session set "_ORACLE_SCRIPT"=true;
--cree usuraiomalo
create user usuariomalo identified by 1234;
--busque entre los usuraios el usuariomalo
select username from dba_users;
--borre el usuraiomalo
drop user usuariomalo cascade;
--busuqe entre los usuarios el usuariomalo y no esta
select username from dba_users;
