--1)Selecionar todos os empregados
select * from empregado

--2)Selecionar todos os departamentos.
select * from departamento

--3)Selecionar o nome dos empregados.
select empregado.nome_emp from empregado

--4)Selecionar o nome dos empregados, ordenando em ordem crescente de nome
select empregado.nome_emp from empregado order by nome_emp asc

--5)Selecionar o nome dos empregados, ordenando em ordem decrescente de nome.
select empregado.nome_emp from empregado order by nome_emp desc

--6)Selecionar o nome dos departamentos.
select departamento.nome_depto from departamento 

--7)Selecionar o nome do empregado e o nome do departamento no qual cada empregado trabalha. 
select empregado.nome_emp, departamento.nome_depto from empregado, departamento
where empregado.codigo_depto = departamento.codigo_depto

--8)Selecionar o nome do departamento e o número de empregados que possui cada departamento,
--ordenando em ordem decrescente pelo número de empregados por departamento.
select departamento.nome_depto, count(empregado.nome_emp)
from departamento, empregado
where empregado.codigo_depto = departamento.codigo_depto
group by departamento.nome_depto
order by count(empregado.nome_emp)desc

--9)Selecionar o nome do departamento e o número de empregados que possui cada departamento,
--ordenando em ordem crescente pelo nome de departamento.
select departamento.nome_depto, count(empregado.nome_emp)
from departamento, empregado
where empregado.codigo_depto = departamento.codigo_depto
group by departamento.nome_depto
order by count(empregado.nome_emp) asc

--10)Selecionar, sem repetição, os nomes dos departamentos que tenham empregados alocados
select distinct nome_depto
from departamento, empregado
where empregado.codigo_depto = departamento.codigo_depto

--11)Selecionar os nomes dos departamentos que NÃO tenham empregados alocados.
select distinct nome_depto
from departamento, empregado
where nome_depto not in(select distinct nome_depto
from departamento, empregado
where empregado.codigo_depto = departamento.codigo_depto)

--12) Selecionar os nomes dos departamentos e a quantidade de empregados em cada departamento,
--apenas para departamentos com mais de 3 empregados alocados.
select departamento.nome_depto, count(empregado.codigo_depto)
from departamento, empregado
where departamento.codigo_depto = empregado.codigo_depto 
group by nome_depto
having count(empregado.codigo_depto) > 3

!!!!
--13) Selecionar os nomes dos departamentos e a quantidade de empregados em cada departamento,
--apenas para departamentos com mais de 2 empregados alocados, ordenando em ordem decrescente
--pela quantidade de empregados por departamento.
select departamento.nome_depto, count(empregado.codigo_depto)
from departamento, empregado
where departamento.codigo_depto = empregado.codigo_depto 
group by nome_depto
having count(empregado.codigo_depto) > 2
order by count(empregado.codigo_depto) desc

--14) Selecionar o nome dos empregados que trabalham no departamento denominado “TI”.
select empregado.nome_emp
from empregado, departamento
where empregado.codigo_depto = 7
group by empregado.nome_emp

--15) Selecionar o nome dos empregados que trabalham no departamento denominado “TI” ordenando
--em ordem crescente por nome.
select empregado.nome_emp
from empregado, departamento
where empregado.codigo_depto = 7
group by empregado.nome_emp 
order by empregado.nome_emp asc

--16) Selecionar o nome do departamento que possui o menor número de empregados alocados.
select departamento.nome_depto
from departamento, empregado
where departamento.codigo_depto = empregado.codigo_depto
group by departamento.nome_depto
order by count(empregado.codigo_depto) limit 1
!!!!!
--17) Selecionar o nome do departamento que possui o maior número de empregados alocados.
select departamento.nome_depto
from departamento, empregado
where departamento.codigo_depto = empregado.codigo_depto
group by departamento.nome_depto
order by count(empregado.codigo_depto) desc limit 1
!!!!
--18) Selecionar o nome do departamento que possui o menor e o maior número de empregados alocados, respectivamente.

--19) Selecionar o nome do departamento que o empregado de código “1” está alocado.
select departamento.nome_depto
from departamento, empregado
where departamento.codigo_depto = empregado.codigo_depto and empregado.codigo_emp = 1

--20) Selecionar os nomes dos empregados e os nomes dos departamentos que possuem empregados
--alocados no departamento denominado “Almoxarifado” OU no departamento denominado “TI”,
--ordenando o resultado em ordem crescente pelo nome do departamento e pelo nome de empregado.
select empregado.nome_emp, departamento.nome_depto
from empregado, departamento
where departamento.codigo_depto = empregado.codigo_depto and (departamento.nome_depto = 'Almoxarifado' or 
departamento.nome_depto = 'TI')
group by empregado.nome_emp, departamento.nome_depto
order by departamento.nome_depto, empregado.nome_emp 