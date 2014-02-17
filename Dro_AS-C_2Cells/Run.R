source("../Tools/Common.R")
source("Model.R")
run.dir <- "./Runs/001/"
save.to.file <- T
source(paste0(run.dir, "Params.R"))
source(paste0(run.dir, "Initial.R"))

comp <- calc.composition(seq(0, 2, by=0.005),
  composition, composition.expand, var.names)
data <- ode.multi(start, times, derivs)
show.plot2d(data, c("time", "x1"))
show.plot2d(data, c("time", "y1"))
show.plot2d(data, c("time", "z1"))
show.plot2d(data, c("time", "x2"))
show.plot2d(data, c("time", "y2"))
show.plot2d(data, c("time", "z2"))
show.scatterplot3d(data, c("x1", "y1", "z1"))
show.scatterplot3d(data, c("z2", "y2", "x2"))

save.data(start, comp$p)