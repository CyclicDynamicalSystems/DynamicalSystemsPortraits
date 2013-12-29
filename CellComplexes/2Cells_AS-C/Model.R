A <- 5
a <- 3
B <- 10
b <- 2
C <- 9
c <- 3
f <- function(x) A/(a+x^2)
s <- function(x) B*x^2/(b+x^2)
g <- function(x) C*x/(c+x)
x <- seq(0, 2, by = 0.005)