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