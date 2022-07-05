CREATE TRIGGER forbidRepeatWeekdayClub
BEFORE INSERT ON NãoResponsávelClube
WHEN EXISTS (
  SELECT NRC.clube, NRC.estudante
  FROM Clube JOIN NãoResponsávelClube NRC ON título == clube
  WHERE diaSemana == (SELECT diaSemana FROM Clube WHERE título == new.clube) AND NRC.estudante == new.estudante
) OR EXISTS (
  SELECT *
  FROM Clube C
  WHERE C.diaSemana == (SELECT diaSemana FROM Clube WHERE título == new.clube) AND C.responsável == new.estudante
)
BEGIN
  SELECT RAISE(ABORT, "You  can't add a club with the same week day");
END;
