--Exemplo1: Toda vez que for deletado um registro da tabela cliente quero que este
--registro seja armazenado na tabela backup cliente.

create table cliente (
nome varchar(50),
endereco varchar(100),
rg int,
cidade varchar(30),
estado char(2)
);
create table bk_cliente (
nome varchar(50),
endereco varchar(100),
rg int,
cidade varchar(30),
estado char(2)
);

select * from cliente;

select * from bk_cliente;

--Exemplo1: Toda vez que for deletado um registro da tabela cliente quero que este registro seja armazenado na tabela bk_cliente.
--Agora vamos popular a tabela cliente com alguns registros:

insert into cliente values ('pedro','Rua 1', 12345678,'Santa Maria','RS');
insert into cliente values ('joão','Rua 2', 11223344,'Agudo','RS');
insert into cliente values ('maria','Rua 3', 11227788,'Restinga Seca','RS');
insert into cliente values ('lucas','Rua 4', 22334455,'Faxinal do Soturno','RS');
insert into cliente values ('marcos','Rua 5', 33221100,'São Sepé','RS');

--Exemplo1: Toda vez que for deletado um registro da tabela cliente quero que este
--registro seja armazenado na tabela bk_cliente.
--Após criar as tabelas cliente e bk_cliente, e inserir (popular) alguns registros na
--tabela cliente, vamos criar a função que será chamada pela trigger que iremos criar na sequência.

CREATE OR REPLACE FUNCTION salvaexcluido() RETURNS trigger
as $$
BEGIN
	insert into bk_cliente values (old.nome, old.endereco, old.rg, old.cidade, old.estado);
	RETURN null;
END;
$$ LANGUAGE 'plpgsql';

--Obs1.: A tabela bk_cliente vai receber os dados que estão sendo excluídos da tabela cliente.
--Obs2.: A variável especial old vai ser a responsável por receber estes valores antigos.

--Exemplo1: Toda vez que for deletado um registro da tabela cliente quero que este registro seja armazenado na tabela bk_cliente.
--Agora vamos criar a trigger propriamente dita. Observe que a trigger vai disparar chamando a função salvaexcluido() após a exclusão de um registro da tabela cliente.

CREATE TRIGGER exclusao_cliente
AFTER delete on cliente
FOR EACH ROW EXECUTE PROCEDURE salvaexcluido();

--Agora vamos deletar algum registro da tabela cliente: 
select
delete from cliente where nome='pedro';

_______________________________________________________________________
Raise Exception - gatilhos (triggers)
Eventualmente, pode ser necessário desfazer os efeitos de uma instrução
(Regra de Negócio) e para isso podemos usar o RAISE EXCEPTION.
• RAISE EXCEPTION
• Estará no código do procedimento (function no PostgreSQL)
associado ao gatilho!
RAISE EXCEPTION 'Este gatilho não permite a conclusão do comando'
_______________________________________________________________________


'Exemplo2: Desejamos que na nossa regra de negócio a partir de agora o novo
salário não pode diminuir em relação ao antigo, para isso podemos utilizar a RAISE
EXCEPTION.'
create table empregado
(codemp int, nomemp char(40), salario numeric(10,2),primary key (codemp));
insert into empregado values (1,'emp1',2000.00);

--Exemplo2: Desejamos que na nossa regra de negócio a partir de agora o novo salário não pode diminuir em relação ao antigo, para isso podemos utilizar a RAISE
EXCEPTION.
CREATE OR REPLACE FUNCTION fversal() RETURNS TRIGGER AS $$
BEGIN
	IF NEW.salario < OLD.salario
		THEN RAISE EXCEPTION 'salario nao pode diminuir';
	END IF;
		RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

--Exemplo2: Desejamos que na nossa regra de negócio a partir de agora o novo salário não pode diminuir em relação ao antigo, para isso podemos utilizar a RAISE
EXCEPTION.

CREATE TRIGGER tversal AFTER UPDATE ON empregado
FOR EACH ROW EXECUTE PROCEDURE fversal();
--Agora vamos tentar atualizar o salário de um empregado diminuindo o seu salário.
UPDATE empregado SET salario = 1000 WHERE codemp=1;


--Exemplo3: Nesse exemplo foi definida na regra de negócio que um departamento nãopode ter mais que 4 funcionários alocados.
create table departamento (
coddepto int,
nomdepto char (50),
primary key (coddepto)
);
create table funcionario (
codfunc int,
nomfunc char(50),
coddepto int,
foreign key (coddepto) references departamento (coddepto),
primary key (codfunc)
);

--Exemplo3: Nesse exemplo foi definida na regra de negócio que um departamento não pode ter mais que 4 funcionários alocados.
--Depois de criarmos as tabelas departamento e funcionário, agora vamos popular estas tabelas.
--Populando a tabela departamento:

insert into departamento values (1,'d1');
insert into departamento values (2,'d2');
--Populando a tabela funcionario:
insert into funcionario values (1,'f1',1);
insert into funcionario values (2,'f2',1);
insert into funcionario values (3,'f3',1);
insert into funcionario values (4,'f4',2);
insert into funcionario values (5,'f5',2);

--Exemplo3: Nesse exemplo foi definida na regra de negócio que um departamento não pode ter mais que 4 funcionários alocados.
--Agora vamos criar a função (function) que será disparada pelo gatilho (trigger) que será criada a seguir.

CREATE OR REPLACE FUNCTION fvernumfuncdepto() RETURNS TRIGGER AS $$
DECLARE vconta int;
BEGIN
select count(*) into vconta from funcionario
where coddepto = new.coddepto;
IF vconta > 4 then RAISE EXCEPTION 'mais de 4 funcionários';
END IF;
RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

--Exemplo3: Nesse exemplo foi definida na regra de negócio que um departamento não pode ter mais que 4 funcionários alocados.
--Agora vamos criar o gatilho (trigger) que será responsável por disparar a função (function) que foi criada anteriormente.

CREATE TRIGGER tvernumf AFTER UPDATE OR INSERT ON funcionario
FOR EACH ROW EXECUTE PROCEDURE fvernumfuncdepto();
--Vamos inserir mais um funcionário ao departamento 1.
insert into funcionario values (6,'f6',1);
--Foi possível inserir?
--Agora vamos inserir mais um funcionário alocado ao departamento 1.
insert into funcionario values (7,'f7',1);


