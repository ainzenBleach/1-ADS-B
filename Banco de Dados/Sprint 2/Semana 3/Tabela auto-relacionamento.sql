use sprint2;

create table pet(
idPet int primary key auto_increment,
nome varchar(45),
raca varchar(45),
fkMae int,
fkPai int,
constraint fkFilhoMae foreign key (fkMae)
	references pet(idPet),
constraint fhFilhoPai foreign key (fkPai)
	references pet(idPet)
);

insert into pet values
	(default, 'Homero', 'vira-lata', null, null),
    (default, 'Marggie', 'vira-lata', null, null),
    (default, 'Bart', 'vira-lata', 2, 1);
    
select * from pet;

insert into pet values
	(default, 'Scooby doo pai', 'vira-lata', null, null),
    (default, 'Scooby doo mae', 'vira-lata', null, null),
    (default, 'Scooby doo', 'vira-lata', 5, 4);
 
insert into pet values
	(default, 'Scooby doo pai', 'vira-lata', null, null),
    (default, 'Scooby doo mae', 'vira-lata', null, null),
    (default, 'Scooby doo', 'vira-lata', 4, 5);
    
select filho.nome as Nome_filho,
mae.nome as Nome_mae,
pai.nome as Nome_pai
from pet as filho join pet as mae on filho.fkMae = mae.idPet
join pet as pai
on filho.fkPai = pai.idPet;

insert into pet (nome) values
('Scooby doo avó (mãe da mãe)'),
('Scooby doo avô (pai da mãe)');

update pet set fkMae = 7 where idPet = 5;
update pet set fkPai = 8 where idPet = 5;
update pet set fkMae = 5 where idPet = 6;

select filho.nome as Filho,
mae.nome as Mãe,
avó.nome as Avó,
avô.nome as Avô
from pet as filho join pet as mae
on filho.fkMae = mae.idPet
join pet as avó on mae.fkMae = avó.idPet
join pet as avô
on mae.fkPai = avô.idPet;