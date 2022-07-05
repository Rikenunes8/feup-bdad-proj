.mode	columns
.headers	on
.nullvalue	NULL

-- 2) Quais os Estudantes menores de idade?

DROP View IF EXISTS Idades;
CREATE View Idades AS
SELECT  NIF,dataNascimento AS DataDeNascimento, 
        CAST((strftime('%Y.%m%d', 'now')-strftime('%Y.%m%d', dataNascimento)) AS Integer) AS IdadeAtual
FROM Estudante EI;

SELECT E.númeroEstudante AS NúmeroDeEstudante, E.nomeCompleto AS NomeCompleto, E.dataNascimento AS DataDeNascimento, I.idadeAtual AS Idade
FROM Estudante E JOIN Idades I USING(NIF)    
WHERE idadeAtual < 18;