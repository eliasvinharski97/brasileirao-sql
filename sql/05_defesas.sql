-- Pergunta: quais foram as cinco defesas com menos gols sofridos?
SELECT c.nome AS clube, COUNT(*) AS jogos,
       SUM(d.gols_sofridos) AS gols_sofridos
FROM desempenho AS d
JOIN clubes AS c ON c.id = d.clube_id
GROUP BY c.id, c.nome
ORDER BY gols_sofridos, c.nome
LIMIT 5;
