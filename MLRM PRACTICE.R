
#-----------------------------------Environment for MRLM(9)--------------------------------#
install.packages("boot")
library(boot) 

install.packages("car")
library(car)

install.packages("QuantPsyc")
library(QuantPsyc)

install.packages("lmtest")
library(lmtest)

install.packages("sandwich")
library(sandwich)

install.packages("vars")
library(vars)

install.packages("nortest")
library(nortest)

install.packages("MASS")
library(MASS)

install.packages("caTools")
library(caTools)

#-----------------------------------Setting working Directory---------------------------#
path<-setwd("C:/Users/raveesh/Desktop/IVY/R/Multiple Regression/Fn-UseC_-Marketing-Customer-Value-Analysis.csv")
getwd()

data=read.csv("Fn-UseC_-Marketing-Customer-Value-Analysis.csv")
data1=data

#-----------------------------------Exploring Data---------------------------------------#
str(data1)
dim(data1)
summary(data1)
head(data1)
tail(data1)
#--------------------------------Renaming the dependent vaRiable--------------------------#
colnames(data1)[which(names(data)=="Customer.Lifetime.Value")]="clv"
data

quantile(data1$clv,c(0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,0.99,0.995,1))

data2=data1[data1$clv <36000,]#creating a new data frame with a cap on outliers
boxplot(data2$clv,horizontal = T)
nrow(data1)

nrow(data2)

nrow(data1)-nrow(data2)

quantile(data2$clv,c(0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,0.99,0.995,1))



data3=data2[data2$clv <14722, ]

nrow(data3)

quantile(data3$clv,c(0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,0.99,0.995,1))
boxplot(data3$clv,horizontal = T)



nrow(data1)-nrow(data3)
str(data3)

data4=data3[data3$clv <14109, ]

nrow(data4)

quantile(data4$clv,c(0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,0.99,0.995,1))
boxplot(data4$clv,horizontal = T)

#-------------->Droping the rendundant variables from the data frame
as.data.frame(colnames(data4))
data5=select(data4,-c(Customer,State,Effective.To.Date))

str(data5)#final dataset for modelling


#Exporting the treated data into csv file

write.csv(data5,"MLdata.csv")



#--------------------------Splitting the data into training and test data set------------------------#

set.seed(11234)#This is used to produce reproducible results, everytime we run the model

spl = sample.split(data5$clv, 0.7)#Splits the overall data into train and test data in 70:30 ratio

original.data = subset(data5, spl == TRUE)
str(original.data)
dim(original.data)

test.data = subset(data5, spl == FALSE)
str(test.data)
dim(test.data)


#------------------------------------------Fitting the model---------------------------------------#
#Iteration.1 We start with testing all variables

LinearModel0=lm(clv~.,data=original.data)#'.', refers to all variables
summary(LinearModel0)

#Remove Response
LinearModel2=lm(clv~	Coverage+	Education+	EmploymentStatus+	 Monthly.Premium.Auto+	Months.Since.Last.Claim+		Number.of.Open.Complaints+	Number.of.Policies +	Renew.Offer.Type+	Vehicle.Class, data=original.data)
summary(LinearModel2)

#Remove Months.Since.Last.Claim
LinearModel3=lm(clv~	Coverage+	Education+	EmploymentStatus+	 Monthly.Premium.Auto+Number.of.Open.Complaints+	Number.of.Policies +	Renew.Offer.Type+	I(Vehicle.Class=="SUV")+ I(Vehicle.Size == "Small"), data=original.data)
summary(LinearModel3)


#Remove Education==Doctor
LinearModel5=lm(clv~	Coverage+	I(Education=="College")+I(Education =="High School or Below")+	EmploymentStatus+	 Monthly.Premium.Auto+	Months.Since.Last.Claim+		Number.of.Open.Complaints+	Number.of.Policies +	Renew.Offer.Type+	I(Vehicle.Class=="SUV")+I(Vehicle.Size=="Small"), data=original.data)
summary(LinearModel5)

#Remove VEHICLE SIZE
LinearModel6=lm(clv~	Coverage+	I(Education=="College")+I(Education =="High School or Below")+	EmploymentStatus+	 Monthly.Premium.Auto+	Months.Since.Last.Claim+		Number.of.Open.Complaints+	Number.of.Policies +	Renew.Offer.Type+	I(Vehicle.Class=="SUV"), data=original.data)
summary(LinearModel6)

