create database atividade2;
use atividade2;

-- Criação das tabelas

create table grupo(
	idGrupo int primary key auto_increment,
    nome varchar(45),
    descricao varchar(100)
);

create table aluno(
	idAluno int,
    nome varchar(45),
    email varchar(100),
    fkGrupo int
);
alter table aluno add constraint 
	foreign key (fkGrupo) 
		references grupo(idGrupo);
        
create table professor(
	idProfessor int primary key auto_increment,
    nome varchar(45),
    disciplina varchar(45)
) auto_increment = 10000;

create table notaGrupo(
fkGrupo int,
fkProfessor int,
nota float,
dtAvaliacao datetime,
primary key(fkGrupo, fkProfessor),
	foreign key (fkGrupo) 
		references grupo(idGrupo),
	foreign key (fkProfessor) 
		references professor(idProfessor)
);

-- Alimentação das tabelas
INSERT INTO grupo (nome, descricao) VALUES
('Tech Inovação', 'Grupo focado em soluções tecnológicas'),
('BioPesquisa', 'Grupo de estudos em biotecnologia'),
('EcoIdeias', 'Soluções sustentáveis e ecológicas'),
('NeuroDev', 'Grupo de desenvolvimento neurocientífico'),
('DataSense', 'Grupo de ciência de dados aplicada');

INSERT INTO aluno (idAluno, nome, email, fkGrupo) VALUES
(1, 'Alice Silva', 'alice.silva@gmail.com', 5),
(2, 'Bruno Costa', 'bruno.costa@outlook.com', 3),
(3, 'Carla Dias', 'carla.dias@hotmail.com', 4),
(4, 'Daniel Souza', 'daniel.souza@gmail.com', 5),
(5, 'Eduarda Lima', 'eduarda.lima@outlook.com', 2),
(6, 'Fernando Rocha', 'fernando.rocha@hotmail.com', 1),
(7, 'Giovana Teixeira', 'giovana.teixeira@gmail.com', 4 ),
(8, 'Henrique Ramos', 'henrique.ramos@outlook.com', 5),
(9, 'Isabela Martins', 'isabela.martins@hotmail.com', 2),
(10, 'João Pedro', 'joao.pedro@gmail.com', 2),
(11, 'Karla Nunes', 'karla.nunes@outlook.com', 3),
(12, 'Lucas Tavares', 'lucas.tavares@hotmail.com', 4),
(13, 'Marina Torres', 'marina.torres@gmail.com', 1),
(14, 'Nicolas Alves', 'nicolas.alves@outlook.com', 1),
(15, 'Olivia Prado', 'olivia.prado@hotmail.com', 3);

INSERT INTO professor (nome, disciplina) VALUES
('Prof. Ana Lúcia', 'Tecnologia da Informação'),  
('Prof. Carlos Meireles', 'Empreendedorismo'),    
('Prof. Denise Rocha', 'Biotecnologia'),          
('Prof. Eduardo Lima', 'Genética Aplicada'),       
('Prof. Fábio Gonçalves', 'Meio Ambiente'),        
('Prof. Gabriela Mendes', 'Sustentabilidade'),     
('Prof. Hélio Campos', 'Neurociência'),            
('Prof. Ingrid Silva', 'Psicobiologia'),          
('Prof. Jorge Freitas', 'Estatística'),            
('Prof. Kelly Moura', 'Machine Learning'),
('Prof. Laura Martins', 'Tecnologia da Informação'),        
('Prof. Bruno Ferreira', 'Estatística'),     
('Prof. Mariana Costa', 'Psicobiologia'),            
('Prof. Rafael Alves', 'Meio Ambiente'),          
('Prof. Tatiane Ribeiro', 'Empreendedorismo'),            
('Prof. Diego Souza', 'Machine Learning');         

INSERT INTO notaGrupo (fkGrupo, fkProfessor, nota, dtAvaliacao) VALUES
(1, 10000, 8.5, '2024-02-14 10:30:00'),
(1, 10001, 9.0, '2024-06-03 15:20:00'),
(1, 10010, 8.5, '2024-03-25 14:30:00'),
(2, 10002, 7.8, '2024-03-25 09:10:00'),
(2, 10003, 8.2, '2024-08-19 14:50:00'),
(2, 10011, 7.9, '2024-11-05 09:45:00'),
(2, 10012, 8.1, '2025-01-13 10:00:00'),
(3, 10004, 9.1, '2024-05-07 11:45:00'),
(3, 10005, 8.7, '2024-10-12 16:00:00'),
(3, 10013, 8.7, '2025-02-17 16:30:00'),
(4, 10006, 7.5, '2024-09-01 13:25:00'),
(4, 10007, 7.9, '2025-01-22 10:05:00'),
(4, 10014, 7.8, '2024-06-22 08:00:00'),
(5, 10008, 9.4, '2025-03-10 17:40:00'),
(5, 10009, 8.9, '2024-12-15 08:55:00'),
(5, 10015, 9.0, '2024-12-05 17:20:00');

-- selects individual das tabelas
select * from aluno;
select * from grupo;
select * from notaGrupo;
select * from professor;

-- Exibir dados dos grupos e dos respectivos alunos
select g.nome as "Nome do grupo", 
g.descricao as "Descrição do grupo", 
ng.nota as "Notas do grupo",
a.nome as "Nome do aluno", 
a.email as "Email do aluno" 
from
grupo g join aluno a 
	on a.fkGrupo = g.idGrupo 
