-- Pergunta: quais partidas tiveram pelo menos seis gols?
SELECT p.data, m.nome AS mandante, v.nome AS visitante,
       p.gols_mandante, p.gols_visitante,
       p.gols_mandante + p.gols_visitante AS total_gols
FROM partidas AS p
JOIN clubes AS m ON m.id = p.mandante_id
JOIN clubes AS v ON v.id = p.visitante_id
WHERE p.gols_mandante + p.gols_visitante >= 6
ORDER BY total_gols DESC, p.data, p.id;
