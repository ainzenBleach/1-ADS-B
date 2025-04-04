use sprint2;

-- Exercicio 1

create table atleta(
	idAtleta int primary key auto_increment,
    nome varchar(40),
    modalidade varchar(40),
    qtdMedalha int
);

INSERT INTO atleta (nome, modalidade, qtdMedalha) VALUES
('Ana Silva', 'Natação', 3),
('Carlos Souza', 'Natação', 2),
('Fernanda Lima', 'Atletismo', 5),
('João Pedro', 'Atletismo', 1),
('Mariana Alves', 'Judô', 4),
('Ricardo Mendes', 'Judô', 2),
('Lucas Oliveira', 'Tênis', 3),
('Gabriela Costa', 'Tênis', 1);

create table pais(
	idPais int primary key auto_increment,
    nome varchar(30),
    capital varchar(40)
);

INSERT INTO pais (nome, capital) VALUES
('Brasil', 'Brasília'),
('Estados Unidos', 'Washington, D.C.'),
('França', 'Paris'),
('Japão', 'Tóquio');

alter table atleta add column fkPais int;
alter table atleta add constraint fkAtletaPais
	foreign key(fkPais)
		references pais(idPais);

update atleta set fkPais = 1 where idAtleta = 1;
update atleta set fkPais = 1 where idAtleta = 2;
update atleta set fkPais = 3 where idAtleta = 3;
update atleta set fkPais = 4 where idAtleta = 4;
update atleta set fkPais = 2 where idAtleta = 5;
update atleta set fkPais = 4 where idAtleta = 6;
update atleta set fkPais = 3 where idAtleta = 7;
update atleta set fkPais = 2 where idAtleta = 8;

select atleta.nome, atleta.modalidade, atleta.qtdMedalha,
pais.nome, pais.capital from atleta join pais on fkPais = idPais;

select a.nome as nomeDoAtleta, p.nome as nomeDoPais
from atleta as a join pais as p on fkPais = idPais;

select a.qtdMedalha as Medalhas, a.nome as Nome, p.nome as nomeDoPais, p.capital as Capital
from atleta as a join pais as p on fkPais = idPais;

-- Exercicio 2

create table musica(
	idMusica int primary key auto_increment,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40)
);

INSERT INTO musica (titulo, artista, genero) VALUES
('Shape of You', 'Ed Sheeran', 'Pop'),
('Perfect', 'Ed Sheeran', 'Pop'),
('Bohemian Rhapsody', 'Queen', 'Rock'),
('We Will Rock You', 'Queen', 'Rock'),
('Smells Like Teen Spirit', 'Nirvana', 'Grunge');

create table album(
	idAlbum int primary key auto_increment,
    nome varchar(40),
    tipo varchar(40),
    dtLançamento date,
    constraint  chkTipo check(tipo in('Digital','Fisico'))
);

INSERT INTO album (nome, tipo, dtLançamento) VALUES
('Divide', 'Digital', '2017-03-03'),
('A Night at the Opera', 'Fisico', '1975-11-21');

select * from musica;
select * from album;

alter table musica add column fkAlbum int;
alter table musica add constraint fkMusicaAlbum
	foreign key (fkAlbum)
		references album(idAlbum);
        
update musica set fkAlbum = 1 where idMusica = 1;
update musica set fkAlbum = 1 where idMusica = 2;
update musica set fkAlbum = 2 where idMusica = 3;
update musica set fkAlbum = 2 where idMusica = 4;
update musica set fkAlbum = 1 where idMusica = 5;

select * from musica join album on fkAlbum = idAlbum;

select m.titulo as NomeDaMusica, a.nome as NomeDoAlbum 
from musica as m join album as a on fkAlbum = idAlbum;

select m.titulo as NomeDaMusica, m.artista as Artista, m.genero as Gênero, a.nome as NomeDoAlbum, a.tipo as Tipo, a.dtLançamento as Lançamento 
from musica as m join album as a on fkAlbum = idAlbum where tipo = "Digital";

-- Exercio 3

create table pessoa(
	idPessoa int primary key auto_increment,
    nome varchar(45),
    cpf char(11)
);

