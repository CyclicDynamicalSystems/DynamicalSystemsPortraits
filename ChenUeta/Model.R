derivs <- function(t, state, parameters) {
  with(as.list(c(state)), {
    dx <- sigma * (y - x)
    dy <- (R - sigma) * x + R * y - x * z
    dz <- -b * z + x * y
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