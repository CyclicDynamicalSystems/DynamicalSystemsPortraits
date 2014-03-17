derivs <- function(t, state, parameters) {
  with(as.list(c(state)), {
    dx <- y
    dy <- -x + y * z
    dz <- a - y^2
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