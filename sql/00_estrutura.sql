PRAGMA foreign_keys = ON;
CREATE TABLE clubes (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL UNIQUE
);
CREATE TABLE partidas (
    id INTEGER PRIMARY KEY,
    rodada INTEGER NOT NULL CHECK (rodada BETWEEN 1 AND 38),
    data TEXT NOT NULL,
    mandante_id INTEGER NOT NULL REFERENCES clubes(id),
    visitante_id INTEGER NOT NULL REFERENCES clubes(id),
    gols_mandante INTEGER NOT NULL CHECK (gols_mandante >= 0),
    gols_visitante INTEGER NOT NULL CHECK (gols_visitante >= 0),
    CHECK (mandante_id <> visitante_id),
    UNIQUE (mandante_id, visitante_id)
);
-- Cada partida aparece duas vezes: uma na perspectiva de cada clube.
-- Essa visão facilita somar gols feitos e sofridos em casa e fora.
CREATE VIEW desempenho AS
SELECT id AS partida_id, mandante_id AS clube_id, 'casa' AS local,
       gols_mandante AS gols_feitos, gols_visitante AS gols_sofridos
FROM partidas
UNION ALL
SELECT id, visitante_id, 'fora', gols_visitante, gols_mandante
FROM partidas;
