-- Exerciocio 1

-- 1. Insira pelo menos 5 registros para a tabela.
create table jogo(
	idJogo int primary key auto_increment,
    nome char(30),
    diretor char(30),
    gênero varchar(30),
    dataDeLançamento date,
    nota decimal(2,1),
    quantidade int,
    
    -- 7. Altere a tabela para criar uma checagem na inserção da nota, onde o valor não pode ser menor que 0 e nem maior que 10
    constraint chkNota 
	check(nota between 0 and 10)
);
insert into jogo(nome,diretor,gênero,dataDeLançamento,nota,quantidade) values
	('Minecraft','Notch','Aventura e fantasia','2014-05-17','9.2','1130'),
    ('valorant','Arnar Hrafn Gylfason','FPS','2020-06-20','8.1','354'),
    ('Terraria','Andrew "Redigit" Spinks','Aventura e fantasia','2012-08-15','9.0','7981'),
    ('Kogama','Handerson F. Medeiros','Sandbox','2010-03-01','3.2','7861'),
    ('Pac-man','Tadashi Iguchi','ficção','2006-12-23','8.4','89274');
    
    
select * from jogo;

-- 2. Altere a tabela para inserir uma coluna que represente o tipo de mídia que deve armazenar o tipo de jogo apenas com os valores “física” ou “digital”.
alter table jogo add column midia varchar(30);
alter table jogo add constraint chkMidia
	check(midia in('digital','fisica'));
    
select * from jogo;

-- 3. Atualize os registros dos jogos inseridos anteriormente.
update jogo set midia = 'fisica' where idJogo = 7;
update jogo set midia = 'digital' where idJogo = 8;  
update jogo set midia = 'digital' where idJogo = 9; 
update jogo set midia = 'fisica' where idJogo = 10; 
update jogo set midia = 'digital' where idJogo = 11; 

update jogo set nota = 8.1 where idjogo = 7;
update jogo set gênero = 'sandbox' where idjogo = 7;
update jogo set quantidade = 0 where idjogo = 10;
update jogo set nota = 6.2 where idjogo = 11;
update jogo set quantidade = 6278 where idjogo = 11;

select * from jogo;

-- Exiba apenas os jogos com data de lançamento a partir de 2015.
select * from jogo where dataDeLançamento >= '2015-01-01';

-- 5. Exiba os jogos que tenham a letra “a” em seu nome e são de mídia física.
select * from jogo where nome like '%a%'and
midia = 'fisica';

-- 6. Exiba os jogos onde o nome do diretor não contenha a letra “e”.
select * from jogo where diretor not like '%e%';

-- 8. Exiba os jogos de um determinado gênero e que ainda esteja em estoque.

select * from jogo where gênero = 'sandbox' and quantidade > '0';

-- 9. Exclua os jogos que não têm mais unidades disponíveis em estoque.
delete from Jogo where idJogo = 10 ;
select * from jogo;

-- 10. Renomeie a coluna “diretor” para “criador” e exiba como ficou a estrutura da tabela.
alter table jogo rename column diretor to criador;
select * from jogo;

-- Exercicio 2
create table esporte(
	idEsporte int primary key auto_increment,
    nome char(40),
    categoria char(20),
    constraint chkCategoria
    check(categoria in('Individual','Coletivo')),
    númerosDeJogadores int,
    estreia date,
    paísDeOrigem char(30)
);

select * from esporte;

-- 1. Insira pelo menos 5 registros na tabela.
insert into esporte(nome,categoria,númerosDeJogadores,estreia, paísDeOrigem) values
	('boxe','individual','2','1904-12-01','Grécia'),
    ('basquete','Coletivo','12','1904-03-18','Canadá'),
    ('xadrez','individual','2','1924-11-19','Italia'),
    ('tênis','individual','2','2018-06-09','Alemanha'),
    ('futebol','Coletivo','22','2010-08-24','Inglaterra');
    select * from esporte;
    
