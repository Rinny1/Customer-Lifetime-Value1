# Objective:
To examine which are the factors which influene,  Customer Lifetime Value (CLV) of Insurance Premium Company, based on the given attributes of the customer.

# Business Context:
What are the  attributes of customer, who have a higher Customer Lifetime Value.

# Description of Variables:
The dataset contains 9134 observations and 24 variables,Where Customer.Llifetime.Value is the dependent variable.
1.Customer:Customer id 
2.State:Customers from different State
3.Customer.Lifetime.Value:Customers 
4.Response:
5.Coverage:Type of coverage given to customer
6.Education:Type of education of customer
7.Effective.to.date:The date from which policy taken by the customer
8.EmploymentStatus:Employment status of customer
9.Gender:Gender of customer
10.Income:Income of customer
11.Location  Code:Location of customer
12.Marital Status:Marital status of customer
13.Monthly Premium Auto:Monthly Premium given by customers
14.Months  Since  Last Claim:
15.Months Since Policy Inception:
16.Number of Open Complaints:No. of complaints filed by customers
17.Number of Policies:No. of policies taken by customers
18.Policy Type:
19.Policy:
20.Renew.Offer.Type:
21.Sales Channel:
22.Total Claim Amount:Total amount claimed by the customer
23.Vehicle.Class:Vehicle class of customer
24.Vehicle.Size:Vehicle size of customer

I renamed dependent variable Customer.Lifetime.Value as  clv.

# Outliers Traeatment
As there are some outliers in data so i capped them by using quantile method.Also you can see box plot images to check that all
outliers are treated.

# Missing Values
Customer                         State 
                            0                             0 
                          clv                      Response 
                            0                             0 
                     Coverage                     Education 
                            0                             0 
            Effective.To.Date              EmploymentStatus 
                            0                             0 
                       Gender                        Income 
                            0                             0 
                Location.Code                Marital.Status 
                            0                             0 
         Monthly.Premium.Auto       Months.Since.Last.Claim 
                            0                             0 
Months.Since.Policy.Inception     Number.of.Open.Complaints 
                            0                             0 
           Number.of.Policies                   Policy.Type 
                            0                             0 
                       Policy              Renew.Offer.Type 
                            0                             0 
                Sales.Channel            Total.Claim.Amount 
                            0                             0 
                Vehicle.Class                  Vehicle.Size 
                            0                             0 
so there are no missing values in data.

so our data is cleaned and free  of outliers and missing values.

Note:I deleted the redundant variables effective.to.date,Customer and state,so i will not consider these variables in my modelling.

# Exploration of data
clv        Response       Coverage                   Education   
 Min.   : 1898   No :6886   Basic   :5018   Bachelor            :2423  
 1st Qu.: 3679   Yes:1170   Extended:2350   College             :2398  
 Median : 5376              Premium : 688   Doctor              : 308  
 Mean   : 5991                              High School or Below:2291  
 3rd Qu.: 7924                              Master              : 636  
 Max.   :14091                                                         
                                                                       
      EmploymentStatus Gender       Income       Location.Code   Marital.Status
 Disabled     : 363    F:4081   Min.   :    0   Rural   :1566   Divorced:1192  
 Employed     :5004    M:3975   1st Qu.:    0   Suburban:5088   Married :4665  
 Medical Leave: 384             Median :33814   Urban   :1402   Single  :2199  
 Retired      : 251             Mean   :37619                                  
 Unemployed   :2054             3rd Qu.:62329                                  
                                Max.   :99981                                  
                                                                               
 Monthly.Premium.Auto Months.Since.Last.Claim Months.Since.Policy.Inception
 Min.   : 61.00       Min.   : 0.00           Min.   : 0.00                
 1st Qu.: 68.00       1st Qu.: 6.00           1st Qu.:24.00                
 Median : 80.00       Median :14.00           Median :47.00                
 Mean   : 89.73       Mean   :15.02           Mean   :48.04                
 3rd Qu.:106.00       3rd Qu.:23.00           3rd Qu.:71.00                
 Max.   :298.00       Max.   :35.00           Max.   :99.00                
                                                                           
 Number.of.Open.Complaints Number.of.Policies         Policy.Type  
 Min.   :0.0000            Min.   :1.000      Corporate Auto:1740  
 1st Qu.:0.0000            1st Qu.:1.000      Personal Auto :5990  
 Median :0.0000            Median :2.000      Special Auto  : 326  
 Mean   :0.3946            Mean   :3.043                           
 3rd Qu.:0.0000            3rd Qu.:4.000                           
 Max.   :5.0000            Max.   :9.000                           
                                                                   
          Policy     Renew.Offer.Type     Sales.Channel  Total.Claim.Amount
 Personal L3 :3021   Offer1:3271      Agent      :3079   Min.   :   0.099  
 Personal L2 :1871   Offer2:2620      Branch     :2253   1st Qu.: 266.078  
 Personal L1 :1098   Offer3:1250      Call Center:1550   Median : 370.629  
 Corporate L3: 904   Offer4: 915      Web        :1174   Mean   : 417.834  
 Corporate L2: 528                                       3rd Qu.: 535.687  
 Corporate L1: 308                                       Max.   :2893.240  
 (Other)     : 326                                                         
       Vehicle.Class   Vehicle.Size 
 Four-Door Car:4275   Large  : 848  
 Luxury Car   :  75   Medsize:5658  
 Luxury SUV   :  91   Small  :1550  
 Sports Car   : 399                 
 SUV          :1491                 
 Two-Door Car :1725                 
                                    
