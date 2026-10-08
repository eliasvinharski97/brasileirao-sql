-- Pergunta: qual a pontuação de cada clube pelos placares?
-- Vitória vale 3 pontos; empate, 1. Não é uma classificação oficial:
-- não inclui punições ou todos os critérios de desempate.
SELECT c.nome AS clube, COUNT(*) AS jogos,
       SUM(CASE WHEN d.gols_feitos > d.gols_sofridos THEN 1 ELSE 0 END) AS vitorias,
       SUM(CASE WHEN d.gols_feitos = d.gols_sofridos THEN 1 ELSE 0 END) AS empates,
       SUM(CASE WHEN d.gols_feitos < d.gols_sofridos THEN 1 ELSE 0 END) AS derrotas,
       SUM(d.gols_feitos) AS gols_feitos,
       SUM(d.gols_sofridos) AS gols_sofridos,
       SUM(d.gols_feitos - d.gols_sofridos) AS saldo,
       SUM(CASE WHEN d.gols_feitos > d.gols_sofridos THEN 3
                WHEN d.gols_feitos = d.gols_sofridos THEN 1 ELSE 0 END) AS pontos
FROM desempenho AS d
JOIN clubes AS c ON c.id = d.clube_id
GROUP BY c.id, c.nome
ORDER BY pontos DESC, vitorias DESC, saldo DESC, gols_feitos DESC, c.nome;