#REmove month.since.last.claim
LinearModel7=lm(clv~	Coverage+	I(Education=="College")+I(Education =="High School or Below")+	EmploymentStatus+	 Monthly.Premium.Auto+			Number.of.Open.Complaints+	Number.of.Policies +	Renew.Offer.Type+	I(Vehicle.Class=="SUV"), data=original.data)
summary(LinearModel7)

#Remove Employment status==unemployed
LinearModel8=lm(clv~	Coverage+	I(Education=="College")+I(Education =="High School or Below")+	I(EmploymentStatus=="Medical Leave")+I(EmploymentStatus=="Retired")+I(EmploymentStatus=="Unemployed")+	 Monthly.Premium.Auto+			Number.of.Open.Complaints+	Number.of.Policies +	Renew.Offer.Type+	I(Vehicle.Class=="SUV"), data=original.data)
summary(LinearModel8)

#Remove Employment status==retired
LinearModel9=lm(clv~	Coverage+	I(Education=="College")+I(Education =="High School or Below")+	I(EmploymentStatus=="Medical Leave")+I(EmploymentStatus=="Unemployed")+	 Monthly.Premium.Auto+			Number.of.Open.Complaints+	Number.of.Policies +	Renew.Offer.Type+	I(Vehicle.Class=="SUV"), data=original.data)
summary(LinearModel9)

##---------------------------------------------------Final Model

FinalModel=lm(clv~	Coverage+	I(Education=="College")+I(Education =="High School or Below")+	I(EmploymentStatus=="Medical Leave")+I(EmploymentStatus=="Unemployed")+	 Monthly.Premium.Auto+			Number.of.Open.Complaints+	Number.of.Policies +	Renew.Offer.Type+	I(Vehicle.Class=="SUV"), data=original.data)
summary(FinalModel)



vif(FinalModel)


## Get the predicted or fitted values
fitted(FinalModel)

par(mfrow=c(2,2))
plot(FinalModel)



## MAPE
original.data$pred <- fitted(FinalModel)
write.csv(original.data,"mape.csv")


#Calculating MAPE
attach(original.data)
(sum((abs(clv-pred))/clv))/nrow(original.data)

############ Residual Analysis ############################################################################

res <- original.data

res$stu_res <- studres(FinalModel) ##Studentized residuals
res$stud.del.resids <- rstudent(FinalModel) ##studentized deleted residuals
res$leverage <- hatvalues(FinalModel) ## leverage values (hi)
res$cooks_dis <- cooks.distance(FinalModel) ## Cook's distance
res$dffits <- dffits(FinalModel) ## Dffit
res$dfbetas <- dfbetas(FinalModel) ## Dfbetas
res$cov_ratio <- covratio(FinalModel) ## Covariance Ratio

write.csv(res,"res.csv")

##################################### Checking of Assumption ############################################

# residuals should be uncorrelated ##Autocorrelation
# Null H0: residuals from a linear regression are uncorrelated. Value should be close to 2. 
#Less than 1 and greater than 3 -> concern
## Should get a high p value

durbinWatsonTest(FinalModel)
dwt(FinalModel)
#Since, the p-value is >0.05, we fail to reject H0: (No Autocorrelation)

# Checking multicollinearity
vif(FinalModel) # should be within 2. If it is greater than 10 then serious problem

################ Constant error variance ##########Heteroscedasticity


# Breusch-Pagan test
bptest(FinalModel)  # Null hypothesis -> error is homogenious (p value should be more than 0.05)


#Cook-Weisberg test
# hypothesis of constant error variance against the alternative that the error variance changes with the level of the  response 
# p value should be more than 0.05
ncvTest(lm(clv~	Coverage+	I(Education=="College")+I(Education =="High School or Below")+	I(EmploymentStatus=="Medical Leave")+I(EmploymentStatus=="Unemployed")+	 Monthly.Premium.Auto+			Number.of.Open.Complaints+	Number.of.Policies +	Renew.Offer.Type+	I(Vehicle.Class=="SUV"), data=original.data))


## Normality testing Null hypothesis is data is normal.

resids <- FinalModel$residuals


ad.test(resids) #get Anderson-Darling test for normality 
cvm.test(resids) #get Cramer-von Mises test for normaility 
lillie.test(resids) #get Lilliefors (Kolmogorov-Smirnov) test for normality 
pearson.test(resids) #get Pearson chi-square test for normaility 
sf.test(resids) #get Shapiro-Francia test for normaility 

qqnorm(resids)


