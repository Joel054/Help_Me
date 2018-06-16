drop schema Help_Me;
create schema Help_Me;
use Help_Me;


create table Usuario(
	id int primary key auto_increment,
    nome varchar(100),
    idade int,
    likes int,
    deslikes int,
    linkFacebook varchar(255)
);

create table _Local(
	id int primary key auto_increment,
    nome varchar(50),
    cidade varchar(255),
    latitude float,
    longitude float
);


create table Ajuda(
	id int primary key auto_increment,
    titulo varchar(50),
    descricao varchar(255),
    idUsuario int,
    idLocal int,
    tipo varchar(20),
    foreign key (idUsuario) references Usuario(id),
    foreign key (idLocal) references _Local(id)
);

create table AjudaProgresso(
	id int primary key auto_increment,
    idAjudado int,
    idAjudante int,
    idAjuda int,
    _status varchar(50),
    foreign key (idAjudado) references Usuario(id),
    foreign key (idAjudante) references Usuario(id),
    foreign key (idAjuda) references Ajuda(id)
);

create table LocalUsuario(
	id int primary key auto_increment,
    idUsuario int,
    idLocal int,
    foreign key (idUsuario) references Usuario(id),
    foreign key (idLocal) references _Local(id)
);
drop function insertLocal;
 DELIMITER $
 CREATE FUNCTION insertLocal(nomeR char(50), cidadeR char(255), latitudeR float, longitudeR float, idUsuarioR int) RETURNS int
 BEGIN
  insert into _local(nome,cidade,latitude,longitude) values (nomeR,cidadeR,latitudeR,longitudeR);
  insert into localUsuario (idLocal,idUsuario) select l.id, u.id from _local l, usuario u where u.id = idUsuarioR order by l.id desc limit 1;
  RETURN 1;
 END
 $
 DELIMITER ;













#testes------------------------------

 SELECT insertLocal("casaaaaaaa","la longe",1,222,1);

select * from _Local l;
where exists( select idLocal from LocalUsuario lu where idUsuario = 1 and lu.idLocal = l.id);

select * from _local l 
	where exists(select lu.id 
	from LocalUsuario lu inner join Usuario u on u.id = lu.idUsuario 
    where l.id = lu.idLocal and lu.idUsuario = 1 );



insert into Usuario values(1,"joao",11,11,2,"dsfsdfsdfsdfsdf"); 

insert into Usuario values(2,"clecio",11,11,2,"dsfsdfsdfsdfsdf"); 

insert into _local values(1,"casa do pão",12,12);
insert into _local values(2,"casa do joao",50,10);

insert ajuda values(1,"comprar pão", "compra pão pra mim", 1,2,"pedido");

insert into ajudaprogresso values(1,1,2,1,"Andamento");
insert into ajudaprogresso values(2,1,2,1,"Finalizado");
insert into ajudaprogresso values(3,2,1,1,"Finalizado");
insert into localUsuario values(1,1,1);
insert into localUsuario values(2,1,2);

select * from localUsuario;
select * from _local;
select * from _local l2 inner join Ajuda a on a.idLocal = l2.id inner join usuario u on u.id = a.idUsuario inner join localusuario lu on lu.idUsuario = u.id inner join _local l on l.id = lu.idLocalwhere (sqrt((l2.latitude - l.latitude)*(l2.latitude - l.latitude)))+(sqrt((l2.longitude - l.longitude)*(l2.longitude - l.longitude)))<5 and u.id = 1;

select ap.* from AjudaProgresso ap inner join Ajuda on idUsuario = idAjudante or idUsuario = idAjudado where idAjudado = 1 or idAjudante = 1;


select * from Ajuda a inner join _local l on l.id = a.idLocal inner join localusuario lu on lu.idLocal = l.id inner join Usuario u on u.id = lu.idUsuario;

 insert into _local(nome,cidade,latitude,longitude) values ("","",1,1);
 select * from _local order by id desc limit 1;





