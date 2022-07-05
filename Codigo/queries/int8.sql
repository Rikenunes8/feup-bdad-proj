.mode	columns
.headers	on
.nullvalue	NULL
       
-- 8) Qual o(s) aluno(s) interno(s) com a maior média ao conjunto de disciplinas de Português, Inglês, Francês (de 12º ano)?
  
CREATE VIEW max_grades AS
SELECT NIF, nomeEstudante, AVG(notaMax) AS max_grade
FROM (SELECT NIF, nomeCompleto AS NomeEstudante, MAX(nota) AS NotaMax, dataNascimento
      FROM Estudante E 
        JOIN Avaliação Av ON E.NIF == Av.aluno
        JOIN Disciplina D ON D.ID == Av.disciplina
      WHERE (D.Nome == "Português 12" OR D.Nome == "Inglês 12" OR D.Nome == "Francês 12") AND E.interno == 1
      GROUP BY NIF, D.ID)
GROUP BY NIF
HAVING count(NIF)=3;

SELECT * FROM max_grades WHERE max_grade=(SELECT MAX(max_grade) FROM max_grades);
