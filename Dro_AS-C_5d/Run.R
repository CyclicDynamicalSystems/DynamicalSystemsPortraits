source("Common.R")
source("Model.R")
show <- function(xlim, ylim, zlim, start) {
  proj <- c("x", "y", "z")
  lab <- proj
  lab <- c("x", "y", "z")
  plot3d(c(0,xlim), c(0,ylim), c(0,zlim),
         xlab=lab[1], ylab=lab[2], zlab=lab[3], 
         type="n", axes=T)  
  
  cnt <- length(start) / 5
  cols <- rainbow(cnt)
  for (i in 0:(cnt-1)) {
    state <- c(x = start[5*i+1], y = start[5*i+2], z = start[5*i+3], 
               u = start[5*i+4], w = start[5*i+5])
    times <- seq(0, 100, 0.01)
    out <- lsoda(state, times, derivs, 0)
    lines3d(out[,proj[1]], out[,proj[2]], out[,proj[3]], col=cols[i+1])
  }  
}
cnt <- 10
size <- 3
start <- runif(5*cnt) * size
show(size * 2, size * 2, size * 2, start)