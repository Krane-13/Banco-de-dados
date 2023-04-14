--Exercícios do trabalho: 19, 20, 22, 23

--19) Liste os nomes dos campeonatos disputados em 2018 com os nomes dos clubes que disputaram estes campeonatos.
select campeonato.nome, clube.nome 
from campeonato, clube, tem
WHERE campeonato.codcamp = tem.codcamp and campeonato.ano=2018 and clube.codclube 
= tem.codclube

--20) Liste o nome dos clubes de futebol que estão entre os 3 primeiros colocados no campeonato “gaúcho” do ano de 2018.
select clube.nome 
from campeonato, clube, tem
WHERE campeonato.codcamp = tem.codcamp and campeonato.ano=2018 and 
campeonato.nome= 'gaúcho' and clube.codclube = tem.codclube
and tem.posicao <=3

-- 22) Liste o nome de jogadores e a posição dos jogadores que atuam na posição de "atacante" OU "zagueiro" do clube de futebol "inter".
select jogador.nome, jogador.posicao
from jogador
where (jogador.posicao = 'atacante' or jogador.posicao = 'zagueiro') and jogador.codclube = 2 

-- 23) Liste os nomes das cidades com os nomes dos clubes destas cidades.
select cidade.nome, clube.nome
from cidade, clube
where cidade.codcidade=clube.codcidade

-- OUTROS EXERCICIOS DA LISTA!!!

-- 1) Listar todos os registros da tabela jogador.
select * from jogador

-- 2) Listar os nomes e as idades dos jogadores ordenando em ordem decrescente de idade.
select jogador.nome, jogador.idade
from jogador
order by jogador.idade desc

-- 3) Listar os nomes e as idades dos jogadores ordenando em ordem crescente de idade.
select jogador.nome, jogador.idade
from jogador
order by jogador.idade asc

-- 4) Atualizar o salário de todos os jogadores do clube com código 1, adicionando um aumento de 20%.
select jogador.salario 
from jogador

update jogador
set salario = ((salario * 0.2) + salario) --300000
where jogador.codjogador = 1

-- 5) Atualizar o salário de todos os jogadores do clube com código 2, diminuindo o salário em 20%.
select jogador.salario 
from jogador

update jogador
set salario = ((salario * 0.2) - salario) * (-1) --400000
where jogador.codjogador = 2

-- 6) Excluir todos os registros dos campeonatos com ano inferior a 2007.
select * from campeonato 

delete from campeonato 
where campeonato.ano < 2007;

-- 7) Excluir todos os registros dos campeonatos com ano inferior a 2006 OU ano superior ou igual a 2018.
select * from campeonato 

delete from campeonato 
where campeonato.ano < 2006 or campeonato.ano >=2018;

-- 8) Liste o nome e o salário do jogador com o menor salário usando subconsulta.
select jogador.nome, jogador.salario
from jogador 
where jogador.salario = (select min(jogador.salario) from jogador)

-- 9) Liste o nome e o salário do jogador com o maior salário usando subconsulta.
select jogador.nome, jogador.salario
from jogador 
where jogador.salario = (select max(jogador.salario) from jogador)

-- 10) Liste o nome do jogador e o salário do jogador com o menor e o maior salário, respectivamente.
select jogador.nome, jogador.salario
from jogador
where jogador.salario = (select min(jogador.salario)FROM jogador) 
						 or jogador.salario = (select max(jogador.salario) from jogador)
order by jogador.salario asc

-- 11) Liste o nome do jogador e o salário do jogador com o maior e o menor salário, respectivamente.
select jogador.nome, jogador.salario
from jogador
where jogador.salario = (select min(jogador.salario)FROM jogador) 
						 or jogador.salario = (select max(jogador.salario) from jogador)
order by jogador.salario desc

-- 12) Liste o nome e o salário do jogador com o menor salário sem usar subconsulta.
select jogador.nome, MIN(jogador.salario)as menor_salario
from jogador
group by jogador.nome
order by menor_salario asc

-- 13) Liste o nome e o salário do jogador com o maior salário sem usar subconsulta.
select jogador.nome, MAX(jogador.salario)as maior_salario
from jogador
group by jogador.nome
order by maior_salario desc

-- 14) Liste o nome e o salário do jogador com o menor salário, pensando na possibilidade de ter maisde um jogador com o menor salário.
select jogador.nome,jogador.salario as menor_salario
from jogador
where salario = ( select  MIN(jogador.salario) from jogador)
limit(select count(*) from jogador where jogador.salario= (select  MIN(jogador.salario) from jogador))		

-- 15) Liste o nome e o salário do jogador com o maior salário, pensando na possibilidade de ter mais de um jogador com o maior salário.
select jogador.nome,jogador.salario as maior_salario
from jogador
where salario = ( select  MAX(jogador.salario) from jogador)
limit(select count(*) from jogador where jogador.salario= (select  MAX(jogador.salario) from jogador))	

