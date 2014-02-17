# -*- coding: utf-8 -*-
import os
import os.path
def clear(dir):
	files = os.listdir(dir)
	for file in os.listdir(dir):
	    if not file.endswith(".R"):
			os.remove(dir + "\\" + file)
subdirs = os.walk("..\\")
runs = [x[0] for x in subdirs]
for run in runs:
	if (os.path.isfile(run + "\\Initial.R")):
		clear(run)