start.count <- 4
start <- matrix(
  c(0.26,0.37,0.57,0.90,0.20,
    0.40,0.17,0.68,0.38,0.76,
    0.89,0.94,0.66,0.62,0.06,
    1.20,0.21,0.65,0.12,0.26), 
  byrow = T, ncol = var.count,
  dimnames = list(paste0("t", 1:start.count), var.names))
traj.cols <- c("red", "darkgreen", "blue", "maroon")
times <- seq(0, 100, by = 0.1)
composition.x <- seq(0, 3, by=0.01)