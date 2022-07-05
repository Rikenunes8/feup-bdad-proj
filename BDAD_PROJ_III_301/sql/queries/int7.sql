.mode	columns
.headers	on
.nullvalue	NULL


-- 7) Quais os nomes e NIFs dos Professores com idade acima dos 40 anos que são responsáveis por pelo menos um Clube?

SELECT DISTINCT Docente.NIF, Docente.nomeCompleto, COUNT(*) AS NúmeroDeClubes
FROM Docente  JOIN Clube ON (Docente.NIF == Clube.docente)
WHERE CAST((strftime('%Y.%m%d', 'now')-strftime('%Y.%m%d', dataNascimento)) AS Integer) > 40 
GROUP BY docente;