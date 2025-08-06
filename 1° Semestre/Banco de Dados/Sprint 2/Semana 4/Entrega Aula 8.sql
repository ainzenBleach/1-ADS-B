create database aula8;
create database aula8;
use aula8;

CREATE TABLE projeto (
    idProjeto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    descricao VARCHAR(200)
);

CREATE TABLE aluno (
    RA CHAR(8) PRIMARY KEY,
    nome VARCHAR(45),
    telefone CHAR(11),
    fkRepresentante CHAR(8),
    fkProjeto INT,
    CONSTRAINT fkAlunoRepresentante
        FOREIGN KEY (fkRepresentante)
        REFERENCES aluno(RA),
    CONSTRAINT fkAlunoProjeto
        FOREIGN KEY (fkProjeto)
        REFERENCES projeto(idProjeto)
);

INSERT INTO projeto (nome, descricao) VALUES
('Robô Educacional', 'Desenvolvimento de um robô para auxiliar no ensino de crianças.'),
('App de Saúde', 'Aplicativo que monitora sinais vitais e envia alertas.'),
('Website Escolar', 'Criação de um portal para escolas compartilharem materiais.');

INSERT INTO aluno (RA, nome, telefone, fkRepresentante, fkProjeto) VALUES
('043214000', 'João Silva', '11987654321', NULL, 1),
('028496015', 'Maria Oliveira', '11976543210', '043214000', 1),
('263491878', 'Carlos Santos', '11965432109', '043214000', 1),
('247091239', 'Ana Souza', '11954321098', '043214000', 1),
('129748192', 'Pedro Lima', '11943210987', NULL, 2),
('246018283', 'Mariana Rocha', '11932109876', '129748192', 2),
('102680312', 'Lucas Alves', '11921098765', '129748192', 2),
('192374819', 'Fernanda Costa', '11910987654', '129748192', 2),
('129049380', 'Ricardo Mendes', '11909876543', '192374819', 3),
('120398901', 'Camila Nunes', '11908765432', '192374819', 3);

select * from aluno;

select * from projeto;

select aluno.nome as "Nome do Aluno",
projeto.nome as "Projeto", projeto.descricao as "Descrição" 
from aluno join projeto
on aluno.fkProjeto = projeto.idProjeto;

select aluno.nome as "Nome do Aluno",
ifnull(representante.nome, "Representante") as "Nome do Representante"
from aluno left join aluno as representante on 
aluno.fkRepresentante = representante.RA;

select aluno.nome as "Nome do Aluno",
projeto.nome as "Projeto", projeto.descricao as "Descrição" 
from aluno join projeto
on aluno.fkProjeto = projeto.idProjeto where projeto.nome = "App de Saúde";

-- Exercicio 2
create database campanha;
use campanha;

create table organizador(
idOrganizador int primary key auto_increment,
nome varchar(45),
EndereçoRua varchar(45),
EndereçoBairro varchar(45),
email varchar(100),
fkOrgaChefe int,
	constraint fkOrgaOrgaChefe
		foreign key (fkOrgaChefe)
			references organizador(idOrganizador)

);

ALTER TABLE organizador auto_increment = 30;

create table campanha(
idCampanha int primary  key auto_increment,
categoriaDoacao varchar(45),
instituicao varchar(45),
dtFinalizacao date,
fkOrganizador int,
	constraint fkCampanhaOrganizador
		foreign key (fkOrganizador)
			references organizador(idOrganizador)
);

ALTER TABLE campanha auto_increment= 500;

INSERT INTO organizador (nome, EndereçoRua, EndereçoBairro, email, fkOrgaChefe) VALUES
('Carlos Mendes', 'Rua das Flores', 'Bairro Primavera', 'carlos.m@exemplo.com', NULL), 
('Ana Souza', 'Avenida dos Ventos', 'Bairro Aurora', 'ana.souza@exemplo.com', 30), 
('João Lima', 'Rua do Sol', 'Bairro Estrela', 'joao.lima@exemplo.com', 30), 
('Mariana Rocha', 'Travessa do Lago', 'Bairro Sereno', 'mariana.r@exemplo.com', NULL), 
('Fernanda Costa', 'Rua das Palmeiras', 'Bairro Bosque Azul', 'fernanda.c@exemplo.com', 33), 
('Pedro Alves', 'Rua das Acácias', 'Bairro Bela Vista', 'pedro.a@exemplo.com', 30), 
('Lucas Martins', 'Alameda das Hortênsias', 'Bairro das Rosas', 'lucas.m@exemplo.com', 33), 
('Sofia Lima', 'Rua do Girassol', 'Bairro Encantado', 'sofia.l@exemplo.com', NULL),
('Gabriel Torres', 'Avenida Central', 'Bairro Harmonia', 'gabriel.t@exemplo.com', 37), 
('Beatriz Duarte', 'Rua das Cerejeiras', 'Bairro Esperança', 'beatriz.d@exemplo.com', 37); 

