from flask import Flask, jsonify, request, Response
from flask_cors import CORS
from mysql.connector import connect, Error
import json

app = Flask(__name__)
CORS(app)

config = {
    "host": "localhost",
    "user": "root",
    "password": "root1234",
    "database": "bd2_proyectoClase",
    "charset": "utf8"
}

try:
    connection = connect(**config)
except Error as err:
    print(err)

@app.route("/", methods = ["GET"])
def inicio():
    return jsonify({ "mensaje": "bienvenido al server" })

"""
{
    "usuario": string
    "contra": string
}
"""
@app.route("/login", methods = ["POST"])
def login():
    query = "select * from Usuario where nombre = %s and contra = %s"

    cursor = connection.cursor()
    cursor.execute(query, (request.json["usuario"], request.json["contra"]))

    return jsonify({ "estado": cursor.rowcount })

@app.route("/bancos", methods = ["GET"])
def bancos():
    query = "select * from banco"

    cursor = connection.cursor(dictionary = True)
    cursor.execute(query)

    return jsonify(cursor.fetchall()) 

@app.route("/ranking", methods = ["GET"])
def ranking():
    query = """
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
    order by noviembre_2020"""

    cursor = connection.cursor(dictionary = True)
    cursor.execute(query)

    return jsonify(cursor.fetchall()) 

"""
{
    "activo": numero,
    "id": numero -> id del banco,
    "mes": numero -> mes del 1 al 10 para 2021 y 11 a 12 para 2020
    "anio": numero -> 2020 | 2021
}
"""
@app.route("/modificar", methods = ["PUT"])
def modificar():
    query = "update indicador set activo = %s where id_banco = %s and month(fecha) = %s and year(fecha) = %s"

    cursor = connection.cursor()
    cursor.execute(query, (request.json["activo"], request.json["id"], request.json["mes"], request.json["anio"]))
    
    connection.commit()

    return jsonify({ "estado": 1 })

if __name__ == "__main__":
    app.run(host = "0.0.0.0", debug = True)