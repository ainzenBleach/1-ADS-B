use sprint2;

-- Relacionamento forte, chave primariaa simples;
-- relacionamento fraco, chave primária composta pelo id e fk; linha cheia 

create table funcionarios_Aula8(
idFuncionario int primary key auto_increment,
nome varchar(45),
dtAdimissao date,
-- auto relacionameto
fkSuperior int not null,
	constraint fkDuncSuper 
		foreign key (fkSuperior)
			references funcionarios_Aula8(idFuncionario)
);

select * from funcionarios_Aula8;

-- inserir o funcionario e ele mesmo é supervisor dele mesmo
insert into funcionarios_Aula8 (nome, fkSuperior) values
("Alessandro",1);

-- inseriros funcionarios que são supervisionados pelo alessandro
insert into funcionarios_Aula8 (nome, fkSuperior) values
("Gerson", 1),
("Brandão",1);

select * from funcionarios_Aula8;

-- select para o auto-relacionamento
select funcionario.nome as Funcionario,
Superior.nome as Superior from
funcionarios_Aula8 as funcionario join 
funcionarios_Aula8 as Superior on funcionario.fkSuperior = superior.idFuncionario;

select funcionarios_Aula8.nome as "Nome do Funionário",
superior.nome as "Nome do superior"
from funcionarios_Aula8 join
funcionarios_Aula8 as superior 
on funcionarios_Aula8.fkSuperior = superior.idFuncionario;

-- Criação da entidade fraca
-- Depende da tabela funcionario para existir
-- chave primária comporta = id e fk

create table dependente(
idDependente int,
fkFuncionario int,
	constraint pkComposta primary key (idDependente, fkFuncionario),
    nome varchar(45),
    parentesco varchar(45),
    constraint fkFuncionarioDependente
		foreign key (fkFuncionario)
        references funcionarios_Aula8(idFuncionario)
);
insert into dependente value
(1,1,"Isabela", "filha"),
(2,1,"Ademir", "filho"),
(1,2,"João", "filho");

select * from funcionarios_Aula8 join dependente on idFuncionario = fkFuncionario;

select funcionario.nome, ifnull(dependente.nome, "Sem dependente") as Dependentes, 
ifnull(dependente.parentesco, "Sem dependente") as Parentesco
from funcionarios_Aula8 as funcionario left join dependente
on idFuncionario = fkFuncionario;

select funcionario.nome as "Nome funcionario",
case
when dependente.nome is null or dependente.parentesco is null then "Sem dependente"
else concat(dependente.nome, ' ', parentesco) 
end as Dependente 
from funcionarios_Aula8 as funcionario left join dependente
on idFuncionario = fkFuncionario;

select funcionario.nome as "Nome funcionario", superior.nome as "Nome do superior",
concat(dependente.nome, " ", parentesco)  as "Dependente" 
from funcionarios_Aula8 as funcionario  join Funcionarios_Aula8 as superior 
on funcionario.fkSuperior = superior.idFuncionario
left join dependente
on funcionario.idFuncionario = dependente.fkFuncionario;