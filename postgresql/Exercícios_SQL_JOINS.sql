--1) Listar todos os clientes.
select * from cliente

--2) Listar todas as compras.
select * from compras

--3) Listar somente os clientes que fizeram compras e quais foram estas compras.
select cliente.nome_cliente, compras.nome_compra from cliente, compras where cliente.id_cliente = compras.id_cliente

--4) Listar somente os nomes dos clientes que NÃO fizeram compras.
select cliente.nome_cliente from cliente 
left join compras on cliente.id_cliente = compras.id_cliente
where compras.id_cliente is null

--5) Listar somente os nomes das compras que NÃO foram adquiridas pelos clientes.
select compras.nome_compra from compras 
left join cliente on cliente.id_cliente = compras.id_cliente
where compras.id_compra is null
!!!!!

--6) Listar o nome da compra de maior preço.
select compras.nome_compra from compras where preco = (select max(compras.preco) from compras)

--7) Listar o nome da compra de menor preço.
select compras.nome_compra from compras where preco = (select min(compras.preco) from compras)

--8) Listar os nomes e o preço das compras que são maiores ou iguais a R$ 1000 reais e menores ou iguais a R$ 1500 reais.
select compras.nome_compra from compras where preco >= 1000 and preco <= 1500

--Realizar as seguintes consultas SQL aplicando o tipo de junção (join) apropriado.
--9) Listar somente os clientes que fizeram compras e quais foram estas compras.

--10) Listar todos os clientes independente se fizeram ou não compras.

--11) Listar todas as compras independente se tal compra foi ou ainda não foi comprada por algum cliente.

--12) Listar todos os clientes que NÃO fizeram nenhuma compra.

--13) Listar todas as compras que NÃO foram adquiridas pelos clientes.

--14) Listar todos os clientes e todas as compras independente se um cliente adquiriu ou não alguma compra.

--15) Listar todos os clientes que NÃO compraram nada e todas as compras que NÃO foram adquiridas pelos clientes.
