source("Common.R")
source("Model.R")
draw <- function(name, fc) {
  CairoPNG(name)
  y <- fc(x)
  p <- uniroot.all(function(x) fc(x)-x, range(x))
  lplot(x, y, col="red")
  lines(range(x), range(x), col="green", lwd=2)
  points(p, p, col="blue", pch=19)  
  textxy(p, p, 1:length(p), cex=1.5, col="blue", m=c(0,max(max(x), max(y))))
  dev.off()
}
fc <- function(x) f(g(s(f(g(s(x))))))
draw("StatPoint.png", fc)

px1 <- uniroot.all(function(x) fc(x)-x, range(x))
py1 <- s(px1)
pz2 <- g(py1)
px2 <- f(pz2)
py2 <- s(px2)
pz1 <- g(py2)

lin <- function(x1, y1, z1, x2, y2, z2) {
  l <- matrix(rep(0, 6^2), ncol=6) 
  l[1,1] <- -1
  l[2,2] <- -1
  l[3,3] <- -1
  l[4,4] <- -1
  l[5,5] <- -1
  l[6,6] <- -1
  l[1,3] <- gradient(f, z1)
  l[2,1] <- gradient(s, x1)
  l[3,5] <- gradient(g, y2)
  l[4,6] <- gradient(f, z2)
  l[5,4] <- gradient(s, x2)
  l[6,2] <- gradient(g, y1)
  P <- l[1,3] * l[2,1] * l[3,5] * l[4,6] * l[5,4] * l[6,2]
  e <- eigen(l)  
  cat(sprintf("Point (x1, y1, z1, x2, y2, z2) = (%.3f, %.3f, %.3f, %.3f, %.3f, %.3f)\n",
                 x1, y1, z1, x2, y2, z2))  
  cat("Linearization:\n")
  print(l)
  cat(sprintf("П = %.3f\n", P))
  cat("Eigenvalues:\n")
  for (i in 1:6)    
    cat(sprintf("  e%s = %.3f %s %.3fi\n", 
                  i, 
                  Re(e$values[i]), 
                  ifelse(Im(e$values[i]) > 0, "+", "-"),
                  abs(Im(e$values[i]))))
  cat("\n\n")  
}

for (i in 1:3)
  lin(px1[i], py1[i], pz1[i], px2[i], py2[i], pz2[i])