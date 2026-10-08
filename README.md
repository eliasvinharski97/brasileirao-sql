# Análise do Brasileirão 2023 com SQL

Projeto de estudo para praticar SQL usando resultados reais de futebol. A pergunta principal é: como os clubes se saíram no ataque, na defesa e na pontuação, e como os resultados se distribuíram entre mandantes e visitantes?

## Escopo

- 380 partidas e 20 clubes da temporada de 2023.
- SQLite como banco de dados.
- Oito consultas com SELECT, JOIN, WHERE, GROUP BY, HAVING e agregações.
- Python somente como apoio para carregar os CSVs, executar SQL e exportar resultados. As análises estão nos arquivos SQL.

## Resultados encontrados

| Indicador | Resultado |
| --- | --- |
| Total de gols | 946 |
| Média de gols por partida | 2,49 |
| Ataque com mais gols | Palmeiras, 64 |
| Menos gols sofridos | Atletico-MG e Cruzeiro, 32 cada |
| Vitórias dos mandantes | 178 de 380 jogos, 46,84% |
| Vitórias dos visitantes | 104 de 380 jogos, 27,37% |
| Empates | 98 de 380 jogos, 25,79% |

Os mandantes venceram com maior frequência que os visitantes neste recorte. Isso descreve uma associação; a análise não controla força dos times, escalações ou outros fatores para demonstrar uma causa.

[Consultar todas as tabelas de resultados](resultados/RESULTADOS.md).

## Organização

| Arquivo ou pasta | Conteúdo |
| --- | --- |
| `dados/` | CSVs tratados e registro da origem |
| `sql/00_estrutura.sql` | Tabelas, restrições e visão de desempenho |
| `sql/01_...` a `sql/08_...` | Perguntas e consultas comentadas |
| `brasileirao.db` | Banco pronto para abrir |
| `executar.py` | Reconstrói o banco e os resultados |
| `preparar_dados.py` | Reproduz o tratamento a partir do CSV original |
| `resultados/` | Resultados em CSV e Markdown |

## Como executar

Requisito: Python 3. Não é necessário instalar bibliotecas adicionais.

1. Baixe ou clone este projeto e extraia a pasta se estiver em ZIP.
2. Abra o terminal dentro da pasta que contém `executar.py`.
3. Execute:

```bash
python executar.py
```

No Windows, se o comando `python` não funcionar, tente `py executar.py`. Em ambientes com `python3`, use `python3 executar.py`.

O comando recria `brasileirao.db` e atualiza os arquivos de `resultados/`. Alterações manuais nesses arquivos gerados serão substituídas. Para mudar uma análise, edite o arquivo SQL e execute novamente.

Também é possível abrir `brasileirao.db` em um cliente compatível com SQLite e executar as consultas individualmente. O banco entregue já contém os dados; não execute `00_estrutura.sql` novamente sobre ele.

## Modelo dos dados

`clubes.id` identifica cada clube. `partidas.mandante_id` e `partidas.visitante_id` se relacionam com essa chave. Cada linha de `partidas` representa um jogo.

A visão `desempenho` apresenta cada partida sob a perspectiva dos dois clubes. Portanto, contém 760 linhas. Para contar partidas do campeonato, use `partidas`; contar a visão duplicaria o total.

| Campo | Significado |
| --- | --- |
| `partidas.id` | Identificador preservado da fonte |
| `rodada` | Rodada de 1 a 38 |
| `data` | Data em formato AAAA-MM-DD |
| `mandante_id`, `visitante_id` | Referências à tabela de clubes |
| `gols_mandante`, `gols_visitante` | Placar final |
| `desempenho.local` | Perspectiva do clube: casa ou fora |
| `desempenho.gols_feitos`, `gols_sofridos` | Placar pela perspectiva do clube |

## Fonte e tratamento

Fonte: [Brasileirao_Dataset, de Adão Duque](https://github.com/adaoduque/Brasileirao_Dataset), arquivo `campeonato-brasileiro-full.csv`, consultado em 08/10/2026. Os dados são de terceiros; este projeto não reivindica autoria da coleta original.

Foi selecionado o ano de 2023, mantidos os campos necessários, convertidas as datas e separados os clubes em tabela própria. A grafia dos nomes foi preservada. O registro da coleta e o hash SHA-256 do CSV original estão em `dados/origem.json`.

Para reproduzir o tratamento, baixe o arquivo original indicado nesse registro e execute:

```bash
python preparar_dados.py caminho/do/campeonato-brasileiro-full.csv
python executar.py
```

O script verifica o hash para evitar substituir silenciosamente o recorte por uma versão diferente da fonte.

## Validação e limites

Foram verificados: 380 partidas, 20 clubes, 38 jogos por clube, 10 partidas por rodada, integridade das chaves estrangeiras e igualdade entre gols feitos e sofridos. IDs repetidos, placares negativos e confrontos duplicados com o mesmo mando são rejeitados pelo banco.

Essas checagens avaliam consistência, mas não substituem a conferência de cada placar em uma fonte oficial. A base é comunitária. O projeto não contém dados de público, custos, jogadores ou receitas, e não permite conclusões sobre eficiência financeira ou artilheiros.

A pontuação da consulta 08 deriva dos placares e não implementa punições nem todos os critérios oficiais de desempate. As listas de cinco clubes usam ordem alfabética em caso de empate no indicador e podem cortar empates na quinta posição.
