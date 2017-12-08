#polling data

PollingData <- read.csv("PollingData.csv")
summary(PollingData)
str(PollingData)
ab <- table(PollingData$State,PollingData$Year)
t1 <- subset(PollingData,ab != '0')

#filling the missing values


simple <- PollingData[,c(3,4,5,6)]

summary(simple)
set.seed(144)
#check the NA's by using md.pattern
md.pattern(simple)
#create impute df
imp_mice <- mice(simple, seed = 144)
#imputed<-complete(mice(simple,seed=144))
#imputed_new <- complete(mice(imp_mice, seed = 144)) 
imputed_new <- complete(imp_mice,1)
summary(imputed_new)

PollingData$Rasmussen <- imputed_new$Rasmussen
PollingData$SurveyUSA <- imputed_new$SurveyUSA


#splitting the data into train and test data
train_data <- subset(PollingData, Year == "2004" | Year == "2008")
test_data <- subset(PollingData, Year == "2012")

table(train_data$Republican)
53/100
sign(-20)
sign(100)
sign(0)

table(sign(train_data$Rasmussen))
table(Actual=train_data$Rasmussen,Predicted = sign(train_data$Rasmussen))
cor(PollingData)
