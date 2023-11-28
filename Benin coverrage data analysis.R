#### Data analysis Benin coverage 1996 - 2018 ###---- 


###Uploading the packages

#Packages----
library(readxl)
library(questionr)
library(tidyverse)
library(gtsummary)
library(labelled)
library(GGally)
library(dplyr)

# Import data
library(readxl)
data <- read_excel("C:/Users/LAPTOP/Desktop/Coverage Benin/BeninVac/data.xlsx", na = "NA")
View(data)


#var_label(data$OPV3)<-"OPV3"
#var_label(data$BCG)<-"BCG"
#var_label(data$DPT1)<-"DPT1"
#var_label(data$DPT2)<-"DPT2"
#var_label(data$DPT3)<-"DPT3"
#var_label(data$MMR)<-"MMR"



#Analysis of age (Mother)
#shapiro.test(data$Age) #results showed 
summary(data$Age, na.rm=TRUE)


#Analysis of age (child)
#shapiro.test(data$Cage) #results showed 
summary(data$Cage, na.rm=TRUE)


###################################################################
# Reordering variables #######
#############################

#reorder age group mother
data$Agroup <- data$Agroup %>%
  fct_relevel("15-19", "20-24", "25-29", "30-34", "35-39", "40-44", "45-49")

#reorder age group mother
data$Agroupreg <- data$Agroupreg %>%
  fct_relevel("25-34","15-24","35-49")


#reorder department
data$Dept <- data$Dept %>%fct_relevel("ALIBORI", "ATACORA","ATLANTIQUE","BORGOU","COLLINES","COUFFO","DONGA","LITTORAL","MONO","OUEME","PLATEAU","ZOU")


#reorder residence``
data$Residence <- data$Residence %>%  fct_relevel("Rural", "Urban")


#reorder marital status
data$Marital <- data$Marital %>%fct_relevel("Unmarried","Cohabiting",  "Married", "Divorced", "Widowed")


#reorder education mother
data$Education <- data$Education %>%fct_relevel("No education", "Primary", "Secondary", "Higher")


#reorder religion
data$Religion <- data$Religion %>%fct_relevel("Christianism", "Traditionalist (Vodoun)", "Islam", "Other religions", "No religion")


#reorder ethnicity
data$Ethnicity <- data$Ethnicity %>% fct_relevel("Adja", "Bariba", "Betamaribe", "Dendi", "Fon", "Peulh", "Yoa-Lokpa", "Yoruba", "Other ethnies", "Foreigner")

 
#reorder work
data$Work <- data$Work %>%  fct_relevel( "Not Working", "Work")


#reorder education father
data$Heducation <- data$Heducation %>% fct_relevel("No education", "Primary", "Secondary", "Higher")


#reorder Birth order
data$Border <- data$Border %>% fct_relevel("Two-Three","1", "Four-Five", "6+")

#reorder ANC
data$ANC <- data$ANC %>% fct_relevel("1_3",  "No" ,  "4_6", "More than 6")

#reorder Place of delivery
data$Pdelivery <- data$Pdelivery %>% fct_relevel("Home", "Health care setting")




###################################################################################
#Labelling of the variables----
var_label(data$Age)<-"Mother's age (Years)"
var_label(data$Dept)<-"Department"
var_label(data$Agroup)<-"Mother's age group"
var_label(data$Agroupreg)<-"Mother's age group"
var_label(data$Education)<-"Education level"
var_label(data$Marital)<-"Marital status"
var_label(data$Cage)<-"Child age (Months)"
var_label(data$Cgender)<-"Child's gender"
var_label(data$Heducation)<-"Father's education level"
var_label(data$Coverage)<-"Vaccination coverage"
var_label(data$ANC)<-"ANC visits"
var_label(data$Pdelivery)<-"Place of delivery"
var_label(data$Border)<-"Birth Order"





######################################################################

#Table 1: Socio-demographic characteristics by coverage status

add_overall(tbl_summary(data,include=c("Agroup","Marital","Religion","Dept","Residence","Education","Ethnicity","Work","Heducation","Cgender","ANC","Border","Pdelivery","Year"), by="Coverage", percent="row", digits = everything() ~ 2))

#tbl_summary(data, include=c("Year","Work"), by="Novaccine", percent="column")


######################################################################

#Figure 1: Trends in vaccination completeness

# C2017-18 = 1898 (55%)       # aucun2017-18 = 436 (13%) 

# C2011-12 = 1792 (37%)       # aucun2011-12 = 550 (11%) 

# C2006 = 2299 (41%)          # aucun2006 = 406 (7.3%) 

# C2001 = 1011 (52%)          # aucun2001 = 143 (7.4%) 

# C1996 = 704 (47%)          # aucun1996 = 233 (16%) 




### Import dataset to plot figure

library(readxl)
Fig2data <- read_excel("C:/Users/LAPTOP/Desktop/Coverage Benin/BeninVac/Fig2data.xlsx")
View(Fig2data)


#Libraries
library(ggthemes)



#Plot
p<-ggplot(Fig2data, aes(x=Year, y=Percentage, group=Vaccination))+geom_line(aes(colour=Vaccination), size=1)+geom_point(aes(color=Vaccination), size=5)

p <-p +  scale_color_manual(values=c("#00BFC4", "#F8766D")) 

p <- p + geom_text(aes(y=Percentage, label=Percentage), vjust=-0.7, colour="Black", size=5)
p <- p + geom_text(aes(y=Percentage, label=Percentage), vjust=-0.7, colour="Black", size=5)
p <- p + geom_text(aes(y=Percentage, label=Percentage), vjust=-0.7, colour="Black", size=5)
p <- p + geom_text(aes(y=Percentage, label=Percentage), vjust=-0.7, colour="Black", size=5)
#Show figure
p





 ########################################################################################
