create database Sprint1;
use Sprint1;

CREATE TABLE login (
    idLogin INT PRIMARY KEY AUTO_INCREMENT,
    empresa VARCHAR(100),
    CPF VARCHAR(15) UNIQUE,
    senha VARCHAR(50)
);

select * from login;
drop table login;

INSERT INTO login (empresa, CPF, senha) VALUES
('Tech Innovations', '85412397654', 'a1B2c3D4'),
('Green Solutions', '67043918572', '3XyZ7kT9'),
('Future Enterprises', '53790168423', 'm5N0bL8w'),
('Creative Labs', '24687593014', 'Aq2wE4Rt'),
('Skyline Technologies', '32846590128', 'u6VtN9Yz'),
('Quantum Systems', '79163502479', 'h7P8qRf0'),
('Digital Horizons', '85412793056', 'Wq3B0Lk8'),
('Global Networks', '96248751033', 'd2J4Km1V'),
('NextGen Solutions', '76341258974', 'Gz9P0lQa'),
('Innovative Minds', '57281034629', 'Yh7Tr0Ls'),
('Bright Future', '43058921604', 'J9b8ZxRe'),
('Urban Concepts', '51978360217', 's1G4LqN7'),
('Dynamic Ventures', '38620497582', 'Wz8A2hKm'),
('TechnoWave', '74026519830', 'o9V5bD3J'),
('Advanced Dynamics', '91576034812', 'Q0rZ7HpN');

create table carros(
 id int primary key auto_increment,
 placaDoCarro varchar(11) unique,
 numeroDeSensores int,
 statusDoCarro varchar(50),
 constraint chkCarro 
 check (statusDoCarro in('Ativo','Desativado','Manutenção'))
 
);

drop table carros;
select * from carros;

INSERT INTO carros (placaDoCarro, numeroDeSensores, statusDoCarro) VALUES
('ABC-1234', 4, 'Ativo'),
('DEF-5678', 2, 'Desativado'),
('GHI-9101', 6, 'Manutenção'),
('JKL-1122', 3, 'Ativo'),
('MNO-3344', 5, 'Desativado'),
('PQR-5566', 7, 'Manutenção'),
('STU-7788', 4, 'Ativo'),
('VWX-9900', 2, 'Ativo'),
('YZA-2233', 3, 'Desativado'),
('BCD-4455', 8, 'Manutenção'),
('EFG-6677', 5, 'Ativo'),
('HIJ-8899', 3, 'Desativado'),
('KLM-0011', 6, 'Manutenção'),
('NOP-2233', 4, 'Ativo'),
('QRS-4455', 2, 'Desativado');