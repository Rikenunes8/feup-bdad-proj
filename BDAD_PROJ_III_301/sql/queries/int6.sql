.mode	columns
.headers	on
.nullvalue	NULL

-- 6) Liste, para todos os Estudantes: média, idade, número de Clubes que frequenta e número de Clubes que administra?

SELECT nomeEstudante, media, idadeAtual, responsável, clubesNãoResponsável
FROM (
  (SELECT NIF, nomeEstudante, AVG(notaMax) AS Media, 
          CAST((strftime('%Y.%m%d', 'now')-strftime('%Y.%m%d', dataNascimento)) AS Integer) AS IdadeAtual
  FROM (SELECT NIF, nomeCompleto AS NomeEstudante, MAX(nota) AS NotaMax, dataNascimento
        FROM Estudante E 
          JOIN Avaliação Av ON E.NIF == Av.aluno
          JOIN Disciplina D ON D.ID == Av.disciplina
        GROUP BY NIF, D.ID)
  GROUP BY NIF)
JOIN 
  (SELECT NIF, COUNT(responsável) AS Responsável
  FROM Estudante JOIN Clube ON responsável == NIF
  GROUP BY NIF
  UNION
  SELECT NIF, 0
  FROM Estudante
  WHERE NIF NOT IN (SELECT responsável AS NIF FROM Clube))
USING (NIF)
JOIN 
  (SELECT NIF, COUNT(estudante) AS ClubesNãoResponsável
  FROM Estudante JOIN NãoResponsávelClube ON estudante == NIF
  GROUP BY NIF
  UNION
  SELECT NIF, 0
  FROM Estudante
  WHERE NIF NOT IN (SELECT estudante AS NIF FROM NãoResponsávelClube))
USING (NIF)
);