-- 16) Liste o nome e o salário do jogador com o menor e o maior salário, respectivamente, pensando na possibilidade de ter mais de um jogador
-- com o menor e/ou maior salário.
select jogador.nome, jogador.salario 
from jogador
where salario = (select MIN(jogador.salario) from jogador) or salario=(select MAX(jogador.salario) from jogador)
limit(select count(*) from jogador where jogador.salario = (select MIN(jogador.salario) from jogador) or 
	  salario=(select MAX(jogador.salario)from jogador))

-- 17) Liste os nomes dos jogadores com os nomes dos seus clubes.
select jogador.nome as nome_jogador, clube.nome as nome_clube
from jogador, clube
where clube.codclube = jogador.codclube 
group by jogador.nome, clube.nome
order by clube.nome

-- 18) Liste os nomes e a posição dos jogadores do clube denominado “grêmio”.
select jogador.nome, jogador.posicao
from jogador
where jogador.codclube = 1

-- 19) Liste os nomes dos campeonatos disputados em 2018 com os nomes dos clubes que disputaram estes campeonatos.
select campeonato.nome, clube.nome
from campeonato, clube, tem
where campeonato.ano = 2018 and (tem.codclube = clube.codclube) 

-- 20) Liste o nome dos clubes de futebol que estão entre os 3 primeiros colocados no campeonato “gaúcho” do ano de 2018.
select clube.nome
from clube, campeonato
where clube.federacao = 'gaúcha' and clube.ranking <= 3
group by clube.nome
-- select * from tem
--select * from clube
-- select * from campeonato

-- 21) Liste o número de jogadores que atuam na posição de “atacante” do clube de futebol “flamengo”.
select  count(*) as num_jogadore
from jogador
where jogador.posicao= 'atacante' and jogador.codclube = 5
--select * from jogador

-- 22) Liste o nome de jogadores e a posição dos jogadores que atuam na posição de "atacante" OU "zagueiro" do clube de futebol "inter".
select jogador.nome, jogador.posicao
from jogador
where (jogador.posicao = 'atacante' or jogador.posicao = 'zagueiro') and jogador.codclube = 2 

-- 23) Liste os nomes das cidades com os nomes dos clubes destas cidades.
select cidade.nome, clube.nome
from cidade, clube
where cidade.codcidade=clube.codcidade

-- 24) Liste os nomes dos clubes com o número de jogadores de cada clube, ordenando pelo número de jogadores de cada clube em ordem decrescente.
select clube.nome, count(jogador.nome)
from clube, jogador
where jogador.codclube=clube.codclube
group by clube.nome
order by count(jogador.nome) desc

-- 25) Liste os nomes das cidades com o número de clubes de cada cidade. Aqui devem ser listadas apenas as cidades que possuem mais de 1 clube,
-- ordenando o resultado em ordem crescente pelo número de clubes de cada cidade.
select cidade.nome, count(clube.codcidade )
from cidade, clube
where cidade.codcidade = clube.codcidade
group by cidade.nome
having count(clube.codcidade) >1
order by count(clube.codcidade) asc

-- 26) Liste os nomes dos clubes que NÃO disputam nenhum campeonato.
select clube.nome
from clube, campeonato, tem
where  clube.codclube not in (select distinct tem.codclube from tem)
group by clube.nome
flamengo
 botafogo
 palmeiras
 santos
 
-- 27) Liste os nomes dos clubes paulistas que NÃO disputaram o campeonato denominado "paulista" do ano de 2018.
select clube.nome
from clube, campeonato, tem
where clube.federacao = 'paulista'and clube.codclube not in (select distinct clube.codclube from clube,tem where clube.codclube = tem.codclube)
group by clube.nome
 select * from tem
 palmeiras
 santos
 
-- 28) Retornar o nome, idade e salário dos jogadores do clube "flamengo" que possuem salário superior a R$500.000,00.
select jogador.nome, jogador.idade, jogador.salario
from jogador, clube
where jogador.codclube = 5 and jogador.salario > 500000
group by jogador.nome, jogador.idade, jogador.salario

-- 29) Retornar o nome e o respectivo número de pontos dos clubes que disputaram o campeonato "mineiro" de 2018.
select clube.nome, tem.pontos
from clube, tem, campeonato
where (campeonato.codcamp = tem.codcamp) and (tem.codclube = clube.codclube) and (campeonato.codcamp = 3 )
group by clube.nome, tem.pontos
 
 select * from tem
 
