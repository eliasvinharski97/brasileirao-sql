"""Uso: python preparar_dados.py caminho/do/campeonato-brasileiro-full.csv"""
from pathlib import Path
from datetime import datetime
import csv
import hashlib
import io
import json
import sys

pasta = Path(__file__).resolve().parent / 'dados'
if len(sys.argv) != 2:
    raise SystemExit(__doc__)
original = Path(sys.argv[1]).read_bytes()
registro = json.loads((pasta / 'origem.json').read_text(encoding='utf-8'))
if hashlib.sha256(original).hexdigest() != registro['sha256_csv_original']:
    raise SystemExit('O CSV difere da versão registrada. Use os CSVs tratados incluídos ou revise a origem antes de atualizar.')
linhas = [r for r in csv.DictReader(io.StringIO(original.decode('utf-8-sig')))
          if datetime.strptime(r['data'], '%d/%m/%Y').year == 2023]
clubes = sorted({r[k] for r in linhas for k in ['mandante', 'visitante']})
ids = {nome: i + 1 for i, nome in enumerate(clubes)}
with (pasta / 'clubes.csv').open('w', newline='', encoding='utf-8') as f:
    w = csv.writer(f)
    w.writerow(['id', 'nome'])
    w.writerows((ids[nome], nome) for nome in clubes)
with (pasta / 'partidas_2023.csv').open('w', newline='', encoding='utf-8') as f:
    w = csv.writer(f)
    w.writerow(['id', 'rodada', 'data', 'mandante_id', 'visitante_id', 'gols_mandante', 'gols_visitante'])
    for r in linhas:
        w.writerow([int(r['ID']), int(r['rodata']), datetime.strptime(r['data'], '%d/%m/%Y').date().isoformat(),
                    ids[r['mandante']], ids[r['visitante']], int(r['mandante_Placar']), int(r['visitante_Placar'])])
print(f'Preparados {len(linhas)} jogos e {len(clubes)} clubes.')
