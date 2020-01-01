# Title     : TODO
# Objective : TODO
# Created by: wataru
# Created on: 2019/12/31

titanic_original <- read.csv("train.csv", stringsAsFactors=F, na.strings=(c("NA", "")))
apply(is.na(titanic_original), 2, sum)

titanic_omit_vari <- titanic_original[, c(2,3,5:8,10,12)]
names(titanic_omit_vari)

titanic_na_omit <- na.omit(titanic_omit_vari)

titanic_na_omit[,3] <- ifelse(titanic_na_omit[,3]=="female",0,1)

titanic_na_omit[,8] <- ifelse(titanic_na_omit[,8]=="C",0,ifelse(titanic_na_omit[,8]=="Q",1,2))

cor(titanic_na_omit)

attach(titanic_na_omit)

glm_result <- glm(Survived~., family="binomial", data=titanic_na_omit)

summary(glm_result)