drop schema Help_Me;
create schema Help_Me;
use Help_Me;


create table Usuario(
	id varchar(255) primary key,
    nome varchar(100),
    idade int,
    foto varchar(255),
    urlFacebook varchar(255),
    telefone varchar(255),
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
    idUsuario varchar(255),
    idLocal int,
    tipo varchar(20),
    foreign key (idUsuario) references Usuario(id),
    foreign key (idLocal) references _Local(id)
);

create table AjudaProcesso(
	id int primary key auto_increment,
    idAjudado varchar(255),
    idAjudante varchar(255),
    idAjuda int,
    _status varchar(50),
    foreign key (idAjudado) references Usuario(id),
    foreign key (idAjudante) references Usuario(id),
    foreign key (idAjuda) references Ajuda(id)
);

create table LocalUsuario(
	id int primary key auto_increment,
    idUsuario varchar(255),
    idLocal int,
    foreign key (idUsuario) references Usuario(id),
    foreign key (idLocal) references _Local(id)
);
 DELIMITER $
 CREATE FUNCTION insertLocal(nomeR char(50), cidadeR char(255), latitudeR float, longitudeR float, idUsuarioR varchar(255)) RETURNS int
 BEGIN
  insert into _local(nome,cidade,latitude,longitude) values (nomeR,cidadeR,latitudeR,longitudeR);
  insert into localUsuario (idLocal,idUsuario) select l.id, u.id from _local l, usuario u where u.id = idUsuarioR order by l.id desc limit 1;
  RETURN 1;
 END
 $
 DELIMITER ;


select * from AjudaProcesso;

select * from _local l inner join localUsuario lu on lu.idLocal = l.id inner join Usuario u on lu.idUsuario = u.id where u.id = "1984283784915644" ;

