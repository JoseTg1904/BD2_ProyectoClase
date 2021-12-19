use bd2_proyectoClase;

-- tabla resumen de indicadores financieros 30/11/2020 - 31/10/2021
select banco.nombre, 
(
	select @i := @i + 1 from indicador,
	(select @i := 0) as col
	where month(fecha) = 11 and year(fecha) = 2020 and banco.id = indicador.id_banco
	order by activo desc
) as noviembre_20,
(
	select @i1 := @i1 + 1 from indicador, (select @i1 := 0) as col
	where month(fecha) = 12 and year(fecha) = 2020 and banco.id = indicador.id_banco
	order by activo desc
) as diciembre_20,
(
	select @i2 := @i2 + 1 from indicador, (select @i2 := 0) as col
	where month(fecha) = 1 and year(fecha) = 2021 and banco.id = indicador.id_banco
	order by activo desc
) as enero_21,
(
	select @i3 := @i3 + 1 from indicador, (select @i3 := 0) as col
	where month(fecha) = 2 and year(fecha) = 2021 and banco.id = indicador.id_banco
	order by activo desc
) as febrero_21,
(
	select @i4 := @i4 + 1 from indicador, (select @i4 := 0) as col
	where month(fecha) = 3 and year(fecha) = 2021 and banco.id = indicador.id_banco
	order by activo desc
) as marzo_21,
(
	select @i5 := @i5 + 1 from indicador, (select @i5 := 0) as col
	where month(fecha) = 4 and year(fecha) = 2021 and banco.id = indicador.id_banco
	order by activo desc
) as abril_21,
(
	select @i6 := @i6 + 1 from indicador, (select @i6 := 0) as col
	where month(fecha) = 5 and year(fecha) = 2021 and banco.id = indicador.id_banco
	order by activo desc
) as mayo_21,
(
	select @i7 := @i7 + 1 from indicador, (select @i7 := 0) as col
	where month(fecha) = 6 and year(fecha) = 2021 and banco.id = indicador.id_banco
	order by activo desc
) as junio_21,
(
	select @i8 := @i8 + 1 from indicador, (select @i8 := 0) as col
	where month(fecha) = 7 and year(fecha) = 2021 and banco.id = indicador.id_banco
	order by activo desc
) as julio_21,
(
	select @i9 := @i9 + 1 from indicador, (select @i9 := 0) as col
	where month(fecha) = 8 and year(fecha) = 2021 and banco.id = indicador.id_banco
	order by activo desc
) as agosto_21,
(
	select @i10 := @i10 + 1 from indicador, (select @i10 := 0) as col
	where month(fecha) = 9 and year(fecha) = 2021 and banco.id = indicador.id_banco
	order by activo desc
) as septiembre_21,
(
	select @i11 := @i11 + 1 from indicador, (select @i11 := 0) as col
	where month(fecha) = 10 and year(fecha) = 2021 and banco.id = indicador.id_banco
	order by activo desc
) as octubre_21
from banco
order by noviembre_20;