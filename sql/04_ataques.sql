-- Pergunta: quais foram os cinco ataques com mais gols?
-- A visão inclui tanto jogos em casa quanto fora.
SELECT c.nome AS clube, COUNT(*) AS jogos,
       SUM(d.gols_feitos) AS gols_marcados
FROM desempenho AS d
JOIN clubes AS c ON c.id = d.clube_id
GROUP BY c.id, c.nome
ORDER BY gols_marcados DESC, c.nome
LIMIT 5;
