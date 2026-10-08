-- Pergunta: quantos jogos e gols houve, e qual foi a média por jogo?
SELECT COUNT(*) AS jogos,
       SUM(gols_mandante + gols_visitante) AS gols,
       ROUND(AVG(gols_mandante + gols_visitante), 2) AS media_gols
FROM partidas;
