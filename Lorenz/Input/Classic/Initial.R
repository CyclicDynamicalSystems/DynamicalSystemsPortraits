start.count <- 1
start <- matrix(
  c(0.01, 0, 0), 
  byrow = T, ncol = var.count,
  dimnames = list(paste0("t", 1:start.count), var.names))
times <- seq(0, 100, by = 0.01)