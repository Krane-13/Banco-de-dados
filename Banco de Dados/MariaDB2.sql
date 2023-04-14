CREATE table Time(
  idTime int not null AUTO_INCREMENT,
  Nome varchar(50) not null,
  Anofundamento date not null,
  Cidade varchar(100) not null,
  primARY KEY(idTime)
);

create table Prato(
  idPrato int not null AUTO_INCREMENT,
  Nome varchar(50) not null,
  Preco float not null,
  Calorias float not null,
  idTime int not null,
  PRIMARY key(idPrato)
  );
  
alter table Prato
add FOREIGN key (idTime) references Time(idTime);

create table Cliente(
  idCliente int not null AUTO_INCREMENT,
  Nome varchar(100) not null,
  Cpf char(11),
  Celular char(9),
  idIndicacao int,
  idTime int not null,
  primary key (idCliente)
);

alter table Cliente
add FOREIGN key (idtime)references Time(idTime),
add FOREIGN key (idIndicacao)references Cliente(idCliente);

create table Atendente(
  idAtendente int not null AUTO_INCREMENT,
  Nome varchar(100),
  Endereco varchar(150),
  Dataadmicao char(8),
  primary key (idAtendente)
);

create table Pedido(
  idPedido int not null AUTO_INCREMENT,
  Data DATE,
  hora timE,
  idPrato int not null,
  idAtendente int not null,
  idCliente int not null,
  primary key (idPedido)
);

alter table Pedido
add FOREIGN key (idPrato) references Prato(idPrato),
add FOREIGN key (idAtendente) references Atendente (idAtendente),
add FOREIGN key (idCliente) references Cliente(idCliente);