> By Looking at the summary we can predict about pre model insights
1.Customers who have basic coverage type followed by extended may be more valuable.
2.Customers who have done bachloers which is  2nd followed by who are in colloege and 3rd followed by those who have done
high school or below may be more valuable.
3.Customers whose employment status is unemployed which is 2nd followed by employed and 3rd followed by who are on medical leave may be more valuable.
4.Female customers may be more valuable than male customers.
5.Customers who are from suburban location which is 2nd followed by urabn and 3rd followed by rural may be more valuable.
6.Customers whose marital status is married which is 2nd followed by single and 3rd followed by divorced may be more valuable.
7.Customers whose policy type is personal which is 2nd followed by corporate and 3rd followed by special may be more valuable.
8.Customers who have renewed their offer type may be more valuable.
9.Customers who have taken policy from agent which is 2nd followed by brnch may be more valuable to customer.
10.Customers who have taken vehicle class as four door car which is 2nd followed by two door car which is 3rd followed by SUV may be more valuable.
11.Customers who have their vehice size as medium fwhich is 2nd followed by small and 3rd followed by large may be more valuable.


NEXT STEP IS TO DIVIDE THE DATA INTO TRAIN AND TEST.WE WILL USE 70% OF OUR DATA AS TRAINNING DATA AND 30% AS TEST DATA.
WE WILL FIRST DO MODELLING ON TRAIN DATA AND TEST IT ON TEST DATA.

#WE WILL START OUR MODELLING WITH ALL THE VARIABLES USING TRAIN DATA AND I USED BACK WARD ELIMINATION METHOD TO GET THE VARIABLES WHICH ARE  STATISTICALLY SIGNIFICANT.

After deleting the variables one by one i left with variables:
1.I(Coverage==Premium)
2.I(Coverage=Extended)
3.I(Education=="High School or Below")
4.I(Education=="College")
5.I(EmploymentStatus=="Medical Leave")
6.I(EmploymentStatus=="Unemployed")
7.Monthly.Premium.Auto
8.Number.of.Open.Complaints
9.Number.of.Policies
10.Renew.offer.Typeoffer2
11.Renew.offer.Typeoffer3
12.Renew.offer.Typeoffer4
13.I(Vehicle.Class=="SUV")

# OUTPUT
Residuals:
    Min      1Q  Median      3Q     Max 
-3637.3 -1678.5  -811.4   831.8  9960.2 

Coefficients:
                                           Estimate Std. Error t value Pr(>|t|)    
(Intercept)                                2043.626    136.345  14.989  < 2e-16 ***
CoverageExtended                            293.083     75.623   3.876 0.000108 ***
CoveragePremium                             840.304    132.784   6.328 2.67e-10 ***
I(Education == "College")TRUE               202.578     75.359   2.688 0.007206 ** 
I(Education == "High School or Below")TRUE  183.244     76.632   2.391 0.016824 *  
I(EmploymentStatus == "Medical Leave")TRUE -339.659    151.532  -2.241 0.025033 *  
I(EmploymentStatus == "Unemployed")TRUE    -565.383     73.510  -7.691 1.71e-14 ***
Monthly.Premium.Auto                         33.363      1.405  23.738  < 2e-16 ***
Number.of.Open.Complaints                  -116.923     33.830  -3.456 0.000552 ***
Number.of.Policies                          343.542     12.637  27.185  < 2e-16 ***
Renew.Offer.TypeOffer2                     -567.747     75.527  -7.517 6.48e-14 ***
Renew.Offer.TypeOffer3                     -317.843     94.070  -3.379 0.000733 ***
Renew.Offer.TypeOffer4                     -590.627    107.386  -5.500 3.96e-08 ***
I(Vehicle.Class == "SUV")TRUE               681.191     96.172   7.083 1.58e-12 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2355 on 5625 degrees of freedom
Multiple R-squared:  0.3104,	Adjusted R-squared:  0.3088 
F-statistic: 194.8 on 13 and 5625 DF,  p-value: < 2.2e-16