-- 30) Retornar o nome do clube, o nome do campeonato, o ano do campeonato e o respectivo númerode pontos dos clubes que disputaram o campeonato
--"mineiro" de 2018 OU o campeonato "gaúcho" de 2018.
select clube.nome as nome_clube, campeonato.nome as nome_campeonato, campeonato.ano as ano_do_campeonato, tem.pontos as pontos_do_campeonato
from clube, campeonato, tem
where(campeonato.codcamp = tem.codcamp) and (tem.codclube = clube.codclube) and (campeonato.codcamp = 3 or campeonato.codcamp= 1)
cruzeiro mineiro 2018 6pts
atlético mineiro 2018 4pts

grêmio gaúcho 2018 6pts
inter gaúcho 2018 4pts
juventude gaúcho 2018 4pts
brasil-pel gaúcho 2018 3pts

select * from tem

 insert into cidade values (1, 'Porto Alegre');
 insert into cidade values (2, 'Caxias do Sul');
 insert into cidade values (3, 'Pelotas');
 insert into cidade values (4, 'Santa Maria');
 insert into cidade values (5, 'São Paulo');
 insert into cidade values (6, 'Belo Horizonte');
 insert into cidade values (7, 'Rio de Janeiro');
 insert into cidade values (8, 'Curitiba');
 insert into cidade values (9, 'Recife');
 insert into cidade values (10, 'Bahia');
 
 insert into clube values (1,'grêmio','gaúcha',1, 1);  
 insert into clube values (2,'inter','gaúcha',2, 1);
 insert into clube values (3,'juventude','gaúcha',4, 2);
 insert into clube values (4,'brasil-pel','gaúcha',3, 3);
 insert into clube values (5,'flamengo','carioca',1, 7);
 insert into clube values (6,'botafogo','carioca',2, 7);
 insert into clube values (7,'cruzeiro','mineira',1, 6);
 insert into clube values (8,'atlético-mg','mineira',2, 6); 
 insert into clube values (9,'são paulo','paulista',4, 5);
 insert into clube values (10,'corinthians','paulista',2, 5);
 insert into clube values (11,'palmeiras','paulista',1, 5);
 insert into clube values (12,'santos','paulista',3, 5);
 
 insert into jogador values (1, 'marcelo grohe', 'goleiro', 25, 300000, 1);
 insert into jogador values (2, 'andré', 'atacante', 23, 400000, 1);
 insert into jogador values (3, 'luan', 'atacante', 25, 450000, 1);
 insert into jogador values (4, 'geromel', 'zagueiro', 27, 200000, 1);
 insert into jogador values (5, 'jael', 'atacante', 28, 150000, 1);
 insert into jogador values (6, 'zeca', 'meio campo', 25, 300000, 2);
 insert into jogador values (7, 'marcelo lomba', 'goleiro', 25, 300000, 2);
 insert into jogador values (8, 'leandro damião', 'atacante', 27, 400000, 2);
 insert into jogador values (9, 'guerrero', 'atacante', 24, 250000, 2);
 insert into jogador values (10, 'vitor cuesta', 'zagueiro', 25, 300000, 2);
 insert into jogador values (11, 'bruno henrique', 'atacante', 20, 120000, 5);
 insert into jogador values (12, 'rodrigo caio', 'zagueiro', 25, 300000, 5);
 insert into jogador values (13, 'diego alves', 'goleiro', 25, 350000, 5);
 insert into jogador values (14, 'gabigol', 'atacante', 23, 800000, 5);
 insert into jogador values (15, 'diego', 'meio campo', 27, 400000, 5);
 insert into jogador values (16, 'suárez', 'atacante', 27, 1500000, 1);
 insert into jogador values (17, 'everton galdino', 'atacante', 25, 120000, 1);
 

insert into campeonato values (1, 'gaúcho', 2018);
insert into campeonato values (2, 'paulista', 2018);
insert into campeonato values (3, 'mineiro', 2018);
insert into campeonato values (4, 'carioca', 2018);
insert into campeonato values (5, 'pernambucano', 2018);
insert into campeonato values (6, 'catarinense', 2018);
insert into campeonato values (7, 'paranaense', 2018);
insert into campeonato values (8, 'paranaense', 2006);
insert into campeonato values (9, 'gaúcho', 2005);
insert into campeonato values (10, 'paulista', 2007);


insert into tem values (1, 1,2,6,1);
insert into tem values (1, 2,2,4,2);
insert into tem values (1, 3,2,4,3);
insert into tem values (1, 4,2,3,4);
insert into tem values (2, 9,2,6,1);
insert into tem values (2, 10,2,6,2);
insert into tem values (9, 3,2,3,3);
insert into tem values (9, 4,2,0,4);
insert into tem values (3, 7,2,6,1);
insert into tem values (3, 8,2,4,2);

SELECT * FROM CIDADE;

SELECT * FROM CLUBE;

SELECT * FROM JOGADOR;

SELECT * FROM CAMPEONATO;

SELECT * FROM tem;