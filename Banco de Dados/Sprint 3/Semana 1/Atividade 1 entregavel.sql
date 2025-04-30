-- Atividade 1 - Sprint 3

create database Venda;
use Venda;

-- Criação das tabelas

create table cliente(
idCliente int primary key auto_increment,
nome varchar(45) not null,
email varchar(100),
endereco varchar(100),
fkIndicador int,
	constraint fkClienteIndicador
		foreign key (fkIndicador)
			references cliente(idCliente)
);

create table vendas(
idVendas int primary key auto_increment,
totalVendas float not null,
dtVenda date,
fkcliente int,
	constraint fkVendaCliente
		foreign key (fkCliente)
			references cliente(idCliente)
);

create table produto(
idProduto int primary key auto_increment,
nome varchar(45) not null,
descricao varchar(100),
valor float not null
);

create table carrinho(
idCarrinho int,
fkVenda int,
fkCliente int, 
fkProduto int,
	constraint pkComposta primary key (idCarrinho, fkVenda, fkCliente, fkProduto),
qtdProduto int,
desconto float,
	constraint fkVendaCarrinho 
		foreign key (fkVenda) 
			references vendas(idVendas),
	constraint fkClienteCarrinho 
		foreign key (fkCliente) 
			references cliente(idCliente),
	constraint fkProdutoCarrinho 
		foreign key (fkProduto) 
			references produto(idProduto)
);

-- Alimentando as tabelas
-- Inserindo clientes
insert into cliente (nome, email, endereco, fkIndicador) values
('Ana Souza', 'ana@email.com', 'Rua das Flores, 100', null),
('Bruno Lima', 'bruno@email.com', 'Av. Brasil, 200', 1),
('Carla Mendes', 'carla@email.com', 'Rua Verde, 300', 1),
('Daniel Castro', 'daniel@email.com', 'Praça Azul, 400', 2),
('Eduardo Silva', 'eduardo@email.com', 'Rua Amarela, 500', 2),
('Fernanda Dias', 'fernanda@email.com', 'Av. Central, 600', 3),
('Gabriel Rocha', 'gabriel@email.com', 'Rua Nova, 700', 3),
('Helena Borges', 'helena@email.com', 'Rua Antiga, 800', 4),
('Igor Farias', 'igor@email.com', 'Av. Oceano, 900', 4),
('Julia Campos', 'julia@email.com', 'Rua Sol, 1000', 5),
('Kevin Ramos', 'kevin@email.com', 'Rua Lua, 1100', 5),
('Laura Martins', 'laura@email.com', 'Rua Estrela, 1200', 6),
('Marcos Dias', 'marcos@email.com', 'Rua Jardim, 1300', 6),
('Nina Ferreira', 'nina@email.com', 'Rua Pedra, 1400', 7),
('Otávio Santos', 'otavio@email.com', 'Av. Rio, 1500', 7);

-- Inserindo produtos
insert into produto (nome, descricao, valor) values
('Notebook', 'Notebook Gamer', 4500.00),
('Mouse', 'Mouse sem fio', 120.00),
('Teclado', 'Teclado mecânico', 300.00),
('Monitor', 'Monitor 24 polegadas', 800.00),
('Cadeira Gamer', 'Cadeira ergonômica', 1500.00),
('Smartphone', 'Smartphone de última geração', 3500.00),
('Fone de Ouvido', 'Fone bluetooth', 250.00),
('Tablet', 'Tablet 10 polegadas', 2000.00),
('Impressora', 'Impressora multifuncional', 600.00),
('Webcam', 'Webcam HD', 180.00);

-- Inserindo vendas
insert into vendas (totalVendas, dtVenda, fkCliente) values
(4620.00, '2025-04-01', 1),
(150.00, '2025-04-02', 1),
(3800.00, '2025-04-03', 2),
(800.00, '2025-04-04', 2),
(1700.00, '2025-04-05', 3),
(3750.00, '2025-04-06', 3),
(1400.00, '2025-04-07', 4),
(800.00, '2025-04-08', 4),
(2000.00, '2025-04-09', 5),
(4500.00, '2025-04-10', 5),
(1750.00, '2025-04-11', 6),
(1250.00, '2025-04-12', 6),
(3150.00, '2025-04-13', 7),
(2800.00, '2025-04-14', 7),
(5000.00, '2025-04-15', 8),
(1800.00, '2025-04-16', 9),
(1900.00, '2025-04-17', 10),
(2200.00, '2025-04-18', 11),
(1700.00, '2025-04-19', 12),
(2500.00, '2025-04-20', 13),
(2100.00, '2025-04-21', 14),
(2300.00, '2025-04-22', 15);

