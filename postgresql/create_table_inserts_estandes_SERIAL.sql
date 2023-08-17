
--CREATE TABLE UTILIZANDO SERIAL (AUTOINCREMENTO) NO CODIGO DO FISCAL 

CREATE TABLE fiscal (
    codfis SERIAL,
    nomfis varchar(50),
    salario numeric(12,2),
	primary key (codfis));
	
CREATE TABLE estande (
    codest SERIAL,
    nomest varchar(50),
    aluguel numeric(12,2),
    codfis integer,
	primary key (codest),
	foreign key (codfis) references fiscal(codfis));

CREATE TABLE produto (
    codprod SERIAL,
    nomprod varchar(50),
	primary key (codprod));

CREATE TABLE vende (
    codest integer NOT NULL,
    codprod integer NOT NULL,
    valor numeric(12,2),
	primary key (codest,codprod),
	foreign key (codest) references estande(codest),
	foreign key (codprod) references produto(codprod));

--INSERTS USANDO SERIAL (AUTOINCREMENTO NO CODIGO DO FISCAL)

INSERT INTO fiscal(nomfis,salario) VALUES ('fulano', 10000.00);
INSERT INTO fiscal(nomfis,salario) VALUES ('beltrano', 11000.00);
INSERT INTO fiscal(nomfis,salario) VALUES ('siclano', 12000.00);


INSERT INTO estande(nomest,aluguel,codfis) VALUES ('ESTANDE 1', 120.00, 1);
INSERT INTO estande(nomest,aluguel,codfis) VALUES ('ESTANDE 2', 120.00, 1);
INSERT INTO estande(nomest,aluguel,codfis) VALUES ('ESTANDE 3', 120.00, 2);
INSERT INTO estande(nomest,aluguel,codfis) VALUES ('ESTANDE 4', 120.00, 2);
INSERT INTO estande(nomest,aluguel,codfis) VALUES ('ESTANDE 5', 120.00, 2);


INSERT INTO produto(nomprod) VALUES ('produto1');
INSERT INTO produto(nomprod) VALUES ('produto2');  
INSERT INTO produto(nomprod) VALUES ('produto3');
INSERT INTO produto(nomprod) VALUES ('produto4');

INSERT INTO vende VALUES (1, 1, 10.00);
INSERT INTO vende VALUES (1, 2, 11.00);
INSERT INTO vende VALUES (1, 3, 12.00);
INSERT INTO vende VALUES (2, 1, 13.00);
INSERT INTO vende VALUES (2, 2, 14.00);
INSERT INTO vende VALUES (3, 1, 23.00);
INSERT INTO vende VALUES (3, 3, 21.00);
  
--SELECTS   
  
select * from fiscal; 

select * from estande;

select * from produto;

select * from vende;

