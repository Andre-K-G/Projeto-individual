-- select avg(nota) from filmes where id_filme=2;

create database api;
use api;

create table usuarios (
id_usuario int primary key,
nome varchar(45),
email varchar(45),
data_inclusao date,
data_nascimento date
);

insert into usuarios values 
(1,'Ricardo','ricardo@gmail','2021-01-01','1994-02-13'),
(2,'Maria','maria@gmail','2021-02-16','1990-10-24'),
(3,'João','joao@gmail','2021-02-20','1993-11-11'),
(4,'Jonas','jonas@gmail','2021-03-10','1989-12-01'),
(5,'Mariana','mariana@gmail','2021-01-28','1998-03-22'),
(6,'Lucas','lucas@gmail','2021-03-01','1999-05-13'),
(7,'Amanda','amanda@gmail','2021-03-05','1995-10-15'),
(8,'Vinícius','vicicius@gmail','2021-01-04','1994-12-12'),
(9,'Victor','victor@gmail','2021-02-22','1998-08-02'),
(10,'Matheus','matheus@gmail','2021-02-28','1990-01-05');

select * from usuarios;

create table amigos (
fk_usuario1 int,
fk_usuario2 int,
foreign key (fk_usuario1) references usuarios (id_usuario),
foreign key (fk_usuario2) references usuarios (id_usuario),
primary key (fk_usuario1,fk_usuario2),
check (fk_usuario1<>fk_usuario2)
);

insert into amigos values 
(1,2),
(1,5),
(2,10),
(7,8),
(3,4),
(9,6),
(5,3),
(7,10),
(3,7);


select * from amigos;


create table filmes_series (
id_filme int primary key,
nome varchar(45),
tipo char(5),
check (tipo='filme' or tipo='serie'),
genero varchar(45)
);

insert into filmes_series values 
(1,'O resgate do soldado Ryan','filme','ação'),
(2,'Stalker','filme','scifi'),
(3,'Alien','filme','terror'),
(4,'Breaking bad','serie','drama'),
(5,'Friends','serie','comédia'),
(6,'Godzilla vs Kong','filme','ação'),
(7,'Bladerunner','filme','scifi');

create table usuario_fs (
fk_usuario int,
fk_filme int,
nota float,
foreign key (fk_usuario) references usuarios(id_usuario),
foreign key (fk_filme) references filmes_series(id_filme),
primary key (fk_usuario,fk_filme)
);

insert into usuario_fs values 
(1,1,10.0),
(6,1,9.6),
(3,2,8.0),
(5,2,8.4),
(2,3,9.6),
(4,3,9.4),
(7,4,9.5),
(8,4,8.9),
(9,5,6.9),
(1,5,6.7),
(10,6,6.0),
(2,6,4.8),
(10,7,9.9),
(3,7,9.9);

create table analises(
id_analise int primary key,
fk_usuario int,
fk_filme int,
foreign key (fk_usuario) references usuarios(id_usuario),
foreign key (fk_filme) references filmes_series(id_filme),
conteudo varchar(3000)
);

insert into analises values 
(1,1,1,'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'),
(2,6,1,'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'),
(3,3,2,'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'),
(4,5,2,'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'),
(5,2,3,'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'),
(6,4,3,'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'),
(7,7,4,'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'),
(8,8,4,'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'),
(9,9,5,'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'),
(10,10,6,'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'),
(11,10,7,'Lorem ipsum dolor sit amet, consectetur adipisicing elit.');


create table usuarios_analises (
fk_usuario int,
fk_analise int,
foreign key (fk_usuario) references usuarios(id_usuario),
foreign key (fk_analise) references analises(id_analise),
primary key (fk_usuario,fk_analise),
nota float
);

insert into usuarios_analises values 
(2,1,9.0),
(3,1,8.0),
(3,2,8.0),
(4,2,7.0),
(4,3,10.0),
(5,3,8.0),
(5,4,10.0),
(6,4,9.0),
(6,5,10.0),
(7,5,7.0),
(7,6,7.0),
(8,6,5.0),
(8,7,9.0),
(9,7,8.0),
(9,8,7.0),
(10,8,6.0),
(10,9,6.0),
(1,9,8.0),
(1,10,10.0),
(2,10,4.0),
(3,11,3.0),
(4,11,10.0);

select * from usuarios_analises;

drop table usuarios_analises;

select avg(nota) from usuarios_analises where fk_analise=1;

select fk_analise,avg(nota) from usuarios_analises group by fk_analise;

select * from usuario;

select * from usuarios;
select * from amigos;
select * from filmes_series;
select * from usuario_fs;
select * from analises;
select * from usuarios_analises;


drop table analises;
drop table usuario_fs;
drop table filmes_series;
drop table amigos;
drop table usuarios;


-- para login

create table usuario (
id int primary key auto_increment,
nome varchar(60),
login varchar(60),
senha varchar(60)
);

select * from usuario;


