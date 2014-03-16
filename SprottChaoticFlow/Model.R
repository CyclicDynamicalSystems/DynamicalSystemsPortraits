kx <- kx.x <- kx.y <- kx.z <- kx.xx <- kx.yy <- kx.zz <- kx.xy <- kx.xz <- kx.yz <- 0
ky <- ky.x <- ky.y <- ky.z <- ky.xx <- ky.yy <- ky.zz <- ky.xy <- ky.xz <- ky.yz <- 0
kz <- kz.x <- kz.y <- kz.z <- kz.xx <- kz.yy <- kz.zz <- kz.xy <- kz.xz <- kz.yz <- 0
derivs <- function(t, state, parameters) {
  with(as.list(c(state)), {
    dx <- kx + kx.x * x + kx.y * y + kx.z * z + kx.xx * x^2 + kx.yy * y^2 + kx.zz * z^2 + 
          kx.xy * x * y + kx.xz * x * z + kx.yz * y * z
    dy <- ky + ky.x * x + ky.y * y + ky.z * z + ky.xx * x^2 + ky.yy * y^2 + ky.zz * z^2 + 
          ky.xy * x * y + ky.xz * x * z + ky.yz * y * z
    dz <- kz + kz.x * x + kz.y * y + kz.z * z + kz.xx * x^2 + kz.yy * y^2 + kz.zz * z^2 + 
          kz.xy * x * y + kz.xz * x * z + kz.yz * y * z
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

# Common Initial
start.count <- 1
start <- matrix(
  c(0.1, 0.1, 0.1), 
  byrow = T, ncol = var.count,
  dimnames = list(paste0("t", 1:start.count), var.names))
times <- seq(0, 200, by = 0.01)