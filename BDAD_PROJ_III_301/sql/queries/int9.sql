.mode	columns
.headers	on
.nullvalue	NULL

--9) Quais os Estudantes que completaram todas as Disciplinas da sua turma?

SELECT NIF, nomeCompleto, Estudante.turma
FROM Estudante
WHERE Estudante.NIF NOT IN (
    SELECT Estudante.NIF
    FROM Avaliação JOIN DisciplinaTurma ON Avaliação.disciplina = DisciplinaTurma.disciplina
        JOIN Estudante ON DisciplinaTurma.turma = Estudante.turma
    WHERE Avaliação.aluno == Estudante.NIF AND Avaliação.nota NOT IN (
        SELECT nota
        FROM Avaliação
        WHERE nota > 10 AND Avaliação.aluno == Estudante.NIF AND DisciplinaTurma.disciplina == Avaliação.disciplina
    ))
GROUP BY Estudante.turma, nomeCompleto;
