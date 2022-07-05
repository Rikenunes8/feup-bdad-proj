.mode columns
.headers on
.nullvalue NULL

PRAGMA FOREIGN_KEYS = ON;

INSERT INTO Quarto('código', 'bloco_n','bloco_a' , 'turnoDia', 'turnoNoite', 'estudante')
     VALUES('018',1,0,536161789,391282906,123456789);


INSERT INTO Quarto('código','bloco_n','bloco_a' , 'turnoDia', 'turnoNoite', 'estudante')
     VALUES('019',1,0,601088954,722909105,231234589);

SELECT NIF, interno 
FROM Estudante
WHERE NIF = 123456789;

SELECT NIF, interno 
FROM Estudante
WHERE NIF = 231234589;

UPDATE Quarto
SET estudante = NULL
WHERE código LIKE '019';

UPDATE Quarto
SET estudante = 231234589
WHERE código LIKE '018';

SELECT *
FROM Quarto
WHERE código LIKE '018';

SELECT NIF, interno 
FROM Estudante
WHERE NIF = 123456789;

SELECT NIF, interno 
FROM Estudante
WHERE NIF = 231234589;

UPDATE Quarto
SET estudante = 123456789
WHERE código LIKE '019';

SELECT *
FROM Quarto
WHERE código LIKE '019';

SELECT NIF, interno 
FROM Estudante
WHERE NIF = 123456789;

SELECT NIF, interno 
FROM Estudante
WHERE NIF = 231234589;

