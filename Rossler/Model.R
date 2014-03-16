derivs <- function(t, state, parameters) {
  with(as.list(c(state)), {
    dx <- -y - z
    dy <- x + a * y
    dz <- b + z * (x - c)
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