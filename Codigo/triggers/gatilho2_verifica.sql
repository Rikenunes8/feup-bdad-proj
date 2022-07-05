.mode columns
.headers on
.nullvalue NULL

PRAGMA FOREIGN_KEYS = ON;

INSERT INTO Docente('NIF', 'nomeCompleto', 'Género', 'dataNascimento',  'avaliaçãoPedagógica', 'avaliaçãoEstudantes')
      VALUES(942312867,'John Stewart','Masculino','1990-09-03',7,7);

INSERT INTO Turma('Id', 'ano', 'número')
      VALUES(4, 11, 2);

INSERT INTO Turma('Id', 'ano', 'número')
      VALUES(5, 11, 3);

INSERT INTO Turma('Id', 'ano', 'número')
      VALUES(6, 12, 3);

INSERT INTO Turma('Id', 'ano', 'número')
      VALUES(7, 12, 4);

INSERT INTO Turma('Id', 'ano', 'número')
      VALUES(8, 12, 5);

INSERT INTO Turma('Id', 'ano', 'número')
      VALUES(9, 11, 4);

INSERT INTO DocenteTurma('docente','turma')
      VALUES(942312867,4);

INSERT INTO DocenteTurma('docente','turma')
      VALUES(942312867,5);
      
INSERT INTO DocenteTurma('docente','turma')
      VALUES(942312867,6);

INSERT INTO DocenteTurma('docente','turma')
      VALUES(942312867,7);

INSERT INTO DocenteTurma('docente','turma')
      VALUES(942312867,8);
    
INSERT INTO DocenteTurma('docente','turma') --Constraint failed: TurmaRange
      VALUES(942312867,9);


SELECT *
FROM Docente
WHERE NIF = 942312867;