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

#WE WILL START OUR MODELLING WITH ALL THE VARIABLES AND THEN WE USED BY BACK WARD ELIMINATION TO GET THE VARIABLES WHICH ARE  SIGNIFICANT P-VALUES.

