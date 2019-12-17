rm(list = ls())
library(anytime)
setwd("E:\\Dropbox\\financeResearch\\WRDS")

SP500NameAll<- read.csv("crspSP500Codes.csv")
SP500NameAll$start = anydate(SP500NameAll$start)
SP500NameAll$end = anydate(SP500NameAll$end)

SP500Name2018 = subset(SP500NameAll,(SP500NameAll$start < anydate("2018-01-01")) & (SP500NameAll$end > anydate("2018-01-01")))

monthlyReturn = read.csv("monthlyReturn2008-2018.csv")
monthlyReturn$date<- anydate(monthlyReturn$date)

# use apple return to determine common dates
SP500return <- data.frame(monthlyReturn[monthlyReturn$permno == 14593,"date"])
names(SP500return)[1] <- "date"
FFfactors <- read.csv("FamaFrenchMonthlyData.csv")
FFfactors$dateff<- anydate(FFfactors$dateff)
names(FFfactors)[1] <- "date"
# now get the market and risk-free return rate
SP500return <-  merge(SP500return, FFfactors, by= "date")

for (i in SP500Name2018$permno){
  print(i)
  returnTemp = data.frame(monthlyReturn[monthlyReturn$permno == i,"ret"])
  names(returnTemp)[1] <- as.character(i)
  
  if (nrow(returnTemp) == nrow(SP500return)) {
    SP500return <- cbind(SP500return,returnTemp )
  } else {
    print(nrow(returnTemp))
    
  }
}




betaSet = vector()
alphaSet = vector()
rsquaredSet = vector()
for (i in 7:ncol(SP500return)){
  print(i)
  y = SP500return[,i] - SP500return$rf
  fit <- lm(y ~ SP500return$mktrf)
  alphaSet <- c(alphaSet,fit$coefficients[1])
  betaSet <- c(betaSet,fit$coefficients[2])
  rsquaredSet <- c(rsquaredSet, summary(fit)$r.squared)
}

png("alphaBetaHistSP500StocsCAPM2008_2018.png", width = 800, height = 400)
par(mfrow = c(2,2))
hist(alphaSet*100,20,xlab = "alpha(%)")
hist(betaSet,20,xlab = "beta")
hist(rsquaredSet,20,xlab = "r-squared(%)")

dev.off()