NOW WE WILL DO MODEL DIAGONSTICS
1.TEST FOR MULTICOLLINEARITY
THERE SHOULD BE NO LINEAR RELATIONSHIP BETWEEN THE INDEPENDENT VARIABLES.MULTICOLLINEARITY IS CHECKED BY VIF(VARIANCE INFLATION FACTOR)
FUNCTION AND VIF>1.7.

vif(FinalModel)
Coverage                               1.464857  2        1.100142
I(Education == "College")              1.203677  1        1.097122
I(Education == "High School or Below") 1.215781  1        1.102625
I(EmploymentStatus == "Medical Leave") 1.023492  1        1.011678
I(EmploymentStatus == "Unemployed")    1.052779  1        1.026050
Monthly.Premium.Auto                   1.849413  1        1.359931
Number.of.Open.Complaints              1.008155  1        1.004069
Number.of.Policies                     1.020722  1        1.010308
Renew.Offer.Type                       1.066207  3        1.010742
I(Vehicle.Class == "SUV")              1.414055  1        1.189140

AS WE CAN SEE ALL THE VARIABLES ARE LESS THAN 1.7.SO THERE IS NO MULTICOLLINEARITY.

2.TEST FOR AUTOCORRELATION
THERE SHOULD NOT BE ANY CORRELATION BETWEEN ERROR TERMS.TO CHECK THIS ASSUMPTION WE USE DURBIN WATSON TEST.ON PERFORMING THE TEST WE GET THE FOLLOWING OUTPUT 

durbinWatsonTest(FinalModel)
lag Autocorrelation D-W Statistic p-value
   1     -0.02102495       2.04184   0.108

DURBIN WATSON TEST
H0:THERE IS NO AUTOCORRELATION BETWEEN ERROR TERMS
H1:THERE IS AUTOCORREATION BETWEEN ERROR TERMS
   
AS WE CAN SEE THAT THAT D-W STATISTIC=2 AND P-VALUE IS ALSO GREATER THAN 0.05.SO THERE IS NO AUTOCORELATION BETWEEN ERROR TERMS.

3.TEST FOR NORMALITY
THE ERROR TERMS SHOULD BE NORMALLY DISTRIBUTED.SO WE TEST THE NORMALITY OF RESIDUALS USING ANDERSON DARLING(A-D) TEST.THE P-VALUE SHOULD BE MORE THAN 0.05.

ANDERSON DARLING TEST
H0:THE ERROR TERMS ARE NORMALLY DISTRIBUTED
H1:THE ERROR TERMS ARE NOT NORMALLY DISTRIBUTED
IF P-VALUE>0.05 WE ACCEPT THE NULL HYPOTHESIS
IF P-VALUE<0.05 WE ACCEPT THE ALTERNATIVE HYPOTHESIS

ad.test(resids) #get Anderson-Darling test for normality 

Anderson-Darling normality test

data:  resids
A = 278.18, p-value < 2.2e-16
AS P-VALUE>0.05 SO THE ERROR TERMS ARE NORMALLY DISTRIBUTED

4.TEST OF HOMOSCEDACITY
THE VARIANCE OF RESIDUAL SHOULD BE CONSTANT AND P-VALUE SHOULD BE MORE THAN 0.05.WE TEST THE HOMOSCEDACITY USING BP TEST 
BP TEST
H0:THE VARIANCE OF RESIDUAL IS CONSTANT
H1:THE VARIANCE OF RESIDUAL IS NOT CONSTANT
IF P-VALUE>0.05 WE ACCEPT THE NULL HYPOTHESIS
IF P-VALUE<0.05 WE ACCEPT THE ALTERNATIVE HYPOTHESIS

studentized Breusch-Pagan test

data:  FinalModel
BP = 332.68, df = 13, p-value < 2.2e-16

AS P-VALUE>0.05 SO THERE IS PRESENCE OF HOMOSCEDACITY AND WE ACCEPT OUR NULL HYPOTHESIS.

