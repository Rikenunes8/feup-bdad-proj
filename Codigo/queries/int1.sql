.mode	columns
.headers	on
.nullvalue	NULL

-- 1) Quais os números únicos e nomes de Estudantes que possuam Avaliações positivas a qualquer Disciplina? Inclua as notas e disciplinas em questão.

SELECT E.númeroEstudante AS Número, E.nomeCompleto AS NomeCompleto, D.nome AS Disciplina, A.nota AS Nota
FROM Avaliação A JOIN Estudante E JOIN Disciplina D
ON A.aluno == E.NIF AND A.disciplina=D.ID
WHERE A.nota >= 10;
