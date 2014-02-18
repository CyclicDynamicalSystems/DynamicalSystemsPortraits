sigma <- function(v, d) d * v^4 / (1 + v^4)
S <- function(Dx, A, B, k) B * exp(k * (Dx - A)) / (1 + exp(k * (Dx - A)))
sigma1 <- function(v) sigma(v, d1)
sigma3 <- function(v) sigma(v, d3)
sigma5 <- function(v) sigma(v, d5)

F1 <- function(x, y, z, w) (sigma1(D*x) + sigma3(z) + sigma5(w))/(1+G*y)/(1+E*x)
F2 <- function(u)  C / (1 + u)
S3 <- function(Dx) S(Dx, A3, B3, k3)
S4 <- function(Dx) S(Dx, A4, B4, k4)
S5 <- function(Dx) S(Dx, A5, B5, k5)

derivs <- function(t, state, parameters) {
  with(as.list(c(state)), {
    dx <- F1(x, y, z, w) - x
    dy <- F2(u)          - y
    dz <- S3(D * x)      - z
    du <- S4(D * x)      - u
    dw <- S5(D * x)      - w
    list(c(dx, dy, dz, du, dw))
  })
}

var.count <- 5
var.names <- c("x", "y", "z", "u", "w")

composition <- function(x) F1(x, F2(S4(D*x)), S3(D*x), S5(D*x))
composition.expand <- function(x)
  c(x, F2(S4(D*x)), S3(D*x), S4(D*x), S5(D*x))