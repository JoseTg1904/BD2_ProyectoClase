use bd2_proyectoClase;

-- tabla resumen de indicadores financieros 30/11/2020 - 31/10/2021
select banco.nombre, 
(select con from (
	select @i := @i + 1 as con, id_banco from indicador,
	(select @i := 0) as col
	where month(fecha) = 11 and year(fecha) = 2020
	order by activo desc
) as col where col.id_banco = banco.id )  as noviembre_2020,
(select con from (
	select @i1 := @i1 + 1 as con, id_banco from indicador,
	(select @i1 := 0) as col
	where month(fecha) = 12 and year(fecha) = 2020
	order by activo desc
) as col where col.id_banco = banco.id )as diciembre_2020,
(select con from (
	select @i2 := @i2 + 1 as con, id_banco from indicador,
	(select @i2 := 0) as col
	where month(fecha) = 1 and year(fecha) = 2021
	order by activo desc
) as col where col.id_banco = banco.id ) as enero_2021,
(select con from (
	select @i3 := @i3 + 1 as con, id_banco from indicador,
	(select @i3 := 0) as col
	where month(fecha) = 2 and year(fecha) = 2021
	order by activo desc
) as col where col.id_banco = banco.id ) as febrero_2021,
(select con from (
	select @i4 := @i4 + 1 as con, id_banco from indicador,
	(select @i4 := 0) as col
	where month(fecha) = 3 and year(fecha) = 2021
	order by activo desc
) as col where col.id_banco = banco.id ) as marzo_2021,
(select con from (
	select @i5 := @i5 + 1 as con, id_banco from indicador,
	(select @i5 := 0) as col
	where month(fecha) = 4 and year(fecha) = 2021
	order by activo desc
) as col where col.id_banco = banco.id ) as abril_2021,
(select con from (
	select @i6 := @i6 + 1 as con, id_banco from indicador,
	(select @i6 := 0) as col
	where month(fecha) = 5 and year(fecha) = 2021
	order by activo desc
) as col where col.id_banco = banco.id ) as mayo_2021,
(select con from (
	select @i7 := @i7 + 1 as con, id_banco from indicador, (select @i7 := 0) as col
	where month(fecha) = 6 and year(fecha) = 2021
	order by activo desc
) as col where col.id_banco = banco.id ) as junio_2021,
(select con from (
	select @i8 := @i8 + 1 as con, id_banco from indicador, (select @i8 := 0) as col
	where month(fecha) = 7 and year(fecha) = 2021
	order by activo desc
) as col where col.id_banco = banco.id ) as julio_2021,
(select con from (
	select @i9 := @i9 + 1 as con, id_banco from indicador, (select @i9 := 0) as col
	where month(fecha) = 8 and year(fecha) = 2021
	order by activo desc
) as col where col.id_banco = banco.id ) as agosto_2021,
(select con from (
	select @i10 := @i10 + 1 as con, id_banco from indicador, (select @i10 := 0) as col
	where month(fecha) = 9 and year(fecha) = 2021
	order by activo desc
) as col where col.id_banco = banco.id ) as septiembre_2021,
(select con from (
	select @i11 := @i11 + 1 as con, id_banco from indicador, (select @i11 := 0) as col
	where month(fecha) = 10 and year(fecha) = 2021
	order by activo desc
) as col where col.id_banco = banco.id ) as octubre_2021
from banco
order by noviembre_2020;

-- consulta 1
SELECT banco.nombre,indicador.activo,ROW_NUMBER() OVER(ORDER BY activo desc) Ranking
 FROM indicador join banco on indicador.id_banco=banco.id where fecha ='2020-11-30' limit 5;

-- consulta 2
SELECT banco.nombre,indicador.activo,ROW_NUMBER() OVER(ORDER BY activo asc) Ranking
 FROM indicador join banco on indicador.id_banco=banco.id where fecha ='2021-02-28' limit 5;

