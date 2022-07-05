PRAGMA foreign_keys=on;

.mode columns
.headers on

DROP TABLE IF EXISTS NãoResponsávelClube;
DROP TABLE IF EXISTS Clube;
DROP TABLE IF EXISTS Avaliação;
DROP TABLE IF EXISTS Quarto;
DROP TABLE IF EXISTS Estudante;
DROP TABLE IF EXISTS DisciplinaTurma;
DROP TABLE IF EXISTS DisciplinaDocente;
DROP TABLE IF EXISTS DocenteTurma;
DROP TABLE IF EXISTS NãoDocente;
DROP TABLE IF EXISTS Docente;
DROP TABLE IF EXISTS Bloco;
DROP TABLE IF EXISTS Turma;
DROP TABLE IF EXISTS Disciplina;

CREATE TABLE Turma(
  ID      INTEGER PRIMARY KEY, 
  ano     INTEGER NOT NULL, 
  número  INTEGER NOT NULL,
  UNIQUE(ano,número),
  CONSTRAINT AnoRange CHECK(ano>=7 AND ano<=12)
);

CREATE TABLE Estudante(
  NIF             INTEGER PRIMARY KEY,
  nomeCompleto    TEXT NOT NULL,
  género          TEXT,
  dataNascimento  TEXT NOT NULL,
  idade           INTEGER, -- To implement in 3rd part
  númeroEstudante INTEGER UNIQUE, 
  interno         INTEGER DEFAULT 0, 
  turma           INTEGER REFERENCES Turma ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT Gender CHECK(género LIKE 'Masculino' OR género LIKE'Feminino' OR género LIKE 'Não-Binário')
);

CREATE TABLE Docente(
  NIF                 INTEGER PRIMARY KEY, 
  nomeCompleto        TEXT NOT NULL, 
  género              TEXT, 
  dataNascimento      TEXT NOT NULL, 
  númeroTurmas        INTEGER, -- To implement in 3rd part
  númeroDisciplinas   INTEGER, -- To implement in 3rd part 
  avaliaçãoPedagógica REAL DEFAULT 5, 
  avaliaçãoEstudantes REAL DEFAULT 5, 
  CONSTRAINT Gender             CHECK(género LIKE 'Masculino' OR género LIKE'Feminino' OR género LIKE 'Não-Binário'),
  CONSTRAINT TurmaRange         CHECK(númeroTurmas>=1 AND númeroTurmas<=5), 
  CONSTRAINT DisciplinaRange    CHECK(númeroDisciplinas>=1), 
  CONSTRAINT AvPedagógicaRange  CHECK(avaliaçãoPedagógica>=1 AND avaliaçãoPedagógica<=10), 
  CONSTRAINT AvEstudantesRange  CHECK(avaliaçãoEstudantes>=1 AND avaliaçãoEstudantes<=10)
);

CREATE TABLE NãoDocente(
  NIF             INTEGER PRIMARY KEY, 
  nomeCompleto    TEXT NOT NULL, 
  género          TEXT, 
  dataNascimento  TEXT NOT NULL,
  dataContratação TEXT NOT NULL, 
  tipo            TEXT NOT NULL, 
  turno           INTEGER,
  CONSTRAINT Gender CHECK(género LIKE 'Masculino' OR género LIKE 'Feminino' OR género LIKE 'Não-Binário'),
  CONSTRAINT Types  CHECK(tipo LIKE 'Auxiliar de Limpeza' OR tipo LIKE 'Auxiliar de Gestão' OR tipo LIKE 'Administrativo'),
  CONSTRAINT Shifts CHECK(turno==1 OR turno==2),
  CONSTRAINT AdultW CHECK(strftime('%Y', dataNascimento)+18< strftime('%Y', dataContratação)),
  CONSTRAINT ALMust CHECK(turno IS NOT NULL OR tipo NOT LIKE 'Auxiliar de Limpeza')
);

