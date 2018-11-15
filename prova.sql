create database review
use review

-- Quest�o 1
create table Planeta(
cod_id int primary key,
Nome varchar(50),
Descri��o varchar(50)
)

create table Sistema(
cod_id int primary key,
Descri��o varchar(50)
)

create table Ra�a(
cod_id int primary key,
Nome varchar(50),
Data date,
Descri��o varchar(50)
)

create table Planeta_Ra�a(
id_planeta INT NOT NULL,
id_ra�a INT NOT NULL

constraint pk_Planeta_Ra�a primary key (id_planeta, id_ra�a),

constraint fk_Planeta_Ra�a2 foreign key (id_planeta) references Planeta(cod_id),
constraint fk_Planeta_Ra�a3 foreign key (id_ra�a) references Ra�a(cod_id)
)

insert into planeta_ra�a values (1, 2), (2, 1)
select * from Planeta_Ra�a

-- Quest�o 2
insert into Planeta
values (1, 'Terra', 'Cheio de �gua'),
	   (2, 'Marte', 'Extraterrestre')
select * from Planeta

insert into Sistema
values (1, 'Sistema Solar'),
	   (2, 'Sistema Estelar')
select * from Sistema

insert into Ra�a
values (1, 'Brancos', '', 'Fen�tipo de pele clara'),
	   (2, 'Negros', '', 'Fen�tipo de pele escura')
select * from Ra�a

-- Quest�o 3
update Ra�a
set Data = '01-01-2001'

-- Quest�o 4
select r.nome, d.Descri��o from Ra�a r
join Sistema d on r.nome = r.nome
where d.Descri��o = 'Sistema Solar'

-- Quest�o 5
select distinct count(q.nome) q from Ra�a r
join Planeta q on r.nome = r.nome
--Deveria informar o n�mero 2, mas n�o consegui fazer