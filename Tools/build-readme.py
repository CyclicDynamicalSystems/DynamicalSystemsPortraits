# -*- coding: utf-8 -*-
import os
import os.path
def build(dir):
	f = open(dir + 'README.md', 'w')
	f.write('# Parameters #\n')
	with open(dir + 'Params.R') as fp:
		for line in fp:
			f.write('\t' + line.replace("<-", "="))
	f.write('\n\n')
	f.write('# Initial data #\n')
	with open(dir + 'start.md') as fp:
		for line in fp:
			f.write(line)
	f.write('\n\n')
	f.write('# Equilibrium points #\n')
	with open(dir + 'equilibriums.md') as fp:
		for line in fp:
			f.write(line)
	f.write('\n\n')
	f.write('# Modeling results #\n')
	for file in os.listdir(dir):
	    if file.endswith(".png"):
	        f.write('**' + file + '**:\n\n')
	        f.write('![' + file + '](' + file + ')\n\n')
	f.close()

subdirs = os.walk("..\\")
runs = [x[0] for x in subdirs]
for run in runs:
	if (os.path.isfile(run + "\\Initial.R")):
		build(run + "\\")