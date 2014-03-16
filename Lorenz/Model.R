derivs <- function(t, state, parameters) {
  with(as.list(c(state)), {
    dx <- sigma * (y - x)
    dy <- x * (rho - z) - y
    dz <- x * y - beta * z
    list(c(dx, dy, dz))
  })
}

var.count <- 3
var.names <- c("x", "y", "z")

run <- function() {
  res <- ode.multi(start, times, derivs)

  show.scatterplot3d(res, c("x", "y", "z"), lwd=1)

  save.table(start, "start")
}