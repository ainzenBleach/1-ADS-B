create database sprint3;
use sprint3;

create table aluno(
idAluno int primary key auto_increment,
nome varchar(45) not null,
dtNasc date
)auto_increment = 100;

insert into aluno values
	(default, "Hugo", "2000-01-20"),
    (default, "Cássio", "1988-03-23"),
    (default, "Doneli", "1990-05-28");
    
create table curso(
idCurso int primary key auto_increment,
nome varchar(45) not null,
cargaHoraria int
);

insert into curso values
	(default, "Inglês", 100),
    (default, "Espanhol", 80),
    (default, "Mandarim", 120);

select * from aluno;
select * from curso;

-- Criar tabela Associativa

create table matricula(
idMatricula int auto_increment,
fkAluno int,
fkCurso int,
	constraint pkComposta primary key (idMatricula, fkALuno, fkCurso),
nota decimal(4,2),
statusMat varchar(45),
dtMatricula date,
	constraint fkAlunoMat 
		foreign key (fkAluno) references aluno(idAluno),
	foreign key (fkCurso) references curso(idCurso)
);

insert into matricula values 
	(default, 100, 1, 9.5, "aprovado", '2024-01-01'),
    (default, 100, 2, 4.5, "reprovado", '2024-01-01'),
    (default, 101, 1, null, "cursando", '2025-01-01'),
    (default, 100, 2, null, "cursando", '2025-01-01');

select * from matricula;

-- select com o join e on

select 
aluno.nome as Aluno, 
curso.nome as Curso,
nota
from 
	aluno join matricula 
		on idAluno = fkAluno
	right join curso on idcurso = fkcurso;

select aluno.nome as Aluno, 
	   curso.nome as Curso,
       ifnull(nota, "Sem nota") as Nota
       from 
aluno join matricula 
	on idAluno = fkAluno
right join curso on idcurso = fkcurso
where fkAluno is null;
       


























