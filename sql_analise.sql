create database prova
use prova
create table projeto(
   ID_Proj decimal(4,0) primary key,
   NomeProj varchar(30),
   Localizacao varchar(30),
   ID_Depto decimal(2,0)
)

create table trabalha(
   ID_Func decimal(4,0),
   ID_Proj decimal(4,0),
   NumHoras decimal(6,1),
   primary key(ID_Func, ID_Proj)
)

create table departamento(
   ID_Depto decimal(2,0) primary key,
   NomeDepto varchar(30),
   ID_Gerente decimal(4,0)
)

create table dependente(
   ID_dep decimal (6,0),
   ID_func decimal (4,0),
   NomeDep varchar(30),
   DataNasc Date,
   Sexo Char(1),
   Parentesco char(15),
   primary key (ID_dep,ID_func)
)

create table funcionario(
	ID_Func decimal(4,0) primary key,
	NomeFunc varchar(30),
	Endereco varchar(50),
	DataNasc date,
	Sexo char(1),
	salario decimal(8,2),
	ID_Superv Decimal(4,0),
	ID_Depto decimal(2,0)
)

alter table trabalha 
add foreign key (ID_Func)
references funcionario(ID_Func)

alter table trabalha 
add foreign key (ID_Proj)
references projeto(ID_Proj)

alter table projeto
add foreign key (ID_Depto)
references departamento(ID_Depto)

alter table departamento
add foreign key (ID_Gerente)
references Funcionario(ID_Func)

alter table dependente 
add foreign key (ID_Func)
references Funcionario(ID_Func)

alter table Funcionario
add foreign key (ID_Superv)
references FuncionariO(ID_Func)

alter table Funcionario
add foreign key (ID_Depto)
references Departamento (ID_Depto)

insert into departamento
values (1, 'constru��o', null), (2, 'computa��o', null), (3, 'pesquisa', null)

insert into funcionario
values (1, 'Juliana do Oculos', 'Rua dos doidos', '16/08/2001', 'F', '1000', null, null),
(2, 'Romero Britto', 'Rua dos Caet�s', '16/09/2001', 'M', '20000', null, null),
(3, 'Geovana do Forninho', 'Rua dos desmaiados', '16/08/1945', 'F', '50000', null, null),
(4, 'Lula Molusco', 'Rua das Algas', '03/08/1990', 'M', '9000', null, null),
(5, 'Karla Lucia', 'Rua Aimor�s', '12/08/1992', 'F', '7000', null, null)

insert into projeto
values (01, 'An�lise de dados', 'Totvs', 2),
(02, 'Modelagem de processos', 'Record', 3),
(03, 'Vender picol�', 'Rua', 1), 
(04, 'A�ougue', 'Casa de carnes', 2),
(05, 'Axuliar de escrit�rio', 'Escrit�rio', 1),
(06, 'Apresentador', 'Band', 3),
(07, 'Jornalismo', 'Globo News', 3), 
(08, 'Banqueiro', 'Caixa Econ�mica', 2),
(09, 'Modelo', 'Victoria Angels', 1),
(10, 'Cantor', 'The voice', 2)

insert into trabalha
values (1, 1, 10), (2, 1, 40), (3, 2, 44), (4, 3, 25), (5, 2, 35)

insert into dependente
values (1, 2, 'Julio C�sar', '14/02/1998', 'M', 'Primo'),
(2, 1, 'Caio Mateus', '14/02/2001', 'M', 'Irm�o'),
(3, 3, 'Camila Homasnoff', '01/02/1998', 'F', 'Irm�'),
(4, 5, 'Maya Lucia', '15/10/2005', 'F', 'Tia'),
(5, 4, 'Luciana F�tima', '03/12/1994', 'F', 'Prima')

select f.nomeFunc from funcionario f
join departamento d
on f.ID_Func = d.ID_Gerente
where d.NomeDepto = 'Constru��o'

select nomeFunc from Funcionario
where id_func = (select id_gerente from departamento where NomeDepto = 'Constru��o')

select NomeFunc from funcionario
where id_func in (select id_func from trabalha
where id_proj in (select id_proj from projeto
where id_depto in (select id_depto from departamento
where NomeDepto = 'Constru��o')))
