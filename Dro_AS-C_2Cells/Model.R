f <- function(x) A/(a+x^2)
s <- function(x) B*x^2/(b+x^2)
g <- function(x) C*x/(c+x)

derivs <- function(t, state, parameters) {
  with(as.list(c(state)), {
    dx1 <- f(z1) - x1    
    dy1 <- s(x1) - y1
    dz1 <- g(y2) - z1
    dx2 <- f(z2) - x2
    dy2 <- s(x2) - y2
    dz2 <- g(y1) - z2
    list(c(dx1, dy1, dz1, dx2, dy2, dz2))
  })
}

var.count <- 6
var.names <- c("x1", "y1", "z1", "x2", "y2", "z2")

composition <- function(x) f(g(s(f(g(s(x))))))
composition.expand <- function(x1) {  
  y1 <- s(x1)
  z2 <- g(y1)
  x2 <- f(z2)
  y2 <- s(x2)
  z1 <- g(y2)  
  c(x1, y1, z1, x2, y2, z2)
}