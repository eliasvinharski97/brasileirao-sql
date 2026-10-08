# Resultados das consultas

Gerados diretamente pelo SQLite. Fonte e recorte: `dados/origem.json`.

## 01_primeiras_partidas

Consulta: [SQL](../sql/01_primeiras_partidas.sql)

| data | rodada | mandante | visitante | gols_mandante | gols_visitante |
| --- | --- | --- | --- | --- | --- |
| 2023-04-15 | 1 | Palmeiras | Cuiaba | 2 | 1 |
| 2023-04-15 | 1 | America-MG | Fluminense | 0 | 3 |
| 2023-04-15 | 1 | Botafogo-RJ | Sao Paulo | 2 | 1 |
| 2023-04-15 | 1 | Bragantino | Bahia | 2 | 1 |
| 2023-04-15 | 1 | Athletico-PR | Goias | 2 | 0 |
| 2023-04-15 | 1 | Fortaleza | Internacional | 1 | 1 |
| 2023-04-15 | 1 | Atletico-MG | Vasco | 1 | 2 |
| 2023-04-16 | 1 | Corinthians | Cruzeiro | 2 | 1 |
| 2023-04-16 | 1 | Flamengo | Coritiba | 3 | 0 |
| 2023-04-16 | 1 | Gremio | Santos | 1 | 0 |

## 02_filtro_gols

Consulta: [SQL](../sql/02_filtro_gols.sql)

| data | mandante | visitante | gols_mandante | gols_visitante | total_gols |
| --- | --- | --- | --- | --- | --- |
| 2023-10-07 | Goias | Bahia | 4 | 6 | 10 |
| 2023-09-18 | Corinthians | Gremio | 4 | 4 | 8 |
| 2023-10-22 | Internacional | Santos | 7 | 1 | 8 |
| 2023-10-25 | Fluminense | Goias | 5 | 3 | 8 |
| 2023-07-09 | Santos | Goias | 4 | 3 | 7 |
| 2023-10-28 | America-MG | Gremio | 3 | 4 | 7 |
| 2023-10-29 | Internacional | Coritiba | 3 | 4 | 7 |
| 2023-11-01 | Botafogo-RJ | Palmeiras | 3 | 4 | 7 |
| 2023-11-09 | Botafogo-RJ | Gremio | 3 | 4 | 7 |
| 2023-04-29 | Fortaleza | Fluminense | 4 | 2 | 6 |
| 2023-05-07 | Gremio | Bragantino | 3 | 3 | 6 |
| 2023-05-20 | Sao Paulo | Vasco | 4 | 2 | 6 |
| 2023-06-25 | Gremio | Coritiba | 5 | 1 | 6 |
| 2023-07-29 | Athletico-PR | Cruzeiro | 3 | 3 | 6 |
| 2023-09-14 | Coritiba | Bahia | 2 | 4 | 6 |
| 2023-09-16 | Vasco | Fluminense | 4 | 2 | 6 |
| 2023-09-21 | Vasco | Coritiba | 5 | 1 | 6 |
| 2023-10-19 | Fluminense | Corinthians | 3 | 3 | 6 |
| 2023-11-24 | Corinthians | Bahia | 1 | 5 | 6 |
| 2023-11-28 | Vasco | Corinthians | 2 | 4 | 6 |

## 03_resumo

Consulta: [SQL](../sql/03_resumo.sql)

| jogos | gols | media_gols |
| --- | --- | --- |
| 380 | 946 | 2.49 |

## 04_ataques

Consulta: [SQL](../sql/04_ataques.sql)

| clube | jogos | gols_marcados |
| --- | --- | --- |
| Palmeiras | 38 | 64 |
| Gremio | 38 | 63 |
| Botafogo-RJ | 38 | 58 |
| Flamengo | 38 | 56 |
| Atletico-MG | 38 | 52 |

## 05_defesas

Consulta: [SQL](../sql/05_defesas.sql)

| clube | jogos | gols_sofridos |
| --- | --- | --- |
| Atletico-MG | 38 | 32 |
| Cruzeiro | 38 | 32 |
| Palmeiras | 38 | 33 |
| Bragantino | 38 | 35 |
| Botafogo-RJ | 38 | 37 |

## 06_mandantes

Consulta: [SQL](../sql/06_mandantes.sql)

| resultado | jogos | percentual |
| --- | --- | --- |
| Vitoria do mandante | 178 | 46.84 |
| Vitoria do visitante | 104 | 27.37 |
| Empate | 98 | 25.79 |

## 07_rodadas

Consulta: [SQL](../sql/07_rodadas.sql)

| rodada | jogos | gols | media_gols |
| --- | --- | --- | --- |
| 29 | 10 | 40 | 4.0 |
| 3 | 10 | 32 | 3.2 |
| 4 | 10 | 32 | 3.2 |
| 17 | 10 | 32 | 3.2 |
| 23 | 10 | 32 | 3.2 |
| 26 | 10 | 32 | 3.2 |

## 08_pontos

Consulta: [SQL](../sql/08_pontos.sql)

| clube | jogos | vitorias | empates | derrotas | gols_feitos | gols_sofridos | saldo | pontos |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Palmeiras | 38 | 20 | 10 | 8 | 64 | 33 | 31 | 70 |
| Gremio | 38 | 21 | 5 | 12 | 63 | 56 | 7 | 68 |
| Atletico-MG | 38 | 19 | 9 | 10 | 52 | 32 | 20 | 66 |
| Flamengo | 38 | 19 | 9 | 10 | 56 | 42 | 14 | 66 |
| Botafogo-RJ | 38 | 18 | 10 | 10 | 58 | 37 | 21 | 64 |
| Bragantino | 38 | 17 | 11 | 10 | 49 | 35 | 14 | 62 |
| Fluminense | 38 | 16 | 8 | 14 | 51 | 47 | 4 | 56 |
| Athletico-PR | 38 | 14 | 14 | 10 | 51 | 43 | 8 | 56 |
| Internacional | 38 | 15 | 10 | 13 | 46 | 45 | 1 | 55 |
| Fortaleza | 38 | 15 | 9 | 14 | 45 | 44 | 1 | 54 |
| Sao Paulo | 38 | 14 | 11 | 13 | 40 | 38 | 2 | 53 |
| Cuiaba | 38 | 14 | 9 | 15 | 40 | 39 | 1 | 51 |
| Corinthians | 38 | 12 | 14 | 12 | 47 | 48 | -1 | 50 |
| Cruzeiro | 38 | 11 | 14 | 13 | 35 | 32 | 3 | 47 |
| Vasco | 38 | 12 | 9 | 17 | 41 | 51 | -10 | 45 |
| Bahia | 38 | 12 | 8 | 18 | 50 | 53 | -3 | 44 |
| Santos | 38 | 11 | 10 | 17 | 39 | 64 | -25 | 43 |
| Goias | 38 | 9 | 11 | 18 | 36 | 53 | -17 | 38 |
| Coritiba | 38 | 8 | 6 | 24 | 41 | 73 | -32 | 30 |
| America-MG | 38 | 5 | 9 | 24 | 42 | 81 | -39 | 24 |
