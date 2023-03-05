drop database if exists bd_series_luis_pablo;
create database bd_series_luis_pablo;
use bd_series_luis_pablo;


create table ficha(
id_ficha int not null auto_increment,
distribuidor varchar(15) not null,
resumen varchar(150) not null,
reparto varchar(150) not null,
primary key (id_ficha)
);
create table series(
id_serie int not null auto_increment,
nombre varchar(50) not null,
idioma varchar(15) not null,
pais_origen varchar(15) not null,
id_ficha int not null,
primary key (id_serie),
foreign key FKficha (id_ficha) references ficha (id_ficha)
);

create table capitulo(
id_capitulo int not null auto_increment,
numero int not null,
duracion date not null,
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
fecha date not null,
id_serie int not null,
primary key (id_premios),
foreign key FKseries (id_serie) references series (id_serie)
);
create table plataforma(
id_plataforma int not null auto_increment,
fecha date not null,
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
id_serie int not null,
id_plataforma int not null,
primary key (id_serie,id_plataforma)
);
create table dirigida(
id_serie int not null,
id_director int not null,
primary key (id_serie,id_director)
);
create table tiene(
id_serie int not null,
id_actor int not null,
primary key (id_serie,id_actor)
);
create table interpretada(
id_actor int not null,
id_personaje int not null,
primary key (id_actor,id_personaje)
);
alter table se_emite
add constraint foreign key (id_serie) references series (id_serie),
add constraint foreign key (id_plataforma) references plataforma (id_plataforma);

alter table dirigida
add constraint foreign key (id_serie) references series (id_serie),
add constraint foreign key (id_director) references director (id_director);

alter table tiene
add constraint foreign key (id_serie) references series (id_serie),
add constraint foreign key (id_actor) references actor (id_actor);

alter table interpretada
add constraint foreign key (id_actor) references actor (id_actor),
add constraint foreign key (id_personaje) references personaje (id_personaje);

INSERT INTO ficha VALUES (1,'Mediaset','Copia de un edificio peleando','Pepe');
INSERT INTO ficha VALUES (2,'Atresmedia','Un edificio peleando','Paco');
INSERT INTO ficha VALUES (3,'Atresmedia','Mujeres dandose caña en la carcel','Juan');
INSERT INTO ficha VALUES (4,'Mediaset','Todo era un sueño','Antonio');
INSERT INTO ficha VALUES (5,'WarnerBros','Un grupo de colegas','Ermenegilda');



INSERT INTO series VALUES (1,'La que se avecina','Español','España',1);
INSERT INTO series VALUES (2,'Aqui no hay quien viva','Español','España',2);
INSERT INTO series VALUES (3,'Vis a Vis','Español','España',3);
INSERT INTO series VALUES (4,'Los Serrano','Español','España',4);
INSERT INTO series VALUES (5,'Friends','Español','España',5);


INSERT INTO capitulo VALUES (1,1,'2015-12-24','Apertura', 1);
INSERT INTO capitulo VALUES (2,2,'2000-10-15','Cierre',2);
INSERT INTO capitulo VALUES (3,1,'2016-07-23','Apertura',1);
INSERT INTO capitulo VALUES (4,3,'1999-06-01','Cierre',3);
INSERT INTO capitulo VALUES (5,1,'2005-03-31','Apertura',4);

INSERT INTO genero VALUES (1,'Comedia', 1);
INSERT INTO genero VALUES (2,'Familiar', 2);
INSERT INTO genero VALUES (3,'Accion', 3);
INSERT INTO genero VALUES (4,'Suspense', 3);
INSERT INTO genero VALUES (5,'Comedia', 5);
INSERT INTO genero VALUES (6,'TP', 4);

INSERT INTO premios VALUES (1,'Series','Goya','2016-01-24', 1);
INSERT INTO premios VALUES (2,'Series','Goya','2001-11-15', 2);
INSERT INTO premios VALUES (3,'Series','Oscar','2017-08-23',5);
INSERT INTO premios VALUES (4,'Series','Goya','2000-07-01', 4);
INSERT INTO premios VALUES (5,'Series','Emmy','2006-04-28',5);

INSERT INTO plataforma VALUES (1,'2015-12-24','Prime Video');
INSERT INTO plataforma VALUES (2,'2000-10-15','Netflix');
INSERT INTO plataforma VALUES (3,'2016-07-23','Netflix');
INSERT INTO plataforma VALUES (4,'1999-06-01','RTVE');
INSERT INTO plataforma VALUES (5,'2005-03-31','Disney');

INSERT INTO director VALUES (1,'Alberto','Caballero','40');
INSERT INTO director VALUES (2,'Laura','Caballero','40');
INSERT INTO director VALUES (3,'Antonia','San Juan','60');
INSERT INTO director VALUES (4,'Ayaya','Perera','21');
INSERT INTO director VALUES (5,'Chandler','Bing','80');

INSERT INTO actor VALUES (1,'Ricardo','Arroyo','60');
INSERT INTO actor VALUES (2,'Fernando','Tejero','45');
INSERT INTO actor VALUES (3,'Alba','Flores','25');
INSERT INTO actor VALUES (4,'Antonio','Resines','70');
INSERT INTO actor VALUES (5,'Jennifer','Aniston','50');

INSERT INTO personaje VALUES (1,'Vicente','Maroto','60');
INSERT INTO personaje VALUES (2,'Emilio','Delgado','45');
INSERT INTO personaje VALUES (3,'Saray','Vergas','25');
INSERT INTO personaje VALUES (4,'Diego','Serrano','70');
INSERT INTO personaje VALUES (5,'Rachel','Green','50');

INSERT INTO se_emite VALUES (1, 1);
INSERT INTO se_emite VALUES (2, 2);
INSERT INTO se_emite VALUES (3, 3);
INSERT INTO se_emite VALUES (4, 4);
INSERT INTO se_emite VALUES (5, 5);

INSERT INTO dirigida VALUES (1, 1);
INSERT INTO dirigida VALUES (2, 2);
INSERT INTO dirigida VALUES (3, 3);
INSERT INTO dirigida VALUES (4, 4);
INSERT INTO dirigida VALUES (5, 5);

INSERT INTO tiene VALUES (1, 1);
INSERT INTO tiene VALUES (2, 2);
INSERT INTO tiene VALUES (3, 3);
INSERT INTO tiene VALUES (4, 4);
INSERT INTO tiene VALUES (5, 5);

INSERT INTO interpretada VALUES (1, 1);
INSERT INTO interpretada VALUES (2, 2);
INSERT INTO interpretada VALUES (3, 3);
INSERT INTO interpretada VALUES (4, 4);
INSERT INTO interpretada VALUES (5, 5);
