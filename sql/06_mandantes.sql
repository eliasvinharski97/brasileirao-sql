-- Pergunta: quantos jogos terminaram em vitória do mandante, empate
-- ou vitória do visitante? CASE transforma o placar em categoria.
SELECT CASE
         WHEN gols_mandante > gols_visitante THEN 'Vitoria do mandante'
         WHEN gols_mandante < gols_visitante THEN 'Vitoria do visitante'
         ELSE 'Empate'
       END AS resultado,
       COUNT(*) AS jogos,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM partidas), 2) AS percentual
FROM partidas
GROUP BY resultado
ORDER BY jogos DESC, resultado;
