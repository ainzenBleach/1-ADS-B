use sprint1;

create table atleta(
idAtleta int primary key auto_increment,
nome varchar(40),
modalidade varchar(40),
qtdMedalha int
);

INSERT INTO atleta (nome, modalidade, qtdMedalha) VALUES
('Ana Silva', 'Natação', 5),
('Bruno Santos', 'Natação', 3),
('Carlos Souza', 'Atletismo', 4),
('Diana Oliveira', 'Atletismo', 2),
('Mariana Lima', 'Ginástica', 7),
('Eduardo Ribeiro', 'Ginástica', 6),
('Fernanda Costa', 'Vôlei', 4),
('Gustavo Pereira', 'Vôlei', 5),
('Isabela Rocha', 'Judô', 3),
('João Mendes', 'Judô', 2);

select * from atleta;

select nome, qtdMedalha from atleta;

select * from atleta where modalidade = "Natação";

select * from atleta order by modalidade asc;

select * from atleta order by qtdMedalha desc;

select * from atleta where nome like "%s%";

select * from atleta where nome like "B%";

select * from atleta where nome like "%o";

select * from atleta where nome like "%r_";

drop table atleta;

-- Exercício 2

create table musica(
idMusica int primary key auto_increment,
titulo varchar(40),
artista varchar(40),
genero varchar(40)
); 

INSERT INTO musica (titulo, artista, genero) VALUES
('Shape of You', 'Ed Sheeran', 'Pop'),
('Blinding Lights', 'The Weeknd', 'Pop'),
('Bohemian Rhapsody', 'Queen', 'Rock'),
('Smells Like Teen Spirit', 'Nirvana', 'Rock'),
('Rap God', 'Eminem', 'Rap'),
('Sicko Mode', 'Travis Scott', 'Rap'),
('Clair de Lune', 'Claude Debussy', 'Clássica'),
('Nocturne Op. 9 No. 2', 'Chopin', 'Clássica'),
('Bailando', 'Enrique Iglesias', 'Latina'),
('Vivir Mi Vida', 'Marc Anthony', 'Latina');

select * from musica;

select titulo, artista from musica;

select * from musica where genero = "pop";

select * from musica where artista = "Ed Sheeran";

select * from musica order by titulo asc;

select *  from musica order by artista desc;

select * from musica where titulo like "s%"; 

select * from musica where artista like "%a"; 

select * from musica where genero like "_o%"; 

select * from musica where titulo like "%t_";

drop table musica; 

-- Exercício 3:

create table filme(
idFilme int primary key auto_increment,
titulo varchar(45),
genero varchar(45),
diretor varchar(45)
);

INSERT INTO filme (titulo, genero, diretor) VALUES
('Interestelar', 'Ficção Científica', 'Christopher Nolan'),
('A Origem', 'Ficção Científica', 'Christopher Nolan'),
('O Cavaleiro das Trevas', 'Ação', 'Christopher Nolan'),
('Tenet', 'Ficção Científica', 'Christopher Nolan'),
('Pulp Fiction', 'Crime', 'Quentin Tarantino'),
('Django Livre', 'Faroeste', 'Quentin Tarantino'),
('Bastardos Inglórios', 'Guerra', 'Quentin Tarantino'),
('Kill Bill: Volume 1', 'Ação', 'Quentin Tarantino'),
('Clube da Luta', 'Drama', 'David Fincher'),
('Seven: Os Sete Crimes Capitais', 'Crime', 'David Fincher');

select * from filme;

select filme.titulo, filme.diretor from filme;

select * from filme where genero = "Ação";

select * from filme where diretor = "Quentin Tarantino";

select * from filme order by titulo;

select * from filme order by diretor desc;

select * from filme where titulo like "s%";

select * from filme where diretor like "%n";

select * from filme where genero like "_i%";

select * from filme where titulo like "%a_";

drop table filme;

-- Exercício 4:

create table professor (
idProfessor int primary key auto_increment,
nome varchar(45),
especialidade varchar(45),
dtNasc date 
);

INSERT INTO professor (nome, especialidade, dtNasc) VALUES
('Carlos Silva', 'Matemática', '1980-05-12'),
('Ana Souza', 'Química', '1985-09-23'),
('Bruno Almeida', 'Física', '1978-11-30'),
('Mariana Costa', 'Artes', '1990-07-19'),
('Lucas Pereira', 'História', '1982-04-25'),
('Fernanda Lima', 'Filosofia', '1995-02-14'),
('Rafael Mendes', 'Literatura', '1976-06-05'),
('Juliana Rocha', 'Geografia', '1988-12-09'),
('Eduardo Santos', 'Biologia', '1983-03-27'),
('Patrícia Oliveira', 'Informática', '1991-08-15');

select * from professor;

select professor.nome, professor.especialidade from professor;

select * from professor where especialidade = "Artes";

select * from professor order by nome;

select * from professor order by dtNasc desc;

select * from professor where nome like "r%";

select * from professor where nome like "%a";

select * from professor where nome like "_r%";

select * from professor where nome like "%r_";

drop table professor;

-- Exercício 5

create table jogo(
idJogo int primary key auto_increment,
nome varchar(45),
comentario varchar(200),
ranking int
);

INSERT INTO jogo (nome, comentario, ranking) VALUES
('The Legend of Zelda: Breath of the Wild', 'Um dos melhores jogos de mundo aberto já feitos!', 10),
('Red Dead Redemption 2', 'História incrível e gráficos impressionantes.', 10),
('The Witcher 3: Wild Hunt', 'Narrativa envolvente e jogabilidade viciante.', 9),
('Dark Souls III', 'Desafiador e recompensador, um clássico do gênero Soulslike.', 9),
('God of War', 'Combate brutal e enredo emocionante.', 10),
('Minecraft', 'Criatividade sem limites e diversão garantida.', 8),
('Hollow Knight', 'Metroidvania desafiador com arte e trilha sonora incríveis.', 9),
('Celeste', 'Plataforma difícil, mas com uma história tocante.', 8),
('Grand Theft Auto V', 'Mundo aberto rico em detalhes e cheio de possibilidades.', 9),
('Elden Ring', 'Exploração fantástica e combate épico.', 10);

select * from jogo;

select jogo.nome from jogo;

select jogo.comentario from jogo where idJogo = 2;

select * from jogo order by nome;

select * from jogo order by ranking desc;

select * from jogo where nome like "d%";

select * from jogo where nome like "%t";

select * from jogo where nome like "_a%";

select * from jogo where nome like "%a_";

select * from jogo where nome not like "Minecraft";

drop table jogo;