INSERT INTO campanha (categoriaDoacao, instituicao, dtFinalizacao, fkOrganizador) VALUES
('Alimentos', 'Instituto Esperança', '2025-06-30', 30), 
('Roupas', 'ONG Vida Nova', '2025-07-15', 30),
('Brinquedos', 'Associação Criança Feliz', '2025-05-20', 31),
('Doces', 'Associação Paz e Amor', '2025-04-20', 31),
('Material Escolar', 'Escola Solidária', '2025-08-10', 32),
('Remédios', 'Hospital do Bem', '2025-09-05', 33),
('Livros', 'Biblioteca Comunitária', '2025-06-25', 34), 
('Cobertores', 'Casa de Apoio Esperança', '2025-07-10', 34), 
('Higiene Pessoal', 'Abrigo Esperança', '2025-09-12', 37), 
('Equipamentos Médicos', 'Clínica Popular', '2025-08-22', 38),
('Doação de Sangue', 'Banco de Sangue São João', '2025-10-05', 39);

select * from organizador;

select * from campanha;

select organizador.nome as Organizador,
campanha.instituicao as Instituição,
campanha.CategoriaDoacao as "Categoria da Doação",
campanha.dtFinalizacao as "Dta de finalição" from
organizador join campanha 
on campanha.fkOrganizador = organizador.idOrganizador; 

select organizador.nome as Organizador,
campanha.instituicao as Instituição,
campanha.CategoriaDoacao as "Categoria da Doação",
campanha.dtFinalizacao as "Dta de finalição" from
organizador join campanha 
on campanha.fkOrganizador = organizador.idOrganizador where idOrganizador = 30;

select organizador.nome as Nome,
concat(organizador.EndereçoRua, " ",organizador.EndereçoBairro )  as Endereço,
organizador.email as Email,
chefe.nome as "Nome do chefe",
concat(chefe.EndereçoRua, " | ",chefe.EndereçoBairro )  as Endereço,
chefe.email as Email 
from organizador join organizador as chefe
on organizador.fkOrgaChefe = chefe.idOrganizador;

select organizador.nome as Nome,
concat(organizador.EndereçoRua, " ",organizador.EndereçoBairro )  as Endereço,
organizador.email as Email,
chefe.nome as "Nome do chefe",
concat(chefe.EndereçoRua, " | ",chefe.EndereçoBairro )  as Endereço,
chefe.email as Email 
from organizador join organizador as chefe
on organizador.fkOrgaChefe = chefe.idOrganizador where chefe.idOrganizador = 37;

select organizador.nome as Nome,
concat(organizador.EndereçoRua, " ",organizador.EndereçoBairro )  as Endereço,
organizador.email as Email,
campanha.instituicao as Instituicao,
campanha.categoriaDoacao as "Categoria da Doação",
campanha.dtFinalizacao as "Data de Finalização",
chefe.nome as "Nome do chefe",
concat(chefe.EndereçoRua, " | ",chefe.EndereçoBairro )  as Endereço,
chefe.email as Email 
from organizador join campanha 
on campanha.fkOrganizador = organizador.idOrganizador 
join organizador as chefe
on organizador.fkOrgaChefe = chefe.idOrganizador;

select organizador.nome as Nome,
concat(organizador.EndereçoRua, " ",organizador.EndereçoBairro )  as Endereço,
organizador.email as Email,
campanha.instituicao as Instituicao,
campanha.categoriaDoacao as "Categoria da Doação",
campanha.dtFinalizacao as "Data de Finalização",
chefe.nome as "Nome do chefe",
concat(chefe.EndereçoRua, " | ",chefe.EndereçoBairro )  as Endereço,
chefe.email as Email 
from organizador join campanha 
on campanha.fkOrganizador = organizador.idOrganizador 
join organizador as chefe
on organizador.fkOrgaChefe = chefe.idOrganizador where organizador.nome = "Ana Souza";