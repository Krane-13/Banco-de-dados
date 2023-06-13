--1) Retornar os nomes dos alunos que fazem o curso de Administração.
select aluno.nome_aluno from aluno where aluno.cod_curso = (select cod_curso from curso where curso.nome_curso = 'Administração') 

--2) Retornar à quantidade de alunos que fazem o curso de Informática.
select aluno.nome_aluno from aluno where aluno.cod_curso = (select cod_curso from curso where curso.nome_curso = 'Informática') 

3) Retornar à quantidade de alunos que fazem o curso de Informática OU Administração.
select aluno.nome_aluno from aluno where aluno.cod_curso = (select cod_curso from curso where curso.nome_curso = 'Informática')
														   or aluno.cod_curso =(select cod_curso from curso where curso.nome_curso = 'Administração')

--4) Retornar à quantidade de alunos que NÃO fazem o curso de Informática OU Administração.
select  count(*) from aluno where aluno.cod_curso not in (select  cod_curso from curso where curso.nome_curso = 'Administração' or curso.nome_curso ='Informática')

--5) Retornar à quantidade de alunos por curso, ordenando em ordem decrescente pela quantidade de alunos por curso.
select curso.nome_curso , count(nome_aluno) from aluno, curso where aluno.cod_curso = curso.cod_curso
group by nome_curso
order by count(*) desc

--6) Retornar à quantidade de alunos por curso desde que o curso tenha mais do que 2 alunos.
select curso.nome_curso , count(nome_aluno) from aluno, curso where aluno.cod_curso = curso.cod_curso 
group by nome_curso
having count(*)> 2

--7) Retornar o nome do curso que tem maior quantidade de alunos.
select curso.nome_curso , (count(nome_aluno)) from aluno, curso where aluno.cod_curso = curso.cod_curso
group by nome_curso
order by curso.nome_curso asc
limit 1

--8) Retornar o nome do curso que tem menor quantidade de alunos.
select curso.nome_curso , (count(nome_aluno)) from aluno, curso where aluno.cod_curso = curso.cod_curso
group by nome_curso
order by curso.nome_curso desc
limit 1

--9) Retornar o nome do curso que tem a menor e a maior quantidade de alunos, respectivamente.

--10) Retornar o nome do curso que tem a maior e a menor quantidade de alunos, respectivamente.

select * from aluno
select * from curso