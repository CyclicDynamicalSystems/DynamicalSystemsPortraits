composition.x <- seq(0, 3, by=0.01)

R2 <- function(x) composition(x) / (1 + x * U)

run <- function() {
  save.to.file <<- F
  CairoPNG(file.path(run.dir, "composition.png"))
  comp <<- calc.composition(composition.x, composition, composition.expand, var.names)
  lines(composition.x, R2(composition.x), col="blue", lwd=2)
  dev.off()
}