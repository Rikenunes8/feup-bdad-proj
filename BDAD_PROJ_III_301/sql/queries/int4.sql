.mode	columns
.headers	on
.nullvalue	NULL


-- 4) Nomes dos Estudantes que frequentam o Clube de Xadrez e o Clube de Luta?

SELECT NãoResponsávelClube.estudante, Estudante.nomeCompleto AS NomeCompleto
    FROM NãoResponsávelClube JOIN Estudante ON NãoResponsávelClube.estudante == Estudante.NIF
    WHERE clube == 'Clube de Xadrez'
UNION
SELECT Clube.responsável, Estudante.nomeCompleto AS NomeCompleto
    FROM Clube JOIN Estudante ON Clube.responsável == Estudante.NIF
    WHERE título == 'Clube de Xadrez'
INTERSECT
SELECT NãoResponsávelClube.estudante, Estudante.nomeCompleto AS NomeCompleto
    FROM NãoResponsávelClube JOIN Estudante ON NãoResponsávelClube.estudante == Estudante.NIF
    WHERE clube == 'Clube de Luta'
UNION
SELECT Clube.responsável, Estudante.nomeCompleto AS NomeCompleto
    FROM Clube JOIN Estudante ON Clube.responsável == Estudante.NIF
    WHERE título == 'Clube de Luta';
