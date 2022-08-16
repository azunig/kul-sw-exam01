library(diagram)
#git remote -v
names <- c("PHYTO", "NH3", "ZOO", "DETRITUS", "BotDET", "FISH")
M <- matrix(nrow = 6, ncol = 6, byrow = TRUE, data = c(
  + # p n z d b f
  + 0, 1, 0, 1, 0, 0, 
  + 0, 0, 4, 10, 11, 0, 
  + 2, 0, 0, 0, 0, 0, 
  + 8, 0, 13, 0, 0, 10, 
  + 9, 0, 0, 7, 0, 0, 
  + 0, 0, 5, 0, 0, 0 ))


N <- matrix(nrow = 6, ncol = 6, byrow = TRUE, data = c(
  + # p n z d b f
    + 3, 0, 3, 0, 0, 0 ))


pp <- plotmat(N, pos = c(1, 2, 1, 2), 
              curve = 0, 
              name = names,
              lwd = 1, 
              box.lwd = 2, 
              cex.txt = 0.8,
              box.type = "square", 
              box.prop = 0.5, 
              arr.type = "triangle",
              arr.col = "red",
              arr.pos = 0.4, 
              shadow.size = 0.01, 
              prefix = "f",
              main = "NPZZDD model")
