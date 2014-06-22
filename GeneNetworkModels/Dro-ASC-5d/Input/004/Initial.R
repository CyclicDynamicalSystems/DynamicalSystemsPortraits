start.count <- 6
start <- matrix(
 c(0.10, 4.00, 1.50, 1.32, 0.10,
   0.40, 6.00, 2.50, 0.49, 0.20,
   0.70, 2.50, 3.50, 3.00, 0.40,
   1.00, 3.00, 4.00, 3.50, 1.50,
   1.30, 0.20, 4.50, 4.00, 2.00,
   1.60, 1.00, 6.00, 5.00, 3.00),
  byrow = T, ncol = var.count,
  dimnames = list(paste0("t", 1:start.count), var.names))

traj.cols <- c("red", "darkgreen", "blue", "maroon", "orange", "brown")
times <- seq(0, 100, by = 0.1)
composition.x <- seq(0, 3, by=0.01)