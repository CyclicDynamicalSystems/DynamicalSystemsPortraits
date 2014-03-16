derivs <- function(t, state, parameters) {
  with(as.list(c(state)), {
    dx <- y * (z - 1 + x^2) + gamma * x
    dy <- x * (3 * z + 1 - x^2) + gamma * y
    dz <- -2 * z * (alpha + x * y)
    list(c(dx, dy, dz))
  })
}

var.count <- 3
var.names <- c("x", "y", "z")

run <- function() {
  res <- ode.multi(start, times, derivs)

  show.plot2d(res, c("x", "y"))
  show.plot2d(res, c("x", "z"))
  show.plot2d(res, c("y", "z"))
  show.scatterplot3d(res, c("x", "y", "z"), lwd=1)

  save.table(start, "start")
}