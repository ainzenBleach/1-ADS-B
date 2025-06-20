-- Desafio top

create database desafio;
use desafio;

-- Criando a tabela

-- Tabela de Clientes
CREATE TABLE clientes (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100)
);

-- Tabela de Itens
CREATE TABLE itens (
    idItem INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    preco DECIMAL(10, 2)
);

-- Tabela de Pedidos
CREATE TABLE pedidos (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    fkCliente INT,
    dtPedido DATE,
    FOREIGN KEY (fkCliente) REFERENCES clientes(idCliente)
);

-- Tabela associativa Itens_Pedido
CREATE TABLE itensPedido (
    fkPedido INT,
    fkItem INT,
    qtdProduto INT ,
    PRIMARY KEY (fkPedido, fkItem),
    
    FOREIGN KEY (fkPedido) REFERENCES Pedidos(idPedido),
    FOREIGN KEY (fkItem) REFERENCES Itens(idItem)
);

-- Tabela de Pagamento
CREATE TABLE Pagamento (
    idPagamento INT PRIMARY KEY AUTO_INCREMENT,
    fkPedido INT,
    valor_pago decimal(10,2),
    dtPagamento date,
    
    FOREIGN KEY (fkPedido) REFERENCES pedidos(idPedido)
);

INSERT INTO clientes (nome, email) VALUES
('Ana Souza', 'ana.souza@email.com'),
('Carlos Silva', 'carlos.silva@email.com'),
('Juliana Rocha', 'juliana.rocha@email.com'),
('Marcos Lima', 'marcos.lima@email.com'),
('Fernanda Alves', 'fernanda.alves@email.com');

INSERT INTO itens (nome, preco) VALUES
('Hambúrguer', 18.90),
('Pizza Margherita', 32.50),
('Refrigerante Lata', 6.00),
('Água Mineral', 3.50),
('Batata Frita', 12.00),
('Salada Caesar', 15.00),
('Suco Natural', 8.50),
('Sorvete', 9.00);

INSERT INTO pedidos (fkCliente, dtPedido) VALUES
(1, '2025-05-01'),
(2, '2025-05-02'),
(3, '2025-05-02'),
(1, '2025-05-03'),
(4, '2025-05-04'),
(5, '2025-05-05'),
(2, '2025-05-06'),
(3, '2025-05-06');

INSERT INTO itensPedido (fkPedido, fkItem, qtdProduto) VALUES
(1, 1, 2),  -- 2 Hambúrgueres
(1, 3, 2),  -- 2 Refrigerantes
(2, 2, 1),  -- 1 Pizza
(2, 5, 1),  -- 1 Batata
(3, 6, 1),  -- 1 Salada
(3, 4, 1),  -- 1 Água
(4, 1, 1),  -- 1 Hambúrguer
(4, 5, 1),  -- 1 Batata
(4, 3, 1),  -- 1 Refrigerante
(5, 2, 1),  -- 1 Pizza
(5, 7, 2),  -- 2 Sucos
(6, 1, 1),  -- 1 Hambúrguer
(6, 8, 1),  -- 1 Sorvete
(7, 2, 1),  -- 1 Pizza
(7, 3, 1),  -- 1 Refrigerante
(8, 6, 1),  -- 1 Salada
(8, 4, 1);  -- 1 Água

INSERT INTO Pagamento (fkPedido, valor_pago, dtPagamento) VALUES
(1, 49.80, '2025-05-01'),  -- 2 hambúrgueres + 2 refri
(2, 44.50, '2025-05-02'),  -- pizza + batata
(3, 18.50, '2025-05-02'),  -- salada + água
(4, 36.90, '2025-05-03'),
(5, 49.00, '2025-05-04'),
(6, 27.90, '2025-05-05'),
(7, 38.50, '2025-05-06'),
(8, 18.50, '2025-05-06');


show tables;


select * from clientes ;
select * from itens;
select * from pedidos;
select * from itensPedido;
select * from Pagamento;

create view vw_detalhes_pedido as
select c.nome as "Nome do cliente",
i.nome as "Nome do item", 
ip.qtdProduto as "Quantidade de produto consumida", 
i.preco as "Preço unitario",
sum(ip.qtdProduto * i.preco) as "Total gasto por item",
sum(ip.qtdProduto) as "Valor total do pedido",
pg.valor_pago as "Valor pago no pedido",
pg.dtPagamento as "Data do pagamento"
from
clientes c join pedidos p
	on p.fkCliente = c.idCliente
join itensPedido ip
	on ip.fkPedido = p.idPedido
join itens i
	on ip.fkItem = i.idItem
join Pagamento pg 
	on pg.fkPedido = p.idPedido
group by c.nome, c.email, i.nome, i.preco, p.dtPedido, p.fkCliente,
ip.fkPedido, ip.fkItem, ip.qtdProduto, pg.fkPedido, pg.valor_pago, pg.dtPagamento;

select * from vw_detalhes_pedido order by `Data do pagamento` asc;
