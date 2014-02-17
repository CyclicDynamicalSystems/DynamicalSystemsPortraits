# -*- coding: utf-8 -*-
import os
f = open('README.md', 'w')
f.write('# Parameters #\n')
with open('Params.R') as fp:
	for line in fp:
		f.write('\t' + line.replace("<-", "="))
f.write('\n\n')
f.write('# Initial data #\n')
with open('start.md') as fp:
	for line in fp:
		f.write(line)
f.write('\n\n')
f.write('# Equilibrium points #\n')
with open('equilibriums.md') as fp:
	for line in fp:
		f.write(line)
f.write('\n\n')
f.write('# Modelling results #\n')
for file in os.listdir("./"):
    if file.endswith(".png"):
        f.write('**' + file + '**:\n\n')
        f.write('![' + file + '](' + file + ')\n\n')
f.close()