INSERT INTO pessoa (nome, cpf) VALUES
('João Silva', '12345678901'),
('Maria Oliveira', '23456789012'),
('Carlos Souza', '34567890123'),
('Ana Santos', '45678901234'),
('Pedro Almeida', '56789012345'),
(null, null); 
create table reserva(
idReserva int primary key auto_increment,
dtReserva datetime,
dtRetirada datetime,
dtDevolucao datetime,
fkPessoa int,
constraint fkReservaPessoa 
	foreign key (fkPessoa)
    references pessoa(idPessoa)
);

INSERT INTO reserva (dtReserva, dtRetirada, dtDevolucao, fkPessoa) VALUES
('2025-03-10 10:00:00', '2025-03-12 14:00:00', '2025-03-20 18:00:00', 1),
('2025-03-11 09:30:00', '2025-03-13 16:00:00', '2025-03-22 20:00:00', 2),
('2025-03-15 11:00:00', '2025-03-17 13:00:00', '2025-03-25 19:00:00', 3),
('2025-03-18 08:45:00', '2025-03-20 15:00:00', '2025-03-27 17:30:00', 4),
('2025-03-20 12:00:00', '2025-03-22 10:00:00', '2025-03-30 21:00:00', 5);

select * from reserva join pessoa on fkPessoa = idPessoa;

select r.dtReserva as DataDeReserva, r.dtRetirada as DataDeRetirada, r.dtDevolucao as DataDeDevolução,
p.nome as Nome, p.cpf as CPF from reserva as r join pessoa as p on fkPessoa = idPessoa;

select  r.dtReserva as DataDeReserva, r.dtRetirada as DataDeRetirada, r.dtDevolucao as DataDeDevolução,
ifnull(p.nome, "Sem nome") as Nome, ifnull(p.cpf, "Sem cpf") as CPF,  case
	when dtRetirada < "2025-03-14 00:00:00" then 'Pendente'
    when dtRetirada >= "2025-03-14 06:00:00" then 'A caminho'
end DataDeReserva
from reserva as r join pessoa as p on fkPessoa = idPessoa;

-- Exercicio 4

create table pessoa1(
idPessoa1 int primary key auto_increment,
nome varchar(45),
dtNascimento date
);

INSERT INTO pessoa1 (nome, dtNascimento) VALUES
('João Silva', '2000-05-15'),
('Maria Oliveira', '1998-10-22'),
('Carlos Souza', '1995-07-08'),
('Ana Santos', '2002-12-03'),
('Pedro Almeida', '1999-03-27'),
('Jack Reacher', '1999-03-27'),
(null, null);

create table pessoa2(
idPessoa2 int primary key auto_increment,
nome varchar(45),
dtNascimento date,
fkPessoa1 int,
constraint fkPessoa2Pessoa1
	foreign key(fkPessoa1)
		references pessoa1(idPessoa1)
);

INSERT INTO pessoa2 (nome, dtNascimento, fkPessoa1) VALUES
('Lucas Ferreira', '2001-06-10', 1),
('Fernanda Lima', '1997-09-14', 2),
('Roberto Mendes', '1993-11-25', 3),
('Juliana Costa', '2005-04-30', 4),
('Gustavo Rocha', '2000-08-18', 5),
( null, '2000-08-18', 6),
( "Carlos henrique", null, 7);
select * from pessoa1 join pessoa2 
	on fkPessoa1 = idPessoa1;
    
select p1.nome as Participante1, p1.dtNascimento as DataDeNascimento,
 p2.nome as Participante2, p2.dtNascimento as DataDeNascimento from pessoa1 as p1 join pessoa2 as p2
	on fkPessoa1 = idPessoa1;
    
select ifnull(p1.nome, "Segredo") as Participante1, ifnull(p1.dtNascimento, "Segredo") as DataDeNascimento,
 ifnull(p2.nome, "Segredo") as Participante2, ifnull(p2.dtNascimento, "Segredo") as DataDeNascimento, case
	when p2.dtNascimento < "2000-01-01" then "Habilitado para o jogo"
	when p2.dtNascimento >= "2000-01-01" then "Despreparado para o jogo"
    when p2.dtNascimento is null then "Sem dados"
    end Perfil
	from pessoa1 as p1 join pessoa2 as p2
	on fkPessoa1 = idPessoa1;
    
-- Exercicio 5

create table habilitacao(
idHabilitacao int primary key auto_increment,
tipo char(5),
descricao varchar(100)
);

