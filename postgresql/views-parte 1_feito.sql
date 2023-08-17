--1. Os nomes dos fiscais com salário maior do que 10.000,00.
select nomfis from fiscal
where salario > 10.000
select * from fiscal
select * from estande

--2. Os nomes dos fiscais com o número de estandes que eles controlam.
select nomfis, count(*) from fiscal, estande
where estande.codfis = fiscal.codfis
group by nomfis


--3. Os nomes dos fiscais que não controlam estandes.
select * from fiscal
where codfis not in (select fiscal.codfis from fiscal, estande
where estande.codfis = fiscal.codfis )

--4. Os dados dos produtos que não são vendidos em nenhum estande.
create view q4 as
select * from produto
where codprod not in (select produto.codprod from produto, estande, vende
where estande.codest = vende.codest and produto.codprod = vende.codprod)

select * from q4

--5. Os dados dos estandes que não vendem o produto denominado “produto1”.

create view q5 as 
select * from estande
where codest not in (select estande.codest from estande, vende, produto
where estande.codest = vende.codest and produto.codprod = vende.codprod and nomprod ='produto1');
 select * from q5;
 
--6. Os nomes dos produtos com o valor do seu preço médio de venda.
create view q6 as
select nomprod, avg(valor) from produto, vende
where produto.codprod = vende.codprod
group by nomprod 
order by nomprod

select * from q6

--7. Os dados dos produtos vendidos em mais de 2 estandes.
create view q7 as
select produto.codprod, nomprod from produto, vende, estande
where produto.codprod = vende.codprod and estande.codest = vende. codest
group by produto.codprod, nomprod
having count(*) > 2

select * from q7

--8. Os nomes dos produtos e os nomes dos estantes que vendem estes produtos.
--9. Os nomes dos produtos que são vendidos pelo valor mais baixo.
--10. Os nomes dos produtos vendidos pelos estandes controlados pelo fiscal
denominado “fulano”