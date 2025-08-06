use beeaware;

create table historicoTemperatura(
temperatura float,
historico datetime
);

drop table sensorTemperatura;
create table sensorTemperatura(
idSensor int primary key auto_increment,
temperatura float,
historico datetime
);

insert into sensorTemperatura values
(default, "0.00", current_date());

select * from historicoTemperatura;
select * from sensorTemperatura;