#Table 2: Univariate logistic regression

###Variable from character to factor----
data$Agroupreg <- as.factor(data$Agroupreg)
data$Dept <- as.factor(data$Dept)
data$Residence <- as.factor(data$Residence)
data$Education <- as.factor(data$Education)
data$Ethnicity <- as.factor(data$Ethnicity)
data$Marital <- as.factor(data$Marital)
data$Work <- as.factor(data$Work)
data$Heducation <- as.factor(data$Heducation)
data$Border <- as.factor(data$Border)
data$Cgender <- as.factor(data$Cgender)
data$ANC <- as.factor(data$ANC)
data$Pdelivery <- as.factor(data$Pdelivery)
data$Religion <- as.factor(data$Religion)



### Creating dummy variables : Change COMPLETE to 1 and INCOMPLETE to 0----
#data <- data %>% mutate(Coverage_Complete_dummy = ifelse(Coverage == "COMPLETE", 1, 0), Coverage_Incomplete_dummy = ifelse(Coverage == "INCOMPLETE", 1, 0))

data$Coverage <- ifelse(data$Coverage=="COMPLETE",1,0)
#data$Coverage <- as.factor(data$Coverage)



###Univariate glm----

#### uni models----
modUniAgroupreg <- glm(Coverage~Agroupreg,family = binomial(),data = data)

modUniDept <- glm(Coverage~Dept,family = binomial(),data = data)

modUniResidence <- glm(Coverage~Residence,family = binomial(),data = data)

modUniEducation <- glm(Coverage~Education,family = binomial(),data = data)

modUniMarital <- glm(Coverage~Marital,family = binomial(),data = data)

modUniWork <- glm(Coverage~Work,family = binomial(),data = data)

modUniHeducation <- glm(Coverage~Heducation,family = binomial(),data = data)

modUniBorder <- glm(Coverage~Border,family = binomial(),data = data)

modUniCgender <- glm(Coverage~Cgender,family = binomial(),data = data)

modUniANC <- glm(Coverage~ANC,family = binomial(),data = data)

modUniPdelivery <- glm(Coverage~Pdelivery,family = binomial(),data = data)




####Uni model tables----
t1<-modUniAgroupreg%>% tbl_regression(exponentiate=TRUE)%>%add_significance_stars(hide_ci = FALSE,hide_p = FALSE,hide_se = TRUE  )


t2<-modUniDept%>% tbl_regression(exponentiate=TRUE)%>%
  add_significance_stars(
    hide_ci = FALSE,
    hide_p = FALSE,
    hide_se = TRUE
  )

t3<-modUniResidence%>% tbl_regression(exponentiate=TRUE)%>%
  add_significance_stars(
    hide_ci = FALSE,
    hide_p = FALSE,
    hide_se = TRUE
  )

t4<-modUniEducation%>% tbl_regression(exponentiate=TRUE)%>%
  add_significance_stars(
    hide_ci = FALSE,
    hide_p = FALSE,
    hide_se = TRUE
  )


t5<-modUniMarital%>% tbl_regression(exponentiate=TRUE)%>%
  add_significance_stars(
    hide_ci = FALSE,
    hide_p = FALSE,
    hide_se = TRUE
  )

t6<-modUniWork%>% tbl_regression(exponentiate=TRUE)%>%
  add_significance_stars(
    hide_ci = FALSE,
    hide_p = FALSE,
    hide_se = TRUE
  )

t7<-modUniHeducation%>% tbl_regression(exponentiate=TRUE)%>%
  add_significance_stars(
    hide_ci = FALSE,
    hide_p = FALSE,
    hide_se = TRUE
  )

t8<-modUniBorder%>% tbl_regression(exponentiate=TRUE)%>%
  add_significance_stars(
    hide_ci = FALSE,
    hide_p = FALSE,
    hide_se = TRUE
  )

t9<-modUniCgender%>% tbl_regression(exponentiate=TRUE)%>%
  add_significance_stars(
    hide_ci = FALSE,
    hide_p = FALSE,
    hide_se = TRUE
  )

t10<-modUniANC%>% tbl_regression(exponentiate=TRUE)%>%
  add_significance_stars(
    hide_ci = FALSE,
    hide_p = FALSE,
    hide_se = TRUE
  )

t11<-modUniPdelivery%>% tbl_regression(exponentiate=TRUE)%>%
  add_significance_stars(
    hide_ci = FALSE,
    hide_p = FALSE,
    hide_se = TRUE
  )

#Final Univariate  COR----
#Putting tables together (tbl_stack)
#COR Table
tbl_stack(list (t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11), group_header = NULL)



###############################################################################

#Table 3: Multivariables logistic regression

###Multivariable glm----
modmulti <- glm(
  Coverage~Dept+Residence+Education+Work+Heducation+Border+ANC+Pdelivery,
  family = binomial(),
  data = data)

####AOR Table ini----
modmulti%>% tbl_regression(exponentiate=TRUE)%>%add_significance_stars(
  hide_ci = FALSE,
  hide_p = FALSE,
  hide_se = TRUE)

####Improve  mutlivariable model with stepAIC()----
library("MASS")
modmultifinal <- stepAIC (modmulti, direction= "both")

summary(modmultifinal)  



#Final AOR (final model)----
modmultifinal%>% tbl_regression(exponentiate=TRUE)%>%add_significance_stars(
  hide_ci = FALSE,
  hide_p = FALSE,
  hide_se = TRUE)






# Merging regression tables

#tbl_merge(tbls=list(finalt1,finalt2), tab_spanner = c("**Univariate**","**Multivariable**"))