-- 2. Altere a tabela para adicionar uma coluna popularidade que armazene a popularidade do esporte como um valor decimal entre 0 e 10 e exiba como
-- ficou a estrutura da tabela.

alter table esporte add column popularidade decimal(10,2);
select * from esporte;


-- Atualize os registros para definir a popularidade dos esportes inseridos anteriormente
update esporte set popularidade = 8.7  where idEsporte = 1;
update esporte set popularidade = 9.2 where idEsporte = 2;
update esporte set popularidade = 7.5 where idEsporte = 3;
update esporte set popularidade = 6.4 where idEsporte = 4;
update esporte set popularidade = 9.8 where idEsporte = 5;

select * from esporte;

-- 4. Exiba os esportes ordenados por popularidade em ordem crescente.
select * from esporte order by popularidade asc;

-- 5. Exiba apenas os esportes que estrearam nas Olimpíadas a partir do ano 2000
select * from esporte where estreia > '2000-01-01';

-- Crie uma checagem para que não possa ser inserido valores dentro de  
-- estreia que seja menor que 06 de abril de 1896 e depois da data atual.
alter table esporte add constraint chkEstreia check (estreia > '1896-05-06');
select * from esporte;

-- erro por causa do constraint
insert into esporte (nome,categoria,númerosDeJogadores,estreia, paísDeOrigem, popularidade) values
('canoa','individual','1','1500-01-01','atlantica', 10);
select * from esporte;

-- Altere a tabela para excluir a regra de inserção de categoria, assim 
-- podendo colocar valores além de "Individual" ou "Coletivo".

alter table esporte drop constraint chkCategoria;

-- teste da alteração
insert into esporte (nome,categoria,númerosDeJogadores,estreia, paísDeOrigem, popularidade) values
('canoa','dupla','1','2100-01-01','atlantica', 10),
('triatulo','quarteto','4','2020-01-01','cuba', 8.2);

select * from esporte;

-- Exiba apenas os esportes cujo nome do país de origem tenha "a" na segunda letra.

select * from esporte where paísDeOrigem like '_a%';

-- Exiba os dados onde o número de jogadores por equipe esteja entre 4 e 11. 
select * from esporte where númerosDeJogadores between 4 and 11;

-- Remova os registros onde id seja 1, 3 e 5.
delete from esporte where idEsporte = 1;
delete from esporte where idEsporte = 3;
delete from esporte where idEsporte = 5;
select * from esporte;

-- exercicio 3
create table desenhos (
	idDesenho int primary key auto_increment,
    titulo char(50),
    dataDeLançamento date,
    emissoraOriginal char(50),
    classificação int,
	statusDesenho char(50),    
    nota int,
    
    constraint chkNota
    check(nota between 1 and 5)
) auto_increment = 10;

INSERT INTO desenhos (titulo, dataDeLançamento, emissoraOriginal, classificação, statusDesenho, nota)
VALUES 
    ('Aventuras de Luma', '2020-01-01', 'MundoFeliz', 10, 'cancelado', 4),
    ('Os Guardiões do Sol', '2021-05-15', 'GaláxiaTV', 14, 'finalizado', 3),
    ('Reinos Perdidos', '2019-07-20', 'EstrelaAnimada', 5, 'exibindo', 5),
    ('O Mistério de Pântano', '2022-11-10', 'LuzCinemática', 18, 'cancelado', 2),
    ('Navegantes da Aurora', '2023-02-03', 'SombraChannel', 16, 'exibindo', 4),
    ('Aventura no Oceano Azul', '2020-12-25', 'VentoVivo', 5, 'finalizado', 3),
    ('Lendas do Amanhã', '2021-08-30', 'VentoVivo', 12, 'exibindo', 5);
    
-- 1. Exibir todos os dados da tabela

select * from desenhos; 

-- 2. Exibir todos os desenhos com a classificação menor ou igual a 14 anos

select * from desenhos where classificação <= 14;

-- 3. Exibir todos os desenhos de uma mesma emissora original
 select * from desenhos where emissoraOriginal = 'VentoVivo';
 
 -- 4. Modificar o campo status, para que aceite apenas o status 'exibindo', 
