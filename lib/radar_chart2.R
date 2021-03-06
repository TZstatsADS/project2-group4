library("fmsb")


#Random numbers for test
var1 <- runif(50, 0, 1)
var2 <- runif(50, 0, 1)
var3 <- runif(50, 0, 1)
var4 <- runif(50, 0, 1)
var5 <- runif(50, 0, 1)
var6 <- runif(50, 0, 1)

zipcode <- seq(10001, 10050)
dataset <- data.frame(zipcode, var1, var2, var3, var4, var5, var6)


#The function for radar chart
radar_chart <- function(dataset){
  
  name <- names(dataset)
  n <- length(name)
  zip <- subset(dataset, select = name[1])
  VarToPlot <- name[order(dataset[1,2:n], decreasing = T)[1:5]+1]
  variables <- subset(dataset, select = VarToPlot)
  
   maxmin <- data.frame(
    v1 = c(max(variables[,1], na.rm = T), min(variables[,1], na.rm = T)),
    v2 = c(max(variables[,2], na.rm = T), min(variables[,2], na.rm = T)),
    v3 = c(max(variables[,3], na.rm = T), min(variables[,3], na.rm = T)),
    v4 = c(max(variables[,4], na.rm = T), min(variables[,4], na.rm = T)),
    v5 = c(max(variables[,5], na.rm = T), min(variables[,5], na.rm = T)))
  
  top3 <- c(1,2,3)
  dat <- data.frame(
    v1 = variables[top3, 1],
    v2 = variables[top3, 2],
    v3 = variables[top3, 3],
    v4 = variables[top3, 4],
    v5 = variables[top3, 5])
  dat <- rbind(maxmin,dat)
  colnames(dat) <- VarToPlot
  
  radarchart(dat, axistype = 0, pcol = c(2,3,4), plty = 1, plwd = 4)
  legend(-2.5, -0.3, legend = as.character(zip[1:3,]), lty = 1, lwd = 4, col = c(2,3,4), cex = 0.6)
  
}


#Test the function
radar_chart(dataset)
