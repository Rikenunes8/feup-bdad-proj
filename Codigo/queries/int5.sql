.mode	columns
.headers	on
.nullvalue	NULL

-- 5) A que Estudante, Não-Docentes e Bloco corresponde cada Quarto? Ordene os resultados pelos IDs dos Quartos.

SELECT Quarto.código AS Quarto, Quarto.bloco_a AS AndarDoBloco, Quarto.bloco_n AS NúmeroDoBloco, Estudante.nomeCompleto AS Estudante, NãoDocente.nomeCompleto AS AuxiliarDeLimpeza
FROM Quarto
        JOIN Estudante ON (Quarto.estudante == Estudante.NIF) 
        JOIN NãoDocente ON (Quarto.turnoDia == NãoDocente.NIF OR Quarto.turnoNoite == NãoDocente.NIF)
ORDER BY Quarto.código;
