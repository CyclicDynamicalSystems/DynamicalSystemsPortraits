source("Common.R")
source("Model.R")
chaos <- function(t, state, parameters) {
  with(as.list(c(state)), {
    dx1 <- f(z1) - x1    
    dy1 <- s(x1) - y1
    dz1 <- g(y2) - z1
    dx2 <- f(z2) - x2
    dy2 <- s(x2) - y2
    dz2 <- g(y1) - z2
    list(c(dx1, dy1, dz1, dx2, dy2, dz2))
  })
}
show <- function(xlim, ylim, zlim, start) {
  proj <- c("x1", "y1", "z1")
  lab <- proj
  lab <- c("", "", "")
  plot3d(c(0,xlim), c(0,ylim), c(0,zlim),
         xlab=lab[1], ylab=lab[2], zlab=lab[3], 
         type="n", axes=F)  
  
  fc <- function(x) f(g(s(f(g(s(x))))))
  px <- uniroot.all(function(x) fc(x)-x, range(x))
  py <- s(px)
  pz <- g(s(f(g(py))))
  points3d(px, py, pz, size=8)  
    
  cnt <- length(start) / 6
  cols <- rainbow(cnt)
  for (i in 0:(cnt-1)) {
    state <- c(x1 = start[6*i+1], y1 = start[6*i+2], z1 = start[6*i+3], 
               x2 = start[6*i+4], y2 = start[6*i+5], z2 = start[6*i+6])
    times <- seq(0, 100, 0.01)
    out <- lsoda(state, times, chaos, 0)
    lines3d(out[,proj[1]], out[,proj[2]], out[,proj[3]], col=cols[i+1])
  }  
}
cnt <- 100
size <- 3
start <- runif(6 * cnt) * size
start <- c(
1, 2, 3, 4, 5, 117.116282472,
1, 2, 2.5, 4, 5, 117.1,
1, 2, 3.5, 4, 5, 117.2
)
show(size * 2, size * 2, size * 2, start)