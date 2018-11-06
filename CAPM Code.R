#Import Data
capm <- read.csv("Topix Core30 Return (without Hitachi).csv",header=T,check.names = F,sep=",")

#CAPM Formula
  # E(Ri) = Rf + β x (E(Rm) - Rf)
  # Rf of 10Y JGB is 0.13% in Nov. 5 according to Bloomberg

Rf <- 0.0013
TopixRm <- 0.045 # 20 Years average
expected_Rm <- mean(TopixRm)
market_premium <- expected_Rm - Rf

#Count col (how many companies in the dataset)
L <- ncol(capm)
I <- L-2 # a total of 29 (excluding one with major data error)

#Creating Beta (5Y monthly 2013~2018) 
Betas <- rep(0,I)
Rm <- capm[,2] - capm[,1]

for (i in 1:I) {
  Ri <- capm[,2+i] - capm[,1]
  regression <- lm(Ri~Rm)
  mySummary <- summary(regression)
  mycoef <- coef(mySummary)
  Betas[i] <- mycoef[2,1]
}

#Plugging in numbers to get Expected Return of company
CAPM_Expected_Returns <- rep(0,I)

for(i in 1:I){
  CAPM_Expected_Returns[i] <- Rf+Betas[i]*market_premium
}

#Creating Standard Dev (5Y monthly 2013~2018) 
variance <- rep(0,I)  
standard_dev <- rep(0,I)

for (i in 1:I){
  variance[i] <- var(capm[,2+i])
  standard_dev[i] <- sqrt(variance[i])
}

#Creating Data Frame
companies <- colnames(capm)
companies2 <- companies[3:L]

data <- data.frame(companies2,CAPM_Expected_Returns,Betas, standard_dev)

#Identify High Beta / High Standard Dev companies
myOrder1 <- order(Betas, decreasing=T)
myOrder2 <- order(standard_dev, decreasing=T)

companiesBetas <- data[myOrder1, ]
companiesstand_dev <- data[myOrder2, ]

#Visualizing (load ggplot2)
library(ggplot2)
library(ggrepel)

#CAPM
ggplot(data, aes(x=standard_dev,y=CAPM_Expected_Returns,label=companies2))+
  geom_point(colour="white",fill="chartreuse3",shape=21,alpha=0.9,size=4)+
  labs(title="Expected Return of Topix Core 29 Stocks",
       subtitle="Excluding Hitachi due to data error",
       caption="Source: Yahoo Finance",
       x="Standard Dev",
       y="Expected Return")+
  geom_text_repel(aes(label=companies2), box.padding=unit(0.05,"lines"))+
  theme_classic()

#SML
ggplot(data, aes(x=Betas,y=CAPM_Expected_Returns,label=companies2))+
  geom_point(colour="white",fill="chartreuse3",shape=21,alpha=0.9,size=4)+
  labs(title="Expected Return of Topix Core 29 Stocks",
       subtitle="Security Market Line",
       caption="Source: Yahoo Finance",
       x="Beta",
       y="Expected Return")+
  geom_text_repel(aes(label=companies2), box.padding=unit(0.05,"lines"))+
  theme_classic()

