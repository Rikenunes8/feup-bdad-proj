CREATE TRIGGER newRoomate
AFTER UPDATE OF estudante ON Quarto
BEGIN
    UPDATE Estudante
    SET interno = 1
    WHERE NIF = new.estudante;

    UPDATE Estudante
    SET interno = 0
    WHERE NIF = old.estudante;
END;
