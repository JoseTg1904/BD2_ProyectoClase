load data infile '/var/lib/mysql-files/bancos.csv'
into table temporal
charset utf8
fields terminated by ';'
enclosed by '"'
ignore 1 rows
(nombre, activo, pasivo, capital, @fecha_casteada)
set fecha = str_to_date(@fecha_casteada, "%d/%m/%Y");

insert into banco (nombre)
select distinct nombre from temporal;

insert into indicador (id_banco, activo, pasivo, capital, fecha)
select 
    (select id from banco where banco.nombre = temporal.nombre),
    activo,
    pasivo,
    capital,
    fecha
from temporal;

drop table temporal;