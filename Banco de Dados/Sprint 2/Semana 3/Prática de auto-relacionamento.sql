use sprint2;

CREATE TABLE funcionarios (
    idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    area VARCHAR(50),
    fkSuperior INT,
    constraint fkFuncionarioSuperior 
        foreign key (fkSuperior) 
        references funcionarios(idFuncionario)
);

INSERT INTO funcionarios (nome, area, fkSuperior) VALUES
('Carlos Silva', 'TI', NULL),
('Ana Souza', 'RH', NULL),
('Mariana Lima', 'TI', 1),
('João Pereira', 'Financeiro', NULL),
('Pedro Santos', 'TI', 1),
('Lucas Oliveira', 'RH', 2),
('Fernanda Costa', 'Financeiro', 4),
('Bruno Mendes', 'TI', 1),
('Gabriela Rocha', 'Marketing', NULL),
('Juliana Alves', 'Marketing', 9);

select * from funcionarios;

select funcionario.nome as nome_funcionario, funcionario.area as Área, supervisor.nome as Supervisor
from funcionarios as funcionario join funcionarios as supervisor on funcionario.fkSuperior = supervisor.idFuncionario;

select funcionario.nome as nome_funcionario, funcionario.area as Área, supervisor.nome as Supervisor
from funcionarios as funcionario join funcionarios as supervisor on funcionario.fkSuperior = supervisor.idFuncionario where funcionario.area = "TI";

select funcionario.nome as nome_funcionario, funcionario.area as Área, supervisor.nome as Supervisor, case
when funcionario.area = "RH" then "Salario é maior que R$4000,00"
when funcionario.area = "TI" then "Salario é maior que R$10000,00"
when funcionario.area = "Marketing" then "Salario é maior que R$2500,00"
when funcionario.area = "Financeiro" then "Salario é resultado do desvio do salario do pessoal do financeiro"
end Pesquisa_de_saalario 
from funcionarios as funcionario join funcionarios as supervisor on funcionario.fkSuperior = supervisor.idFuncionario;

-- Exercício 2

create table usuarios(
idUsuario int primary key auto_increment,
nome varchar(100),
fkEmail int,
fkGerente int,
	constraint fkUsuarioGerente
		foreign key (fkGerente)
        references usuarios(idUsuario)
);



create table email(
idEmail int primary key auto_increment,
email varchar(100) unique,
fkUsuario int,
constraint fkEmailUsuario
		foreign key (fkUsuario)
        references usuarios(idUsuario)
);

INSERT INTO usuarios (nome, fkGerente) VALUES
('Carlos Silva', NULL),
('Ana Souza', 1),
('Mariana Lima', 1),
('João Pereira', NULL),
('Pedro Santos', 1),
('Lucas Oliveira', 2),
('Fernanda Costa', 4),
('Bruno Mendes', 1),
('Gabriela Rocha', NULL),
('Juliana Alves', 9);

INSERT INTO email (email, fkUsuario) VALUES
('carlos.silva@email.com', 1),
('ana.souza@email.com', 2),
('mariana.lima@email.com', 3),
('joao.pereira@email.com', 4),
('pedro.santos@email.com', 5),
('lucas.oliveira@email.com', 6),
('fernanda.costa@email.com', 7),
('bruno.mendes@email.com', 8),
('gabriela.rocha@email.com', 9),
('juliana.alves@email.com', 10),
('ana.souzabackup@email.com', 2),
('pedro.santosbackup@email.com', 5),
('lucas.oliveirabackup@email.com', 6),
('fernanda.costabackup@email.com', 7),
('bruno.mendesbackup@email.com', 8);

select usuario.nome as Nome_usuario, email.email as Email, gerente.nome as Gerente from
usuarios as usuario join email as email on fkUsuario = idUsuario join usuarios as gerente on usuario.fkGerente = gerente.idUsuario;

select usuario.nome as Nome_usuario, email.email as Email, gerente.nome as Gerente from
usuarios as usuario join email as email on fkUsuario = idUsuario join usuarios as gerente on usuario.fkGerente = gerente.idUsuario where gerente.nome = "Carlos Silva";

select usuario.nome as Nome_usuario, email.email as Email, gerente.nome as Gerente,case
when gerente.nome = "Carlos Silva" then "Chefe maneiro"
when gerente.nome = "Ana Souza" then "Passa longe dele"
when gerente.nome = "João Pereira" then "ele na terra, Deus no céu"
when gerente.nome = "Gabriela Rocha" then "Um doce"
end Chefes
from
usuarios as usuario join email as email on fkUsuario = idUsuario join usuarios as gerente on usuario.fkGerente = gerente.idUsuario;