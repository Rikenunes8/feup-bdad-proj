.mode	columns
.headers	on
.nullvalue	NULL
       
-- 10) Quais os Estudantes inscritos em mais que 2 Clubes que tenham mais que uma reprovação registada?

SELECT Estudante.NIF, Estudante.nomeCompleto, (IFNULL(Responsável,0) + IFNULL(clubesNãoResponsável,0)) AS númeroClubes, reprovação
FROM Estudante 
  LEFT JOIN (
    SELECT NIF, COUNT(responsável) AS Responsável
    FROM Estudante JOIN Clube ON responsável=NIF
    GROUP BY NIF
  ) USING (NIF)
  LEFT JOIN (
    SELECT NIF, COUNT(estudante) AS ClubesNãoResponsável
    FROM Estudante JOIN NãoResponsávelClube ON estudante=NIF
    GROUP BY NIF
  ) USING (NIF)
  JOIN (
    SELECT NIF, COUNT(nota) AS Reprovação
    FROM Estudante E 
      JOIN Avaliação Av ON E.NIF == Av.aluno
      JOIN Disciplina D ON D.ID == Av.disciplina
    WHERE nota < 10
    GROUP BY NIF
  ) USING (NIF)
WHERE (IFNULL(Responsável,0) + IFNULL(clubesNãoResponsável,0)) > 2 AND reprovação > 1;
