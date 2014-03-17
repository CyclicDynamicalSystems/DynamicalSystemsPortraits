derivs <- function(t, state, parameters) {
  with(as.list(c(state)), {
    dx <- sin(y) - b * x
    dy <- sin(z) - b * y
    dz <- sin(x) - b * z
    list(c(dx, dy, dz))
  })
}

var.count <- 3
var.names <- c("x", "y", "z")

run <- function() {
  res <- ode.multi(start, times, derivs)

  show.plot2d(res, c("x", "y"))
  show.plot2d(res, c("y", "z"))
  show.plot2d(res, c("x", "z"))
  show.scatterplot3d(res, c("x", "y", "z"), lwd=1)

  save.table(start, "start")
}