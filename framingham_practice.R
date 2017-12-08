#framingham

framingham <- read.csv("framingham.csv")
summary(framingham)
str(framingham)
framingham$male <- as.factor(framingham$male)

#split the dataset
split <- sample.split(framingham$TenYearCHD, SplitRatio = 0.65)
train <- subset(framingham,split == T)
test <- subset(framingham, split == F)
table(train$TenYearCHD)
2337/4240

#building a model on train data with all the variables

model_reg <- glm(TenYearCHD~.,data = framingham, family = binomial)
summary(model_reg)

#making predictions on test

predictTest <- predict(model_reg, newdata = test, type = 'response')
table(test$TenYearCHD,predictTest>0.5)
1080+17
1097/1484

#checking AUC
ROCRpred <- prediction(predictTest,test$TenYearCHD)

ROCRperf <- as.numeric(performance(ROCRpred,"auc")@y.values)



