#Raw Data (x, y)
x <- c(0.5, 1.0, 1.5, 2.0, 2.5)
y <- c(0.7, 3.4, 7.2, 12.4, 20.1)

#Plot the Transformed Data (lnx, lny)
plot(log(x), log(y), pch = 16, col = "black")
title("Transformed Data")

#Create Model of form lny = lna + mlnx
linModel <- lsfit(log(x), log(y))
coefList <- coef(linModel)
loga <- coefList[1]
a <- exp(loga)
m <- coefList[2]
n <- m
abline(linModel)

#Plot New Model of form y = ax^n
plot(x,y, pch = 16)
title("Model Fit & Data")
curve(a*x^n, add = TRUE)