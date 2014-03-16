derivs <- function(t, state, parameters) {
  with(as.list(c(state)), {
    dy1 <- (I2 - I3) / I1 * y2 * y3
    dy2 <- (I3 - I1) / I2 * y1 * y3
    dy3 <- (I1 - I2) / I3 * y1 * y2
    list(c(dy1, dy2, dy3))
  })
}

var.count <- 3
var.names <- c("y1", "y2", "y3")

run <- function() {
  res <- ode.multi(start, times, derivs)

  show.plot2d(res, c("time", "y1"))
  show.plot2d(res, c("time", "y2"))
  show.plot2d(res, c("time", "y3"))
  show.scatterplot3d(res, c("y1", "y2", "y3"))

  save.table(start, "start")
}