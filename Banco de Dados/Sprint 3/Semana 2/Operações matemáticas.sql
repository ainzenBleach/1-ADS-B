create database fm3;
use fm3;

-- funções matemáticas | Apenas em select

create table registro(
	idRegistro int primary key auto_increment,
    temperatura double not null, -- Double número decimal aaté 15 casas
    dtRegistro datetime default current_timestamp
);

insert into registro values
	(default, 14.8, default),
    (default, 14.8, default),
    (default, 15.7, default),
    (default, 20.3, default),
    (default, 21, default);
    
select * from registro;

-- CONTADOR count()
select count(temperatura) from registro;
select count(temperatura) as CONTADOR from registro;

-- DIFERENTE distinct()
select distinct temperatura as Contador, dtRegistro from registro;
select count(distinct temperatura) as 'Contador Diferente' from registro;

-- MAIOR max()
select max(temperatura) as MaiorTemp from registro;

-- MENOR min()
select min(temperatura) as MenorTemp from registro;

select max(temperatura) as MaiorTemp,
	   min(temperatura) as MenorTemp
		from registro;
        
-- SOMA sum()
Select sum(temperatura) as Soma from registro;
Select sum( distinct temperatura) as Soma from registro;

-- MÉDIA avg()
select avg(temperatura) as Média from registro;

insert into registro values
	(default, 22.6, default),
    (default, 22.8, default),
    (default, 23.1, default);
    
-- ARREDONDAR round()
select round(avg(temperatura), 2) as Média from registro;
select round(avg(temperatura), 3) as Média from registro;
select round(avg(temperatura), 0) as Média from registro;

-- TRUNCAR truncate()
select truncate(avg(temperatura), 1) as Média from registro;

-- LIMITAR limit
select * from registro limit 1 ;
select * from registro order by temperatura desc limit 1 ;

-- AGRUPAMENTO group by()
select dtRegistro, truncate(avg(temperatura), 2) as Média 
	from registro
		group by (dtRegistro);
        
select dtRegistro, truncate(avg(temperatura), 2) as Média,
	sum(temperatura) as Soma
	from registro
		group by (dtRegistro);
        
-- SUBQUERY - select dentro de um select utilizamos entre (), temperatura > (select * from registro)
select dtRegistro, temperatura
	from registro
		where temperatura > (select avg(temperatura) from registro);

select count(temperatura)
	from registro
		where temperatura > (select avg(temperatura) from registro);
        
-- HAVING - utilizado depois do 'group by', seria um 'sendo' e pode ser utilizado o select.
select dtRegistro, sum(temperatura) as SOMA
	from registro
		group by dtRegistro
		having avg(temperatura) > 20;
        
-- MÊS - month()
select month(dtRegistro) from registro;