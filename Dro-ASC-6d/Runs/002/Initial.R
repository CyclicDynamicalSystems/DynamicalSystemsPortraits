set.seed(1)
start.count <- 6
start <- matrix(
  c(0.10,0.37,0.57,0.90,0.20,0.89,
    0.28,0.50,0.50,0.06,0.20,0.17,
    0.30,0.90,1.50,0.49,0.71,0.99,
    0.50,0.77,0.93,0.21,0.65,0.12,
    0.80,0.38,0.01,3.00,0.86,0.34,
    0.90,0.69,0.47,3.50,0.43,0.24), 
  byrow = T, ncol = var.count,
  dimnames = list(paste0("t", 1:start.count), var.names))
traj.cols <- c("red", "darkgreen", "blue", "maroon", "orange", "brown")
times <- seq(0, 100, by = 0.1)
composition.x <- seq(0, 2, by=0.005)
composition.labeloffset.x <- c(-0.05, -0.07, -0.05, -0.08, 0)
composition.labeloffset.y <- c(0, 0, -0.005, -0.01, 0.03)