join notaGrupo ng 
	on ng.fkGrupo = g.idGrupo ;

-- Exibir dados de um respectivo grupo e dos respectivos alunos
select g.nome as "Nome do grupo", 
g.descricao as "Descrição do grupo", 
ng.nota as "Notas do grupo",
a.nome as "Nome do aluno", 
a.email as "Email do aluno" 
from
grupo g join aluno a 
	on a.fkGrupo = g.idGrupo 
join notaGrupo ng 
	on ng.fkGrupo = g.idGrupo 
		where g.idGRupo = 2;
    
-- Exibir media dos grupo no total
select g.nome as "Nome do grupo", 
g.descricao as "Descrição do grupo", 
avg(ng.nota) as "Média das notas do grupo",
a.nome as "Nome do aluno", 
a.email as "Email do aluno" 
from
grupo g join aluno a 
	on a.fkGrupo = g.idGrupo 
join notaGrupo ng 
	on ng.fkGrupo = g.idGrupo 
GROUP BY g.nome, g.descricao, a.nome, a.email;

-- Exibir nota max e min dos grupos
select g.nome as "Nome do grupo", 
g.descricao as "Descrição do grupo", 
max(ng.nota) as "Maior nota do grupo",
min(ng.nota) as "Menos nota do grupo",
a.nome as "Nome do aluno", 
a.email as "Email do aluno" 
from
grupo g join aluno a 

	on a.fkGrupo = g.idGrupo 
join notaGrupo ng 
	on ng.fkGrupo = g.idGrupo 
GROUP BY g.nome, g.descricao, a.nome, a.email;

-- Exibir soma das notas do grupo
select g.nome as "Nome do grupo", 
g.descricao as "Descrição do grupo", 
sum(ng.nota) as "Soma do grupo",
a.nome as "Nome do aluno", 
a.email as "Email do aluno" 
from
grupo g join aluno a 
	on a.fkGrupo = g.idGrupo 
join notaGrupo ng 
	on ng.fkGrupo = g.idGrupo 
GROUP BY g.nome, g.descricao, a.nome, a.email;

-- Exibir dados do professor, dados do grupo data e horario
select p.nome as "Nome do professor", 
p.disciplina as "Diciplina do professor", 
g.nome as "Nome do grupo", 
g.descricao as "Descrição do grupo", 
ng.dtAvaliacao as "Data de avaliação"
from
professor p join notaGrupo ng
		on ng.fkProfessor = p.idProfessor
join grupo g
	on ng.fkGrupo = g.idGrupo; 
    
-- Exibir dados do professor, dados do grupo data e horario de um determinado grupo
select p.nome as "Nome do professor", 
p.disciplina as "Diciplina do professor", 
g.nome as "Nome do grupo", 
g.descricao as "Descrição do grupo", 
ng.dtAvaliacao as "Data de avaliação"
from
professor p join notaGrupo ng
		on ng.fkProfessor = p.idProfessor
join grupo g
	on ng.fkGrupo = g.idGrupo
	where g.idGrupo = 2; 
    
-- Exibir os nomes dos grupos avaliados por um determinado professor
select p.nome as "Nome do professor", 
p.disciplina as "Diciplina do professor", 
g.nome as "Nome do grupo"
from
professor p join notaGrupo ng
		on ng.fkProfessor = p.idProfessor
join grupo g
	on ng.fkGrupo = g.idGrupo
		where p.idProfessor = 10002;
        
-- Exibir os dados dos grupos,dados doas alunos, dados do professor e data da avaliação
select g.nome as "Nome do grupo",
g.descricao as "Descrição do grupo",
a.nome as "Nome do aluno",
a.email as "Email do aluno",
p.nome as "Nome do professor",
p.disciplina as "Diciplina do professor",
ng.dtAvaliacao as "Data da avaliação"
from
grupo g join notaGrupo ng
	on ng.fkGrupo = g.idGrupo
join aluno a
	on a.fkGrupo = g.idGrupo
join professor p
    on ng.fkProfessor = p.idProfessor;

-- Exibir notas distintas da avaliação
select count(ng.nota) as "Total de notas dferentes"
from
notaGrupo ng;

-- Identificação do professor, media daas notas e soma das notas distribuidas
select p.nome as "Nome do professor",
avg(ng.nota) as "Média das notas",
sum(ng.nota) as "Soma das notas"
from
professor p join notaGrupo ng
	on ng.fkProfessor = p.idProfessor
group by p.nome;

-- Identificação do professor, media daas notas e soma das notas distribuidas
select g.nome as "Nome do grupo",
avg(ng.nota) as "Média das notas",
sum(ng.nota) as "Soma das notas"
from
grupo g join notaGrupo ng
	on ng.fkGrupo = g.idGrupo
group by g.nome;

-- Identificação do professor, menoor e maior nota atribuída  agrupada por professor
select p.nome as "Nome do professor",
min(ng.nota) as "Menor nota do professor",
max(ng.nota) as "Maior nota do professor"
from
professor p join notaGRupo ng
	on ng.fkProfessor = p.idProfessor
	group by p.nome;

-- Identificação do grupo, menor e maior nota atribuída  agrupada por grupo
select g.nome as "Nome do grupo",
min(ng.nota) as "Menor nota do professor",
max(ng.nota) as "Maior nota do professor"
from
grupo g join notaGRupo ng
	on ng.fkGrupo = g.idGrupo
	group by g.nome;email