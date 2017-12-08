#wine testing using linear regression model, predict the price of the wine

#read the data
wine <- read.csv("wine.csv")
wine_test <- read.csv("wine_test.csv")
summary(wine)
str(wine)
#checking the correlation between the variables except year
cor(wine[,-1])

#creating a model
reg_model <- lm(Price ~ WinterRain + AGST + HarvestRain + Age + FrancePop, data = wine)
summary(reg_model)
#check VIF, read library car
vif(reg_model)
#dropping FrancePop as 98.252 vif value
reg_model1 <- lm(Price ~ WinterRain + AGST + HarvestRain + Age , data = wine)
summary(reg_model1)
sum(reg_model1$residuals^2)
plot(reg_model1$coefficients)
vif(reg_model1)


#checking prediction on test
predict_wine <- predict(reg_model1, newdata = wine_test)
predict_win1 <- predict(reg_model, newdata = wine_test)
#calculating out of sample r square(r square on test data on model1)
SSE <- sum((wine_test$Price - predict_wine)^2)
SST <- sum((wine_test$Price - mean(wine$Price))^2)
1- SSE/SST
#calculating out of sample r square on model2
SSE2 <- sum((wine_test$Price - predict_win1)^2)
1 - SSE2/SST
