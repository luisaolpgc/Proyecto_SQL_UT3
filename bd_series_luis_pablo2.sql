create database bd_series_luis_pablo;
use bd_series_luis_pablo;
create table series(
id_serie int not null auto_increment,
nombre varchar(15) not null,
idioma varchar(15) not null,
pais_origen varchar(15) not null,
id_ficha int not null,
primary key (id_serie),
foreign key FKficha (id_ficha) references ficha (id_ficha)
);
create table ficha(
id_ficha int not null auto_increment,
distribuidor varchar(15) not null,
resumen varchar(150) not null,
reparto varchar(150) not null,
primary key (id_ficha)
);
create table capitulo(
id_capitulo int not null auto_increment,
numero int not null,
duracion timestamp not null,
resumen varchar(150) not null,
id_serie int not null,
primary key (id_capitulo),
foreign key FKseries (id_serie) references series (id_serie)
);
create table genero(
id_genero int not null auto_increment,
tipo varchar(15) not null,
id_serie int not null,
primary key (id_genero),
foreign key FKseries (id_serie) references series (id_serie)
);
create table premios(
id_premios int not null auto_increment,
tipo varchar(15) not null,
nombre varchar(15) not null,
fecha time not null,
id_serie int not null,
primary key (id_premios),
foreign key FKseries (id_serie) references ficha (id_serie)
);
create table plataforma(
id_plataforma int not null auto_increment,
fecha time not null,
nombre varchar(15) not null,
primary key (id_plataforma)
);
create table director(
id_director int not null auto_increment,
nombre varchar(15) not null,
apellidos varchar(15) not null,
edad int not null,
primary key (id_director)
);
create table actor(
id_actor int not null auto_increment,
nombre varchar(15) not null,
apellidos varchar(15) not null,
edad int not null,
primary key (id_actor)
);
create table personaje(
id_personaje int not null auto_increment,
nombre varchar(15) not null,
apellidos varchar(15) not null,
edad int not null,
primary key (id_personaje)
);
create table se_emite(
id_series int not null auto_increment,
id_plataforma int not null,
primary key (id_series,id_plataforma)
);
create table dirigida(
id_series int not null auto_increment,
id_director int not null,
primary key (id_series,id_director)
);
create table tiene(
id_series int not null auto_increment,
id_actor int not null,
primary key (id_series,id_actor)
);
create table interpretada(
id_actor int not null auto_increment,
id_personaje int not null,
primary key (id_actor,id_personaje)
);
alter table se_emite
add constraint foreign key (id_series) references series (id_series),
add constraint foreign key (id_plataforma) references plataforma (id_plataforma);

alter table dirigida
add constraint foreign key (id_series) references series (id_series),
add constraint foreign key (id_director) references director (id_director);

alter table tiene
add constraint foreign key (id_series) references series (id_series),
add constraint foreign key (id_actor) references actor (id_actor);

alter table interpretada
add constraint foreign key (id_actor) references actor (id_actor),
add constraint foreign key (id_personaje) references personaje (id_personaje);



