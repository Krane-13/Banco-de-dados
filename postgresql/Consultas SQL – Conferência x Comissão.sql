--1) Listar todas as conferências.
select * from conferencia

--2) Listar apenas os nomes das conferências.
select nome from conferencia 

--3) Listar apenas o código e o nome das conferências.
select codigo from conferencia 

--4) Listar apenas o nome e o endereço das conferências, ordenando o resultado pelo endereço em ordem crescente.
select nome, endereco from conferencia order by endereco

--5) Listar apenas o nome e o endereço das conferências, ordenando o resultado pelo endereço em ordem decrescente.
select nome, endereco from conferencia order by endereco desc

--6) Listar todas as conferências em ordem alfabética (crescente) pelo nome.
select * from conferencia order by nome asc

--7) Listar todas as conferências em ordem decrescente pela data de instalação.
select * from conferencia order by data_instalacao desc

--8) Listar todas as conferências que foram realizadas em “2022”.
select * from conferencia where date_part('year', data_instalacao) =2022

--9) Listar todas as conferências que foram realizadas na “Rua A”.
select * from conferencia where endereco = 'Rua A'

--10) Listar todas as conferências que NÃO foram realizadas na “Rua A”.
select * from conferencia where endereco != 'Rua A'

--11) Listar todas as conferências que foram realizadas antes de “2021”.
select * from conferencia where date_part('year', data_instalacao)< 2021

--12) Listar todas as conferências que foram realizadas entre “2020” e “2021”.
select * from conferencia where date_part('year', data_instalacao) >= 2020 and date_part('year', data_instalacao)<= 2021 

--13) Listar todas as conferências ordenando em ordem decrescente pelo endereço.
select * from conferencia order by endereco

--14) Listar todas as conferências que foram realizadas em endereços que tenham a letra "A" OU
--a letra "B", ordenando em ordem crescente por endereço.
select * from conferencia where endereco like '%A%' or endereco like '%B%' order by endereco

--15) Listar todas as conferências que foram realizadas no mês de “janeiro” do ano de “2020”.
select * from conferencia where date_part('month',  data_instalacao) = 1 AND date_part('year',  data_instalacao) = 2020;

--16) Listar todas as conferências que foram realizadas no mês de “janeiro”, independentemente do ano em questão.
select * from conferencia where date_part('month',  data_instalacao) = 1

--17) Listar todas as conferências que foram realizadas no mês de “janeiro” OU “fevereiro” do ano de “2023”.
select * from conferencia where ((date_part('month',  data_instalacao) = 1 OR date_part('month', data_instalacao) = 2)
AND date_part('year',  data_instalacao) = 2020

--18) Selecionar as conferências que ocorreram no ano atual. Dica: Usar a função date_part('year', now()).
select * from conferencia where date_part('year',  data_instalacao) =  date_part('year',  now())
								 
--19) Selecionar as conferências que ocorreram no mês atual. Dica: Usar a função date_part('month', now()).
select * from conferencia where date_part('month',  data_instalacao) = date_part('month', now())
						 
--20) Selecionar as conferências que ocorreram no dia atual. Dica: Usar a função date_part('day', now()).
select * from conferencia where date_part('day',  data_instalacao) = date_part('day', now())
						