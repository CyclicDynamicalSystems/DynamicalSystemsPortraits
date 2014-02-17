set.seed(1)
start.count <- 10
start <- matrix(
  runif(var.count * start.count), 
  byrow = T, ncol = var.count,
  dimnames = list(paste0("t", 1:start.count), var.names))
times <- seq(0, 100, by = 0.1)
composition.x <- seq(0, 2, by=0.01)