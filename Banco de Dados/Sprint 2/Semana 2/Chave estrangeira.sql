-- modelo logico
-- Aluno x Empresa x Responsavel

-- tabela responsavel
create table responsavel(
	idResponsavel int primary key auto_increment,
    nome varchar(45)
);

insert into responsavel(nome) values
('Andresa'),
('Joana');

-- tabela empresa
create table empresa(
idEmpresa int primary key auto_increment,
nome varchar(45),
fkResponsavel int unique,
constraint fkEmpresaResponsa
	foreign key (fkResponsavel)
		references responsavel(idResponsavel)
);
-- Num relacionamentoo 1:1, a fk sempre vai ser unique

insert into empresa values
(default, 'C6Bank', 1),
(default, 'Stefanini', 2);

-- tabela aluno
create table aluno(
	RA char(8) primary key,
	nome varchar(45),
    email varchar(45),
    fkEmpresa int,
    constraint fkAlunoEmpresa
		foreign key (fkEmpresa)
			references empresa(idEmpresa)
);

insert into aluno (RA, nome, fkEmpresa) values
("01251100","yuri",1),
("01251101","Bianca",1),
("01251102","Caio",2);

-- Nosso primeiro join (Junçã/relacionar)
-- Juntando as tabelas responsavel e empresa
select * from responsavel join empresa
on idResponsavel = fkResponsavel;

select responsavel.nome as Responsa, empresa.nome as Empresa
from responsavel join empresa
	on idResponsavel = fkResponsavel;
    
-- todo JOIN tem um ON
-- Juntando as tabelas aluno e empresa
select * from empresa join aluno
	on idEmpresa = fkEmpresa;
    
select empresa.nome as Empresa,
aluno.nome as Aluno
from empresa join aluno
on idEmpresa = fkEmpresa;

-- INNER join = join
-- juntando as 3 tabelas
-- o select primeiro lê o from e depois o select, apelidando no from consegue chamar o apelido no select
 select a.nome as NomeAluno,
	e.nome as NomeEmpresa,
    r.nome as NomeResponsa
    from aluno as a join empresa as e
    on a.fkEmpresa = e.idEmpresa
    join responsavel as r
    on e.fkResponsavel = r.idResponsavel
		where a.nome = "Yuri";

insert into responsavel (nome) values
	('Ícaro');
    
select * from responsavel;

select * from responsavel join empresa
	on idResponsavel = fkResponsavel;
    
select a.nome as NomeAluno, e.nome as NomeEmpresa, case
	when e.nome = "C6BAnk" then 'Empresa topzera'
    when e.nome = "stafanini" then 'Empresa top'
    end Empresa
    from aluno as a join empresa as e 
    on a.fkEmpresa = e.idEmpresa;