###########################################################################################################################
############## Testing the model on test data ############################################################################
###########################################################################################################################


##Final model 
fit1<- lm(clv~	Coverage+	I(Education=="College")+I(Education =="High School or Below")+	I(EmploymentStatus=="Medical Leave")+I(EmploymentStatus=="Unemployed")+	 Monthly.Premium.Auto+			Number.of.Open.Complaints+	Number.of.Policies +	Renew.Offer.Type+	I(Vehicle.Class=="SUV"), data=test.data)
summary(fit1)

#remove monthly.premium.auto
fit2<-lm(clv~	Coverage+	I(Education=="College")+I(Education =="High School or Below")+	I(EmploymentStatus=="Medical Leave")+I(EmploymentStatus=="Unemployed")+	 Monthly.Premium.Auto+	Number.of.Policies +	Renew.Offer.Type+	I(Vehicle.Class=="SUV"), data=test.data)
summary(fit2)

#Remove coverage==extended
fit3<-lm(clv~	I(Coverage=="Premium")+	I(Education=="College")+I(Education =="High School or Below")+	I(EmploymentStatus=="Medical Leave")+I(EmploymentStatus=="Unemployed")+	 Monthly.Premium.Auto+	Number.of.Policies +	Renew.Offer.Type+	I(Vehicle.Class=="SUV"), data=test.data)
summary(fit3)

#Remove education ==college and high school and employment status==medical leave
fit4<-lm(clv~	I(Coverage=="Premium")+I(EmploymentStatus=="Unemployed")+	 Monthly.Premium.Auto+	Number.of.Policies +	Renew.Offer.Type+	I(Vehicle.Class=="SUV"), data=test.data)
summary(fit4)

##Final Model
fit5<-lm(clv~ 	I(Coverage=="Premium")  +  I(EmploymentStatus=="Unemployed")
          +Monthly.Premium.Auto  +	Number.of.Policies +	Renew.Offer.Type 
          +	I(Vehicle.Class=="SUV")  , data=test.data)
summary(fit5)

#Check Vif, vif>2 means presence of multicollinearity
vif(fit5)


## Get the predicted or fitted values
fitted(fit5)

## MAPE
test_data$pred <- fitted(fit5)
#write.csv(original.data,"mape.csv")

#Calculating MAPE
attach(test.data)
(sum((abs(clv-pred))/clv))/nrow(test.data)



############ Residual Analysis ############################################################################

res1 <- test.data

res1$stu_res <- studres(fit5) ##Studentized residuals
res1$stud.del.resids <- rstudent(fit5) ##studentized deleted residuals
res1$leverage <- hatvalues(fit5) ## leverage values (hi)
res1$cooks_dis <- cooks.distance(fit5) ## Cook's distance
res1$dffits <- dffits(fit5) ## Dffit
res1$dfbetas <- dfbetas(fit5) ## Dfbetas
res1$cov_ratio <- covratio(fit5) ## Covariance Ratio

#write.csv(res1,"res1.csv")

##################################### Checking of Assumption ############################################

# residuals should be uncorrelated ##Autocorrelation
# Null H0: residuals from a linear regression are uncorrelated. Value should be close to 2. 
#Less than 1 and greater than 3 -> concern
## Should get a high p value

durbinWatsonTest(fit5)
dwt(fit5)

# Checking multicollinearity
vif(fit5) # should be within 2. If it is greater than 10 then serious problem

################ Constant error variance ##########Heteroscedasticity


# Breusch-Pagan test
bptest(fit5)  # Null hypothesis -> error is homogenious (p value should be more than 0.05)


#Cook-Weisberg test
# hypothesis of constant error variance against the alternative that the error variance changes with the level of the  response 
# p value should be more than 0.05
ncvTest(lm(clv~ 	I(Coverage=="Premium")  +  I(EmploymentStatus=="Unemployed")
           +Monthly.Premium.Auto  +	Number.of.Policies +	Renew.Offer.Type 
           +	I(Vehicle.Class=="SUV")  , data=test.data))


## Normality testing Null hypothesis is data is normal.

resids1 <- fit5$residuals


ad.test(resids1) #get Anderson-Darling test for normality 
cvm.test(resids1) #get Cramer-von Mises test for normaility 
lillie.test(resids1) #get Lilliefors (Kolmogorov-Smirnov) test for normality 
pearson.test(resids1) #get Pearson chi-square test for normaility 
sf.test(resids1) #get Shapiro-Francia test for normaility 

qqnorm(resids1)





