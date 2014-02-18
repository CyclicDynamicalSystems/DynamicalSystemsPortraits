rm(list = ls())
source("../Tools/Common.R")
source("Model.R")
load.input("./Runs/001/")

calc.default()

show.plot2d(res, c("time", "x"))
show.plot2d(res, c("time", "y"))
show.plot2d(res, c("time", "z"))
show.plot2d(res, c("time", "u"))
show.plot2d(res, c("time", "w"))
show.plot2d(res, c("time", "p"))
show.scatterplot3d(res, c("x", "y", "z"))
show.scatterplot3d(res, c("x", "u", "w"))
show.scatterplot3d(res, c("u", "w", "p"))

save.default()