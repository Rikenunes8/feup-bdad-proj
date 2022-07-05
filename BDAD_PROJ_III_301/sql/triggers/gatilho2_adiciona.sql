CREATE TRIGGER onemoreClass
AFTER INSERT ON DocenteTurma
BEGIN   
    UPDATE Docente
    SET númeroTurmas == IFNULL(númeroTurmas, 0) + 1
    WHERE NIF == new.docente;
END;




