set.seed(1)
start.count <- 3
start <- matrix(
  c(1,2,3.5,4,5,117.2,
    1,2,3.0,4,5,117.116282472,
    1,2,2.5,4,5,117.1), 
  byrow = T, ncol = var.count,
  dimnames = list(paste0("t", 1:start.count), var.names))
times <- seq(0, 100, by = 0.01)
composition.x <- seq(0, 2, by=0.005)