-- 'finalizado', 'cancelado', tente inserir algum outro valor para ver se a regra 
-- foi aplicada
alter table desenhos add constraint chkStatus
check(statusDesenho in ( 'exibindo', 'finalizado', 'cancelado'));

INSERT INTO desenhos (titulo, dataDeLançamento, emissoraOriginal, classificação, statusDesenho, nota)
VALUES 
('Aventuras e mapas', '2019-06-11', 'MundoFeliz', 5, 'Ativo', 3);
select * from desenhos; 

-- 5.Modificar o status 'exibindo' para 'finalizado' de 2 desenhos pelo ID

update desenhos set statusDesenho = 'finalizado' where idDesenho = 10;
update desenhos set statusDesenho = 'finalizado' where idDesenho = 16;
select * from desenhos;

-- 6. Deletar a linha do desenho de ID 12

delete from desenhos where idDesenho = 12;

select * from desenhos;

-- 7. Exibir apenas os desenhos que comecem com uma determinada letra

select * from desenhos where titulo like "o%";

-- 8. Renomear a coluna classificacao para classificacaoIndicativa
alter table desenhos rename column  classificação to classificacaoIndicativa;
select * from desenhos;

-- 9. Atualizar a nota e data de lançamento do desenho de ID 11

update desenhos set nota = 5 where idDesenho = 11;
update desenhos set dataDeLançamento = '2001-10-12' where idDesenho = 11;

select * from desenhos where idDesenho = 11;

-- 10. Limpe todos os dados da tabela

truncate table desenhos;
select * from desenhos;

-- 11. Remover a regra do status do desenho
alter table desenhos drop constraint chkStatus;
INSERT INTO desenhos (titulo, dataDeLançamento, emissoraOriginal, classificacaoIndicativa, statusDesenho, nota)
VALUES 
('Aventuras e mapas', '2019-06-11', 'MundoFeliz', 5, 'Ativo', 3);


-- exercicio 4

create table misteriosSA(
	id int primary key auto_increment,
    nome varchar(40),
    dataDeCompra date,
    preço dec(10,2),
    pesoGramas int,
    dataDeRetirada date
);

-- 1. Insira na tabela, no mínimo 5 compras de alimentos com datas diferentes. 
-- Por agora, não preencha a coluna referente a "data de retirada".
INSERT INTO misteriosSA (nome, dataDeCompra, preço, pesoGramas)  
VALUES  
('Biscoitos scoobys', '2024-11-10', 150.75, 1200),  
('Cachorro-quente', '2023-11-05', 89.99, 500),  
('Biscoitos scoobys', '2024-12-20', 25.50, 150),  
('Cachorro-quente', '2023-12-15', 320.00, 2500),  
('Biscoitos scoobys', '2024-01-25', 199.90, 1800),  
('Cachorro-quente', '2024-03-01', 75.00, 800),
('Biscoitos scoobys', '2021-02-09', 1.00, 1000),  
('Cachorro-quente', '2023-10-30', 129.99 , 1300);
  
-- 2. Verifique se os valores foram inseridos corretamente.
select * from misteriosSA;

-- 3. Exiba os nomes, as datas de compra e retirada e o id dos alimentos 
-- ordenados a partir da data de compra mais antiga.

select * from misteriosSA order by dataDeCompra asc;

-- 4. Alguém comeu uma caixa de biscoitos, atualize a data de retirada da caixa 
-- de “Biscoitos Scooby” que foi comprada a mais tempo.

update misteriosSA set dataDeRetirada = '2025-02-10' where id = 7;
select * from misteriosSA where  id=7;

-- 5. Altere o nome da coluna id para idComida.

alter table misteriosSA rename column id to idComida;
select * from misteriosSA where  idComida=7;

-- 6. Altere o tipo do check para que os alimentos só possam ser “Biscoitos 
-- Scooby” ou “Cachorro-quente”.

