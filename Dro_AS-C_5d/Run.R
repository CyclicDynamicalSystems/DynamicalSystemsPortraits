source("../Tools/Common.R")
source("Model.R")
run.dir <- "./Runs/001/"
save.to.file <- T
source(paste0(run.dir, "Params.R"))
source(paste0(run.dir, "Initial.R"))

data <- ode.multi(start, times, derivs)
show.plot2d(data, c("time", "x"))
show.plot2d(data, c("time", "y"))
show.plot2d(data, c("time", "z"))
show.plot2d(data, c("time", "u"))
show.plot2d(data, c("time", "w"))
show.plot2d(data, c("time", "w"))
show.scatterplot3d(data, c("x", "y", "z"))
show.scatterplot3d(data, c("x", "u", "w"))
show.rgl3d(data, c("x", "y", "z"))
show.rgl3d(data, c("x", "u", "w"))

save.data(start)