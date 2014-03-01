# -*- coding: utf-8 -*-
import os
import os.path
import shutil

def build_readme(script_dir, run_dir):
	f = open(os.path.join(run_dir, 'README.md'), 'w')
	f.write('# Parameters #\n')
	with open(os.path.join(script_dir, 'Params.R')) as fp:
		for line in fp:
			f.write('\t' + line.replace("<-", "="))
	f.write('\n\n')
	f.write('# Initial data #\n')
	with open(os.path.join(run_dir, 'start.md')) as fp:
		for line in fp:
			f.write(line)
	f.write('\n\n')
	f.write('# Equilibrium points #\n')
	with open(os.path.join(run_dir, 'equilibriums.md')) as fp:
		for line in fp:
			f.write(line)
	f.write('\n\n')
	f.write('# Modeling results #\n')
	for file in os.listdir(run_dir):
	    if file.endswith(".png"):
	        f.write('**' + file + '**:\n\n')
	        f.write('![' + file + '](' + file + ')\n\n')
	f.close()

models = [line.strip() for line in open('Models.txt')]
for model in models:
	print model
	runs_dir = os.path.join(model, "Runs")	
	if (os.path.isdir(runs_dir)):
		shutil.rmtree(runs_dir)
	subdirs = os.walk(os.path.join(model, "Input"))
	runs = [x[1] for x in subdirs][0]
	for run in runs:		
		print model + " " + run
		os.system("RScript.exe RunSingle.R " + model + " " + run)		
		build_readme(os.path.join(model, "Input", run), os.path.join(runs_dir, run))