alter table misteriosSA add constraint chkComida
	check (nome in('Biscoitos scoobys', 'Cachorro-quente'));
    
INSERT INTO misteriosSA (nome, dataDeCompra, preço, pesoGramas)  
VALUES  
('Fred', '2011-09-11', 190.75, 100);

-- 7. Exiba os produtos onde o nome seja "Biscoitos Scooby" de forma que o 
-- nome das colunas dataCompra apareça como "data da compra" e 
-- dataRetirada apareça como "data da retirada".

select nome, dataDeCompra as 'data da compra', dataDeRetirada as 'data da retirada' from misteriosSA where nome = 'Biscoitos scoobys';

-- 8. Exiba os alimentos que foram comprados antes do dia 25 de julho de 2024.

select * from misteriosSA where dataDeCompra <= '2024-07-24';

-- 9. Exiba os alimentos que possuem um preço acima ou igual a 30.50.

select * from misteriosSA where preço >= 30.50;

-- 10. Limpe a tabela
truncate table misteriosSA;
select * from misteriosSA;

-- exercicio 5
create table heroi(
	id int primary key auto_increment,
    nome char(45),
    versao char(45),
    habilidade varchar(45),
    altura int
);
insert into heroi (nome, versao, habilidade, altura) values
('Superman', 'Clássico', 'Força sobre-humana', 191),
('Mulher-Maravilha', 'Clássico', 'Força, agilidade e resistência', 183),
('Batman', 'Clássico', 'Inteligência, combate e gadgets', 185),
('Flash', 'Clássico', 'Velocidade', 179),
('Aquaman', 'Clássico', 'Controle da água e força sobre-humana', 191),
('Homem-Aranha', 'Ultimate', 'Sentido aranha, agilidade', 178),
('Capitão América', 'Clássico', 'Força e resistência', 185),
('Thor', 'Clássico', 'Força e manipulação de raios', 198),
('Viúva Negra', 'Clássico', 'Habilidades de combate e espionagem', 170),
('Hulk', 'Clássico', 'Força e regeneração', 244);

-- 1. Exiba os dados inseridos na tabela
select * from heroi;

-- 2. Adicione um campo de regeneração, onde ele aceitará apenas os valores 
-- booleanos de TRUE ou FALSE.
alter table heroi add column regeneracao boolean;

update heroi set regeneracao = false where id = 1;
update heroi set regeneracao = true where id = 2;
update heroi set regeneracao = false where id = 3;
update heroi set regeneracao = true where id = 4;
update heroi set regeneracao = false where id = 5;
update heroi set regeneracao = true where id = 6;
update heroi set regeneracao = false where id = 7;
update heroi set regeneracao = true where id = 8;
update heroi set regeneracao = true where id = 9;
update heroi set regeneracao = true where id = 10;
update heroi set regeneracao = true where id = 11;
select * from heroi;
-- 3. Modifique o campo versão para aceitar até 100 caracteres.

alter table heroi modify column versao char(100);

-- 4. Remova o herói de id 3 pois ele se morreu em batalha.
delete from heroi where id=3;
select * from heroi;

-- 5. Chegou reforços, insira um novo herói para a equipe.
insert into heroi(nome, versao, habilidade, altura,regeneracao) value
 ('batman','Novos 52','Preparo e ser rico','190', true);
 select * from heroi where nome = 'batman';
 
 -- 6. Exiba todos os dados inseridos na tabela onde o nome do herói começa 
-- com “C” ou “H”
select * from heroi where nome like 'c%' or nome like 'h%';

-- 7. Exiba todos os dados inseridos na tabela onde o nome do herói não contém 
-- a letra “A” no campo nome.
select * from heroi where nome not like '%a%';

-- 8. Exiba apenas o nome do herói onde a altura for maior que 190
select * from heroi where altura>180;

-- 9. Exiba todos os dados da tabela de forma decrescente pelo nome onde a 
-- altura do herói for maior que 180

select * from heroi where altura > 180 order by nome desc;

-- 10. Limpe os dados da tabela
truncate table heroi;
 

