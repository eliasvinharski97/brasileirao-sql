-- Pergunta: quais foram os dez primeiros jogos?
-- Dois JOINs consultam a mesma tabela, com apelidos diferentes.
SELECT p.data, p.rodada, m.nome AS mandante, v.nome AS visitante,
       p.gols_mandante, p.gols_visitante
FROM partidas AS p
JOIN clubes AS m ON m.id = p.mandante_id
JOIN clubes AS v ON v.id = p.visitante_id
ORDER BY p.data, p.id
LIMIT 10;
