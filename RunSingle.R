rm(list = ls())
source("Tools/Common.R")

args <- commandArgs(trailingOnly = TRUE)

model.dir <- ifelse(length(args) >= 1, args[1], "Dro-ASC-5d")
run.number <- ifelse(length(args) >= 2, args[2], "001")

input.dir <- file.path(model.dir, "Input", run.number)
runs.dir <- file.path(model.dir, "Runs")
run.dir <- file.path(runs.dir, run.number)

dir.create(runs.dir, showWarnings = FALSE)
dir.create(run.dir, showWarnings = FALSE)

model.file <- file.path(model.dir, "Model.R")
params.file <- file.path(input.dir, "Params.R") 
initial.file <- file.path(input.dir, "Initial.R") 

source(model.file)
source(params.file)
source(initial.file)  

run()