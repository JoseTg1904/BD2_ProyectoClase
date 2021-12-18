create database if not exists bd2_proyectoClase;

use bd2_proyectoClase;

create table if not exists temporal (
    nombre varchar(50),
    activo int,
    pasivo int,
    capital int,
    fecha date
);

create table if not exists banco (
    id int auto_increment primary key,
    nombre varchar(50)
);

create table if not exists indicador (
    id int auto_increment primary key,
    id_banco int,
    activo int,
    pasivo int,
    capital int,
    fecha date,
    foreign key(id_banco) references banco(id)
);