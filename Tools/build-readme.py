# -*- coding: utf-8 -*-
import os
f = open('README.md', 'w')
f.write('# Параметры #\n')
with open('Params.R') as fp:
	for line in fp:
		f.write('\t' + line.replace("<-", "="))
f.write('\n\n')
f.write('# Начальные данные #\n')
with open('start.md') as fp:
	for line in fp:
		f.write(line)
f.write('\n\n')
f.write('# Результаты моделирования #\n')
for file in os.listdir("./"):
    if file.endswith(".png"):
        f.write('**' + file + '**:\n\n')
        f.write('![' + file + '](' + file + ')\n\n')
f.close()