library("Cairo")
library("deSolve")
library("plotrix")
library("calibrate")
library("rgl")
library("rootSolve")
library("scatterplot3d")
library("knitr")

ode.multi <- function(start, times, derivs) {
  out <- list()
  for (i in 1:nrow(start)) {
    outi <- lsoda(start[i,], times, derivs, 0)
    out <- c(out, list(outi))
  }
  out
}

save.to.file <- F
run.dir <- "./"

save.table <- function(t, filename) {
  write.csv(t, paste0(run.dir, filename, ".csv"))
  write(capture.output(kable(t, format = "markdown", row.names = T)), paste0(run.dir, filename, ".md"))  
}

save.data <- function(start, statpoints) {
  save.table(start, "start")
  save.table(statpoints, "stat-points")  
}

lplot <- function(x, y, col="black", xlab="", ylab="", lwd=2) {
  par(mar=c(3,4,2,2), cex.axis=2, cex.lab=2, mgp = c(3,2,0), las=1, lwd=1)
  xat <- pretty(x)
  yat <- pretty(y)
  plot(range(xat), range(yat), type="n", xlab="", ylab="", axes="F")
  lines(x, y, col=col, lwd=lwd)  
  axis(1, las=1, pos=0, at=xat)
  axis(2, las=1, pos=0, at=yat)
  mtext(xlab, side=1, cex=2, adj=1.05, padj=-1)
  mtext(ylab, side=2, cex=2, line=-1.2, padj=-11.5, las=1)
}

show.props <- function(data, proj) {
  xlim <- ifelse(length(proj) >= 1, max(unlist(lapply(data, FUN=function(l)max(l[,proj[1]])))), 0)
  ylim <- ifelse(length(proj) >= 2, max(unlist(lapply(data, FUN=function(l)max(l[,proj[2]])))), 0)
  zlim <- ifelse(length(proj) >= 3, max(unlist(lapply(data, FUN=function(l)max(l[,proj[3]])))), 0)
  cols <- rainbow(length(data))
  list(xlim = xlim, ylim = ylim, zlim = zlim, cols = cols)
}

show.rgl3d <- function(data, proj) {
  p <- show.props(data, proj)
  plot3d(c(0,p$xlim), c(0,p$ylim), c(0,p$zlim),
         xlab=proj[1], ylab=proj[2], zlab=proj[3], 
         type="n", axes=T)  
  for (i in 1:length(data))
    lines3d(data[[i]][,proj[1]], data[[i]][,proj[2]], data[[i]][,proj[3]], col=p$cols[i])
}

show.plot2d <- function(data, proj) {
  if (save.to.file)
    CairoPNG(paste0(run.dir, "plot-", proj[1], "-", proj[2], ".png"))
  p <- show.props(data, proj)
  plot(c(0,p$xlim), c(0,p$ylim),
       xlab=proj[1], ylab=proj[2],
       type="n")
  for (i in 1:length(data))
    lines(data[[i]][,proj[1]], data[[i]][,proj[2]], col=p$cols[i])
  if (save.to.file)
    dev.off()
}

show.scatterplot3d <- function(data, proj) {
  if (save.to.file)
    CairoPNG(paste0(run.dir, "plot-", proj[1], "-", proj[2], "-", proj[3], ".png"))
  p <- show.props(data, proj)
  s3d <- scatterplot3d(c(0,p$xlim), c(0,p$ylim), c(0,p$zlim),
                xlab=proj[1], ylab=proj[2], zlab=proj[3], 
                type="n")
  for (i in 1:length(data))
    s3d$points3d(data[[i]][,proj[1]], data[[i]][,proj[2]], data[[i]][,proj[3]], 
                col=p$cols[i], type="l", lwd=2)
  if (save.to.file)
    dev.off()  
}

calc.composition <- function(x, composition, composition.expand, var.names) {
  y <- composition(x)
  if (save.to.file)
    CairoPNG(paste0(run.dir, "composition.png"))
  lplot(x, y)
  xxlim <- max(c(x, y))
  lines(c(0, xxlim), c(0, xxlim), col="red")
  px <- uniroot.all(function(x) composition(x)-x, range(x))
  points(px, px, col="green", pch=19, cex=1.2)
  p <- t(sapply(px, composition.expand))
  colnames(p) <- var.names
  rownames(p) <- paste0("s", 1:nrow(p))
  if (save.to.file)
    dev.off()
  list(x = x, y = y, px = px, p = p)
}