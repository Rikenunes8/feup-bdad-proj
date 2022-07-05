.mode columns
.headers on
.nullvalue NULL

PRAGMA FOREIGN_KEYS = ON;

INSERT INTO NãoResponsávelClube('clube', 'estudante')
    VALUES ('Clube de Leitura', 354894616);

INSERT INTO NãoResponsávelClube('clube', 'estudante')
    VALUES ('Clube de Luta',218790543);

INSERT INTO NãoResponsávelClube('clube', 'estudante')
    VALUES ('Clube de Luta',276543987);

INSERT INTO NãoResponsávelClube('clube', 'estudante')
    VALUES ('Clube de Debate',609876123);

INSERT INTO NãoResponsávelClube('clube', 'estudante')
    VALUES ('Clube de Fotografia',609876123);

INSERT INTO NãoResponsávelClube('clube', 'estudante')
    VALUES ('Clube de Fotografia',254318321);

INSERT INTO NãoResponsávelClube('clube', 'estudante')
    VALUES ('Clube de Fotografia',567892145);

INSERT INTO Clube('título', 'diaSemana', 'docente', 'responsável')
     VALUES('Clube de História', 'Terça', 426314762, 490876543);

INSERT INTO NãoResponsávelClube('clube', 'estudante') 
      VALUES ('Clube de Gaming',490876543);

INSERT INTO NãoResponsávelClube('clube', 'estudante') -- it's not an error because different weekday
      VALUES ('Clube de Fotografia',509876543);