create table motorista(
idmotorista int primary key auto_increment,
nome varchar(45),
fkHabilitacao int,
constraint fkMotoristaHabilitacao
	foreign key (fkHabilitacao)
		references habilitacao(idHabilitacao)
);

insert into habilitacao (tipo, descricao) value
("A","Motocicletas e veículos similares"),
("B","Automóvel e veículos similares"),
("A e B","Motocicletas e automóveis");

INSERT INTO motorista (nome, fkHabilitacao) VALUES
    ("João Silva", 1),
    ("Maria Oliveira", 2),
    ("Carlos Souza", 3),
    ("Ana Santos", 1),
    ("Pedro Almeida", 2),
    ("Fernanda Lima", 3),
	("Mario Antonio", null),
    (null, 1);
truncate motorista;
select * from motorista;

select * from motorista join habilitacao on fkHabilitacao = idHabilitacao;

select motorista.nome, habilitacao.tipo, habilitacao.descricao
from motorista join habilitacao on fkHabilitacao = idHabilitacao;
    
select ifnull(m.nome,"Erro no nome") as motorista, ifnull(h.tipo,"Erro no tipo") as Classificação, 
h.descricao as descrição, case
when h.tipo = "A" then  "Poderá fazer uma fazer a ACC"
when h.tipo = "B" then  "Não poderá fazer uma fazer ACC"
when h.tipo = "A e B" then  "Poderá fazer uma fazer a ACC"
end LicençaACC
from motorista as m join habilitacao as h on fkHabilitacao = idhabilitacao;

-- Exercicio 6

create table endereco(
idendereco int primary key auto_increment,
rua varchar(100),
numero varchar(45)
);

create table farmaceutico(
idfarmaceutico int primary key auto_increment,
nome varchar(100),
fkFarmacia int,
constraint fkFarmaceuticoFarmacia
	foreign key (fkFarmacia)
    references farmacia(idfarmacia)
);

create table farmacia(
idfarmacia int primary key auto_increment,
nome varchar(100),
fkEndereco int,
fkFarmaceutico int,
constraint fkFarmaciaEndereco
	foreign key (fkEndereco)
    references endereco(idendereco)
);


select * from endereco;
INSERT INTO endereco (rua, numero) VALUES
    ("Rua das Flores", "123"),
    ("Avenida Central", "456"),
    ("Praça da Saúde", "789"),
    ("Rua dos Remédios", "101"),
    ("Travessa Bem-Estar", "202"),
    (null, null),
    ("Rua do Sol", "303"),
    (null, null),
    ("Avenida Paulista", "404"),
    ("Rua das Palmeiras", "505");

INSERT INTO farmaceutico (nome, fkFarmacia) VALUES
    ("João Silva",1),
    ("Maria Oliveira",2),
    ("Carlos Souza",3),
    ("Ana Santos",4),
    ("Pedro Almeida",5),
    (null, 3),
    ("Fernanda Lima",6),
    ("Roberto Mendes",7),
    (null, 2),
    ("Juliana Costa",8),
    ("Thiago freire",9),
    ("Wallace pimenta",10);

INSERT INTO farmacia (nome, fkEndereco) VALUES
    ("Farmácia Saúde", 1),
    ("Drogaria Popular", 2),
    ("Farmácia do Povo", 3),
    ("Drogasil", 4),
    ("Farmácia Bem-Estar", 5),
    ("Drogaria Central", 6),
    ("Pague Menos", 7),
    ("Farmácia Econômica", 8),
    ("Drogaria Vida", 9),
    ("Farmácia São João", 10);
    
    select * from farmacia join farmaceutico on fkFarmacia = idfarmacia 
    join endereco on fkEndereco = idendereco;
    
    select fa.nome as Nome, ifnull(fo.nome, "A contratar") as Farmacêutico, ifnull(e.rua, "Em construção") as Rua, ifnull(e.numero, "Em aquisição") as Numeração,
    case
    when fo.nome is null then "Inativo - sem farmaceutico"
    when e.rua is null then "Inativo - sem estrutura"
    when fo.nome is not null then "Ativo"
    end statusDaLoja
    from farmacia as fa join farmaceutico as fo on fkFarmacia = idfarmacia 
    join endereco as e on fkEndereco = idendereco;
    