-- consulta 3
select ROW_NUMBER() OVER(ORDER BY sum(RowNumberb)asc) ranking, nombre,sum(activo) from(SELECT banco.nombre,indicador.activo,ROW_NUMBER() OVER(ORDER BY activo desc) RowNumberb FROM indicador
join banco on indicador.id_banco=banco.id where fecha ='2020-11-30'
UNION SELECT banco.nombre,indicador.activo,ROW_NUMBER() OVER(ORDER BY activo desc) RowNumberb FROM indicador
join banco on indicador.id_banco=banco.id where fecha ='2020-12-31' 
UNION SELECT banco.nombre,indicador.activo,ROW_NUMBER() OVER(ORDER BY activo desc) RowNumberb FROM indicador
join banco on indicador.id_banco=banco.id where fecha ='2021-01-31'
UNION SELECT banco.nombre,indicador.activo,ROW_NUMBER() OVER(ORDER BY activo desc) RowNumberb FROM indicador
join banco on indicador.id_banco=banco.id where fecha ='2021-02-28'
UNION SELECT banco.nombre,indicador.activo,ROW_NUMBER() OVER(ORDER BY activo desc) RowNumberb FROM indicador
join banco on indicador.id_banco=banco.id where fecha ='2021-03-31' 
UNION SELECT banco.nombre,indicador.activo,ROW_NUMBER() OVER(ORDER BY activo desc) RowNumberb FROM indicador
join banco on indicador.id_banco=banco.id where fecha ='2021-04-30')AS tabla
group by nombre order by sum(RowNumberb)limit 3;

-- consulta 4
select ROW_NUMBER() OVER(ORDER BY sum(RowNumberb) asc) ranking, nombre,sum(activo) from(SELECT banco.nombre,indicador.activo,ROW_NUMBER() OVER(ORDER BY activo desc) RowNumberb FROM indicador
join banco on indicador.id_banco=banco.id where fecha ='2020-11-30'
UNION SELECT banco.nombre,indicador.activo,ROW_NUMBER() OVER(ORDER BY activo desc) RowNumberb FROM indicador
join banco on indicador.id_banco=banco.id where fecha ='2020-12-31' 
UNION SELECT banco.nombre,indicador.activo,ROW_NUMBER() OVER(ORDER BY activo desc) RowNumberb FROM indicador
join banco on indicador.id_banco=banco.id where fecha ='2021-01-31'
UNION SELECT banco.nombre,indicador.activo,ROW_NUMBER() OVER(ORDER BY activo desc) RowNumberb FROM indicador
join banco on indicador.id_banco=banco.id where fecha ='2021-02-28'
UNION SELECT banco.nombre,indicador.activo,ROW_NUMBER() OVER(ORDER BY activo desc) RowNumberb FROM indicador
join banco on indicador.id_banco=banco.id where fecha ='2021-03-31' 
UNION SELECT banco.nombre,indicador.activo,ROW_NUMBER() OVER(ORDER BY activo desc) RowNumberb FROM indicador
join banco on indicador.id_banco=banco.id where fecha ='2021-04-30'
UNION SELECT banco.nombre,indicador.activo,ROW_NUMBER() OVER(ORDER BY activo desc) RowNumberb FROM indicador
join banco on indicador.id_banco=banco.id where fecha ='2021-05-31'
UNION SELECT banco.nombre,indicador.activo,ROW_NUMBER() OVER(ORDER BY activo desc) RowNumberb FROM indicador
join banco on indicador.id_banco=banco.id where fecha ='2021-06-30'
UNION SELECT banco.nombre,indicador.activo,ROW_NUMBER() OVER(ORDER BY activo desc) RowNumberb FROM indicador
join banco on indicador.id_banco=banco.id where fecha ='2021-07-31'
UNION SELECT banco.nombre,indicador.activo,ROW_NUMBER() OVER(ORDER BY activo desc) RowNumberb FROM indicador
join banco on indicador.id_banco=banco.id where fecha ='2021-08-31'
UNION SELECT banco.nombre,indicador.activo,ROW_NUMBER() OVER(ORDER BY activo desc) RowNumberb FROM indicador
join banco on indicador.id_banco=banco.id where fecha ='2021-09-30'
UNION SELECT banco.nombre,indicador.activo,ROW_NUMBER() OVER(ORDER BY activo desc) RowNumberb FROM indicador
join banco on indicador.id_banco=banco.id where fecha ='2021-10-31')AS tabla
group by nombre order by sum(RowNumberb)limit 1 ;