-- Inserindo carrinhos
insert into carrinho (idCarrinho, fkVenda, fkCliente, fkProduto, qtdProduto, desconto) values
(1, 1, 1, 1, 7, 0.0),
(2, 2, 1, 2, 14, 5.0),
(3, 3, 2, 6, 3, 0.0),
(4, 4, 2, 4, 9, 10.0),
(5, 5, 3, 5, 2, 0.0),
(6, 6, 3, 1, 11, 5.0),
(7, 7, 4, 8, 6, 0.0),
(8, 8, 4, 4, 1, 8.0),
(9, 9, 5, 8, 13, 0.0),
(10, 10, 5, 1, 4, 5.0),
(11, 11, 6, 9, 5, 0.0),
(12, 12, 6, 2, 10, 5.0),
(13, 13, 7, 1, 12, 0.0),
(14, 14, 7, 6, 8, 5.0),
(15, 15, 8, 5, 1, 0.0),
(16, 16, 9, 7, 15, 0.0),
(17, 17, 10, 2, 2, 5.0),
(18, 18, 11, 3, 7, 5.0),
(19, 19, 12, 4, 6, 0.0),
(20, 20, 13, 6, 5, 0.0),
(21, 21, 14, 9, 14, 5.0),
(22, 22, 15, 10, 3, 0.0);

-- Executando os selects
select * from cliente;
select * from vendas;
select * from produto;
select * from carrinho;

-- Exibir os clientes e suas respectivas vendas

select 
cliente.nome, 
cliente.email, 
cliente.endereco, 
indicador.nome as Indicador, 
indicador.email as "Email do indicador", 
indicador.endereco as "Endereço do indicador", 
vendas.totalVendas, 
vendas.dtVenda
from 
cliente join cliente as indicador 
	on cliente.fkIndicador = indicador.idCliente
join vendas 
	on vendas.fkCliente = cliente.idCliente;
    
-- Dados de um determinado cliente
select 
cliente.nome, 
cliente.email, 
cliente.endereco, 
indicador.nome as Indicador, 
indicador.email as "Email do indicador", 
indicador.endereco as "Endereço do indicador", 
vendas.totalVendas, 
vendas.dtVenda
from 
cliente left join cliente as indicador 
	on cliente.fkIndicador = indicador.idCliente
join vendas 
	on vendas.fkCliente = cliente.idCliente
where cliente.nome = 'Igor Farias';

-- Exibir dados do cliente e de seus indicadores
select 
cliente.nome, 
cliente.email, 
cliente.endereco, 
indicador.nome as Indicador, 
indicador.email as "Email do indicador", 
indicador.endereco as "Endereço do indicador"
from 
cliente left join cliente as indicador 
	on cliente.fkIndicador = indicador.idCliente;
    
-- Exibir dados do cliente e de seus indicadores de somente um determidado
select 
cliente.nome, 
cliente.email, 
cliente.endereco, 
indicador.nome as Indicador, 
indicador.email as "Email do indicador", 
indicador.endereco as "Endereço do indicador"
from 
cliente left join cliente as indicador 
	on cliente.fkIndicador = indicador.idCliente
where cliente.nome = "Helena Borges";

-- Exibir os dados cliente,indicador, venda e produto 
select 
cliente.nome, 
cliente.email, 
cliente.endereco, 
indicador.nome as Indicador, 
indicador.email as "Email do indicador", 
indicador.endereco as "Endereço do indicador", 
vendas.totalVendas, 
vendas.dtVenda,
produto.nome,
produto.descricao,
produto.valor
from 
vendas join carrinho
	on carrinho.fkVenda = vendas.idVendas
join produto
	on carrinho.fkProduto = produto.idProduto
join cliente
	on vendas.fkCliente = cliente.idCliente
join cliente as indicador
	on cliente.fkIndicador = indicador.idCliente;

-- Exibir data da venda, nome do produto e quantidade do produto
select 
vendas.dtVenda as "Data da venda",
produto.nome,
carrinho.qtdProduto as "Quantidade de produto"
from 
vendas join carrinho
	on carrinho.fkVenda = vendas.idVendas
join produto
	on carrinho.fkProduto = produto.idProduto;

