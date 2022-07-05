.mode	columns
.headers	on
.nullvalue	NULL
       
-- 3) Quais os pares de Turmas que estão a ter aulas lecionadas por um mesmo Professor?

SELECT turma1, turma2, docente, Docente.nomeCompleto
FROM (
    SELECT DISTINCT C.docente AS docente, C.turma AS turma1, D.turma AS turma2
    FROM DocenteTurma C INNER JOIN DocenteTurma D ON c.turma <= d.turma
    WHERE c.turma != d.turma AND c.docente == d.docente
UNION
SELECT DISTINCT C.docente AS docente, D.turma AS turma1, C.turma AS turma2
    FROM DocenteTurma C INNER JOIN DocenteTurma D ON D.turma < C.turma
    WHERE D.turma != D.turma AND c.docente == d.docente)
JOIN Docente ON docente == Docente.NIF
ORDER BY turma1, turma2 ASC;