CREATE TABLE Bloco(
  número  INTEGER NOT NULL, 
  andar   INTEGER NOT NULL,
  CONSTRAINT NúmeroRange  CHECK(número>=0 AND número<=2), 
  CONSTRAINT AndarRange   CHECK(andar>=0 AND andar<=9),
  PRIMARY KEY(número, andar)
);

CREATE TABLE Quarto(
  código      TEXT PRIMARY KEY,
  bloco_n     INTEGER NOT NULL,
  bloco_a     INTEGER NOT NULL,
  turnoDia    INTEGER UNIQUE REFERENCES NãoDocente ON DELETE RESTRICT ON UPDATE CASCADE, 
  turnoNoite  INTEGER UNIQUE REFERENCES NãoDocente ON DELETE RESTRICT ON UPDATE CASCADE, 
  estudante   INTEGER UNIQUE REFERENCES Estudante  ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT Code       CHECK((LENGTH(código)==3) AND ((código % 100)/10 >= 0) AND ((código % 100)/10 < 3)),
  CONSTRAINT DifShifts  CHECK(turnoDia <> turnoNoite),
  CONSTRAINT FloorNum   CHECK(bloco_a==(código - (código%100))),
  CONSTRAINT BlockNum   CHECK(bloco_n==(código % 100)/10),
  FOREIGN KEY(bloco_n,bloco_a) REFERENCES Bloco(número,andar) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Disciplina(
  ID    INTEGER PRIMARY KEY, 
  nome  TEXT UNIQUE NOT NULL
);

CREATE TABLE Avaliação(
  ID          INTEGER PRIMARY KEY, 
  nota        INTEGER NOT NULL, 
  completa    INTEGER AS (nota>=10), 
  anoLetivo   TEXT    DEFAULT '2020/2021', 
  aluno       INTEGER NOT NULL REFERENCES Estudante   ON DELETE CASCADE ON UPDATE CASCADE, 
  disciplina  INTEGER NOT NULL REFERENCES Disciplina  ON DELETE CASCADE ON UPDATE CASCADE,
  UNIQUE(anoLetivo, aluno, disciplina),
  CONSTRAINT NotaRange  CHECK((nota>=0) AND (nota<=20))
);

CREATE TABLE Clube(
  título            TEXT PRIMARY KEY,
  diaSemana         TEXT,
  númeroElementos   INTEGER, -- To implement in 3rd part
  docente           INTEGER NOT NULL REFERENCES Docente   ON DELETE CASCADE ON UPDATE CASCADE,
  responsável       INTEGER NOT NULL REFERENCES Estudante ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT NumEleRange  CHECK(númeroElementos>=1),
  CONSTRAINT Semana       CHECK(diaSemana LIKE 'Segunda' OR diaSemana LIKE 'Terça' OR diaSemana LIKE 'Quarta' OR diaSemana LIKE 'Quinta' OR diaSemana LIKE'Sexta' OR diaSemana LIKE 'Sábado' OR diaSemana LIKE 'Domingo')
);

CREATE TABLE NãoResponsávelClube(
  clube       TEXT    NOT NULL REFERENCES Clube     ON DELETE CASCADE ON UPDATE CASCADE, 
  estudante   INTEGER NOT NULL REFERENCES Estudante ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY(clube,estudante)
);

CREATE TABLE DocenteTurma(
  docente   INTEGER NOT NULL REFERENCES Docente ON DELETE CASCADE ON UPDATE CASCADE, 
  turma     INTEGER NOT NULL REFERENCES Turma   ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY(docente,turma)
);

CREATE TABLE DisciplinaDocente(
  disciplina  TEXT    NOT NULL REFERENCES Disciplina  ON DELETE CASCADE ON UPDATE CASCADE, 
  docente     INTEGER NOT NULL REFERENCES Docente     ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY(disciplina,docente)
);

CREATE TABLE DisciplinaTurma(
  disciplina  TEXT    NOT NULL REFERENCES Disciplina  ON DELETE CASCADE ON UPDATE CASCADE, 
  turma       INTEGER NOT NULL REFERENCES Turma       ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY(disciplina,turma)
);

