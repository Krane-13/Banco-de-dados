create table Materia (
  idMateria int not null AUTO_INCREMENT,
  nome varchar(50) not null,
  primary key (idMateria)
);

create table Matricula (
  idMatricula int not null AUTO_INCREMENT,
  idAluno int not null,
  idMateria int not null,
  Nota decimal(3,1),#3 = casas totais ("antes+depois da vírgula") 1 = casa decimal("depois da vírgula")
  primary key(idMatricula)
);
alter TABLE Matricula
add FOREIGN key(idMateria) references Materia (idMateria);

/*estrategia INFO 2021 para criação das tabelas
usar create table para definier os campos de cada tabela, bem compo PK
após todas sa tabelas criadas, usa alter TABLE para definir as FKs
/*