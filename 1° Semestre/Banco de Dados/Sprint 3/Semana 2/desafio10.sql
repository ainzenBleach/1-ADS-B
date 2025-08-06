-- pratica 

create database pratica10;
use pratica10;

-- Tabela de Alunos
CREATE TABLE alunos (
    idAluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100)
);

-- Tabela de Cursos
CREATE TABLE cursos (
    idCurso INT PRIMARY KEY AUTO_INCREMENT,
    nomeCurso VARCHAR(100),
    descricao VARCHAR(200)
);

-- Tabela associativa Aluno_Curso (Relacionamento N:N)
CREATE TABLE aluno_curso (
    fkAluno INT,
    fkCurso INT,
    dtIinscricao DATE,
    PRIMARY KEY (fkAluno, fkCurso),
    FOREIGN KEY (fkAluno) REFERENCES alunos(idAluno),
    FOREIGN KEY (fkCurso) REFERENCES cursos(idCurso)
);

-- Tabela de Acessos (Entidade fraca com chave composta)
CREATE TABLE acessos (
    fkAluno INT,
    fkCurso INT,
    dtAcesso DATETIME,
    duracaoMinutos INT,
    PRIMARY KEY (fkAluno, fkCurso, dtAcesso),
    FOREIGN KEY (fkAluno) REFERENCES alunos(idAluno),
    FOREIGN KEY (fkCurso) REFERENCES cursos(idCurso)
);
 show tables;
 
 -- Inserir alunos
INSERT INTO alunos (nome, email) VALUES 
('Ana Silva', 'ana.silva@email.com'),
('Bruno Costa', 'bruno.costa@email.com'),
('Carla Mendes', 'carla.mendes@email.com');

-- Inserir cursos
INSERT INTO cursos (nomeCurso, descricao) VALUES
('Lógica de Programação', 'Curso introdutório sobre lógica computacional.'),
('Banco de Dados', 'Fundamentos e aplicações de bancos de dados relacionais.'),
('Desenvolvimento Web', 'Criação de sites com HTML, CSS e JavaScript.'),
('IA com TI', 'Introdução da IA no mundo de TI');

-- Inserir relacionamentos aluno-curso
INSERT INTO aluno_curso (fkAluno, fkCurso, dtIinscricao) VALUES
(1, 1, '2025-03-01'),
(1, 2, '2025-03-05'),
(2, 1, '2025-03-10'),
(2, 3, '2025-03-12'),
(3, 2, '2025-03-15');

-- Inserir acessos
INSERT INTO acessos (fkAluno, fkCurso, dtAcesso, duracaoMinutos) VALUES
(1, 1, '2025-03-02 08:30:00', 45),
(1, 2, '2025-03-06 09:00:00', 30),
(2, 1, '2025-03-11 14:00:00', 60),
(2, 3, '2025-03-13 15:30:00', 50),
(3, 2, '2025-03-16 10:15:00', 35),
(1, 1, '2025-03-02 11:30:00', 20);
-- SELECTS

select * from Alunos;
select * from Cursos;
select * from aluno_curso;
select * from acessos;

-- Listar todos os alunos e os cursos em que estão inscritos.
select a.nome as "Nome do aluno", 
c.nomeCurso as "NOme do curso"
from
alunos a join aluno_curso
	on fkAluno = idAluno
join Cursos c
	on fkCurso = idCurso;

-- Exibir todos os acessos feitos pela aluna “Ana Silva”, com data e duração.
select al.nome as "Nome do aluno",
c.nomeCurso as "Nome do curso",
a.dtAcesso as "Data de acesso",
a.duracaoMinutos as "Duração em minutos"
from
alunos al join acessos a
	on fkAluno = idAluno
join Cursos c
	on fkCurso = idCurso
    where al.nome = "Ana Silva";

-- Listar os cursos que têm mais de 1 aluno inscrito.
select
    c.nomeCurso as "Nome do curso",
    COUNT(ac.fkAluno) as "Quantidade de alunos inscritos"
from
aluno_curso ac join cursos c 
    ON ac.fkCurso = c.idCurso
group by ac.fkCurso, c.nomeCurso
having
    COUNT(ac.fkAluno) > 1;


-- Exibir a duração média dos acessos em cada curso.
select c.nomeCurso as "Nome do curso",
AVG(duracaoMinutos) as "Tempo médio"
from 
acessos a join Cursos c
	on fkCurso = idcurso
group by nomeCurso, idCurso;

-- Mostrar o total de minutos acessados por cada aluno em cada curso.
select al.nome as "Nome do aluno",
c.nomeCurso as "Nome do curso",
sum(a.duracaoMinutos) as "Duração total de acesso"
from
Alunos al join acessos a 
	on fkAluno = idAluno
join Cursos c
	on fkCurso = idCurso
group by idAluno, nomeCurso;

-- Criar uma VIEW chamada vw_total_acessos que contenha:
create view vw_total_acessos as
select al.idAluno as "ID do aluno",
al.nome as "Nome do aluno",
c.nomeCurso as "Nome do curso",
sum(a.duracaoMinutos) as "Total de minutos acessados"
from
alunos al join acessos a 
	on fkAluno = idAluno
join cursos c
	on fkCurso = idCurso
group by idAluno, nome, nomeCurso; 

select * from vw_total_acessos;

-- Criar uma VIEW chamada vw_estatisticas_curso
create view vw_estatisticas_curso as
select c.idCurso as "ID do curso",
c.nomeCurso as "Nome do curso",
count(distinct ac.fkAluno) as "Total de alunos",
AVG(a.duracaoMinutos) as "Tempo medio de acesso por curso"
from
cursos c join acessos a
	on a.fkCurso = idCurso
join aluno_curso ac
	on ac.fkCurso = idCurso
group by idCurso, nomeCurso;

select * from vw_estatisticas_curso;

-- Exibir os 3 alunos com mais tempo total de acesso (em minutos).
select al.idAluno as "ID do aluno",
al.nome as "Nome do aluno",
sum(a.duracaoMinutos) as "Total de minutos acessados"
from
alunos al join acessos a 
	on fkAluno = idAluno
join cursos c
	on fkCurso = idCurso
group by idAluno, nome
ORDER BY SUM(a.duracaoMinutos) DESC LIMIT 3; 

-- Listar os cursos que nunca foram acessados.
select c.nomeCurso as "Nome do curso",
a.dtAcesso as "Data de acesso",
a.duracaoMinutos as "Duração em minutos"
from 
cursos c left join acessos a
	on fkCurso = idCurso;
    
-- Mostrar a quantidade de acessos por data, agrupando por dia.

select date(dtAcesso) as "Data de acesso",
count(distinct dtAcesso) as "Quantidade de acessos"
from
acessos
group by date(dtAcesso);
