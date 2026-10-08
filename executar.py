"""Cria um banco novo e executa as consultas SQL, sem pacotes externos."""
from pathlib import Path
import csv
import sqlite3

PASTA = Path(__file__).resolve().parent

def main():
    # Monta em memória primeiro. Se houver erro, preserva o banco anterior.
    banco = sqlite3.connect(':memory:')
    banco.executescript((PASTA / 'sql/00_estrutura.sql').read_text(encoding='utf-8'))
    for tabela, arquivo in [('clubes', 'clubes.csv'), ('partidas', 'partidas_2023.csv')]:
        with (PASTA / 'dados' / arquivo).open(encoding='utf-8', newline='') as f:
            leitor = csv.reader(f)
            colunas = next(leitor)
            valores = ','.join('?' for _ in colunas)
            banco.executemany(f'INSERT INTO {tabela} VALUES ({valores})', leitor)
    # Checagens específicas desta temporada completa.
    assert banco.execute('SELECT COUNT(*) FROM partidas').fetchone()[0] == 380
    assert banco.execute('SELECT COUNT(*) FROM clubes').fetchone()[0] == 20
    assert banco.execute('PRAGMA foreign_key_check').fetchall() == []
    assert banco.execute('SELECT clube_id FROM desempenho GROUP BY clube_id HAVING COUNT(*) <> 38').fetchall() == []
    assert banco.execute('SELECT rodada FROM partidas GROUP BY rodada HAVING COUNT(*) <> 10').fetchall() == []
    assert banco.execute('SELECT SUM(gols_feitos) = SUM(gols_sofridos) FROM desempenho').fetchone()[0] == 1
    banco.commit()
    with sqlite3.connect(PASTA / 'brasileirao.db') as destino:
        banco.backup(destino)
    saida = PASTA / 'resultados'
    saida.mkdir(exist_ok=True)
    texto = ['# Resultados das consultas', '', 'Gerados diretamente pelo SQLite. Fonte e recorte: `dados/origem.json`.', '']
    for arquivo in sorted((PASTA / 'sql').glob('*.sql')):
        if arquivo.name.startswith('00_'):
            continue
        cursor = banco.execute(arquivo.read_text(encoding='utf-8'))
        colunas = [c[0] for c in cursor.description]
        linhas = cursor.fetchall()
        with (saida / (arquivo.stem + '.csv')).open('w', newline='', encoding='utf-8') as f:
            escritor = csv.writer(f)
            escritor.writerow(colunas)
            escritor.writerows(linhas)
        texto += [f'## {arquivo.stem}', '', f'Consulta: [SQL](../sql/{arquivo.name})', '', '| ' + ' | '.join(colunas) + ' |', '| ' + ' | '.join('---' for _ in colunas) + ' |']
        texto += ['| ' + ' | '.join(map(str, linha)) + ' |' for linha in linhas]
        texto.append('')
        print(f'{arquivo.name}: {len(linhas)} linhas')
    (saida / 'RESULTADOS.md').write_text('\n'.join(texto), encoding='utf-8')
    banco.close()
    print('Banco, consultas e resultados prontos. Checagens de integridade passaram.')

if __name__ == '__main__':
    main()
