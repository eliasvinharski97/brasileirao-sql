-- Pergunta: quais rodadas tiveram média acima de três gols por jogo?
-- HAVING filtra os grupos depois de calcular a média.
SELECT rodada, COUNT(*) AS jogos,
       SUM(gols_mandante + gols_visitante) AS gols,
       ROUND(AVG(gols_mandante + gols_visitante), 2) AS media_gols
FROM partidas
GROUP BY rodada
HAVING AVG(gols_mandante + gols_visitante) > 3
ORDER BY media_gols DESC, rodada;
