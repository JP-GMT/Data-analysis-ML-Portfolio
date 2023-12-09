####Bacterial infections Epidemiology and Factors associated with Multi-Drug Resistance in the Northern Region, Ghana:a Cross-sectional Study###-------



###### Descriptive analyses AMR PHRL data#######

#Packages----
library(readxl)
library(questionr)
library(tidyverse)
library(gtsummary)
library(labelled)
library(GGally)



#Data importation----
library(readxl)
data <- read_excel("data.xlsx", na = "NA")
View(data)



#Labelling of the variables----
var_label(data$Sex)<-"Sex"
var_label(data$Age)<-"Age"
var_label(data$Age_Group)<-"Age group"
var_label(data$Year)<-"Year"
var_label(data$sample)<-"Sample"
var_label(data$Hospital_status)<-"Hospitalization status"
var_label(data$Bacteria)<-"Bacteria"
var_label(data$Gram)<-"Type of Gram"
var_label(data$MDR_Status)<-"MDR Status"


#Descriptive statistics----

##Analysis of age----
mean(data$Age, na.rm=TRUE)
median(data$Age, na.rm=TRUE)
sd(data$Age, na.rm=TRUE)
var(data$Age, na.rm=TRUE)
quantile(data$Age, na.rm=TRUE)
range(data$Age, na.rm=TRUE)
summary(data$Age, na.rm=TRUE)

##age_normality test----
shapiro.test(data$Age) 


#Summary tables analyses----
theme_gtsummary_mean_sd()

## Reordering data$Age_Group----
data$Age_Group <- data$Age_Group %>%
  fct_relevel(
    "Under 5", "5 - 14", "15 - 24", "25 - 44", "45 - 59", "60 +")


##Summary of characteristics of patients----
add_overall(last=TRUE, tbl_summary(data,include=c("Sex","Age","Age_Group","Hospital_status"),
                        by="Year", missing="no"))%>%
  add_p(test = list(all_continuous() ~ "kruskal.test"))


##Summary table of sample recorder  ----

tbl_summary(data,include=c("sample"), missing="no", 
            sort = all_categorical() ~ "frequency")
            
            


###Plot of Antibiotic susceptibility testing---- 
#Plot of each antibiotic----

#Plot AMK
plotAMK<-data %>% 
  filter(!is.na(AMK)) %>%count(AMK = factor(AMK)) %>% 
  mutate(Percentage = prop.table(n))%>%
  ggplot(aes(x = AMK, y = Percentage, fill = AMK, label = scales::percent(Percentage))) + 
  geom_col(position = 'dodge') + 
  geom_text(position = position_dodge(width = 0.9),    # move to center of bars
            vjust = 0.6,    # nudge above top of bar
            size = 4) + 
  scale_y_continuous(labels = scales::percent)
  

#Plot AMX
plotAMX<-data %>% 
  filter(!is.na(AMX)) %>%count(AMX = factor(AMX)) %>% 
  mutate(Percentage = prop.table(n))%>%
  ggplot(aes(x = AMX, y = Percentage, fill = AMX, label = scales::percent(Percentage))) + 
  geom_col(position = 'dodge') + 
  geom_text(position = position_dodge(width = .9),    # move to center of bars
            vjust = 2,    # nudge above top of bar
            size = 4) + 
  scale_y_continuous(labels = scales::percent)

#Plot PNV
plotPNV<-data %>% 
  filter(!is.na(PNV)) %>%count(PNV = factor(PNV)) %>% 
  mutate(Percentage = prop.table(n))%>%
  ggplot(aes(x = PNV, y = Percentage, fill = PNV, label = scales::percent(Percentage))) + 
  geom_col(position = 'dodge') + 
  geom_text(position = position_dodge(width = .9),    # move to center of bars
            vjust = 0.6,    # nudge above top of bar
            size = 4) + 
  scale_y_continuous(labels = scales::percent)

#Plot AZM
plotAZM<-data %>% 
  filter(!is.na(AZM)) %>%count(AZM = factor(AZM)) %>% 
  mutate(Percentage = prop.table(n))%>%
  ggplot(aes(x = AZM, y = Percentage, fill = AZM, label = scales::percent(Percentage))) + 
  geom_col(position = 'dodge') + 
  geom_text(position = position_dodge(width = .9),    # move to center of bars
            vjust = 2,    # nudge above top of bar
            size = 4) + 
  scale_y_continuous(labels = scales::percent)

#Plot ERY
plotERY<-data %>% 
  filter(!is.na(ERY)) %>%count(ERY = factor(ERY)) %>% 
  mutate(Percentage = prop.table(n))%>%
  ggplot(aes(x = ERY, y = Percentage, fill = ERY, label = scales::percent(Percentage))) + 
  geom_col(position = 'dodge') + 
  geom_text(position = position_dodge(width = .9),    # move to center of bars
            vjust = 2,    # nudge above top of bar
            size = 4) + 
  scale_y_continuous(labels = scales::percent)

#Plot CHL
plotCHL<-data %>% 
  filter(!is.na(CHL)) %>%count(CHL = factor(CHL)) %>% 
  mutate(Percentage = prop.table(n))%>%
  ggplot(aes(x = CHL, y = Percentage, fill = CHL, label = scales::percent(Percentage))) + 
  geom_col(position = 'dodge') + 
  geom_text(position = position_dodge(width = .9),    # move to center of bars
            vjust = 2,    # nudge above top of bar
            size = 4) + 
  scale_y_continuous(labels = scales::percent)

#Plot CIP
plotCIP<-data %>% 
  filter(!is.na(CIP)) %>%count(CIP = factor(CIP)) %>% 
  mutate(Percentage = prop.table(n))%>%
  ggplot(aes(x = CIP, y = Percentage, fill = CIP, label = scales::percent(Percentage))) + 
  geom_col(position = 'dodge') + 
  geom_text(position = position_dodge(width = .9),    # move to center of bars
            vjust = 2,    # nudge above top of bar
            size = 4) + 
  scale_y_continuous(labels = scales::percent)

#Plot CAZ
plotCAZ<-data %>% 
  filter(!is.na(CAZ)) %>%count(CAZ = factor(CAZ)) %>% 
  mutate(Percentage = prop.table(n))%>%
  ggplot(aes(x = CAZ, y = Percentage, fill = CAZ, label = scales::percent(Percentage))) + 
  geom_col(position = 'dodge') + 
  geom_text(position = position_dodge(width = .9),    # move to center of bars
            vjust = 2,    # nudge above top of bar
            size = 4) + 
  scale_y_continuous(labels = scales::percent)

#Plot CRO
plotCRO<-data %>% 
  filter(!is.na(CRO)) %>%count(CRO = factor(CRO)) %>% 
  mutate(Percentage = prop.table(n))%>%
  ggplot(aes(x = CRO, y = Percentage, fill = CRO, label = scales::percent(Percentage))) + 
  geom_col(position = 'dodge') + 
  geom_text(position = position_dodge(width = .9),    # move to center of bars
            vjust = 2,    # nudge above top of bar
            size = 4) + 
  scale_y_continuous(labels = scales::percent)

#Plot CTX
plotCTX<-data %>% 
  filter(!is.na(CTX)) %>%count(CTX = factor(CTX)) %>% 
  mutate(Percentage = prop.table(n))%>%
  ggplot(aes(x = CTX, y = Percentage, fill = CTX, label = scales::percent(Percentage))) + 
  geom_col(position = 'dodge') + 
  geom_text(position = position_dodge(width = .9),    # move to center of bars
            vjust = 2,    # nudge above top of bar
            size = 4) + 
  scale_y_continuous(labels = scales::percent)

#Plot FOX
plotFOX<-data %>% 
  filter(!is.na(FOX)) %>%count(FOX = factor(FOX)) %>% 
  mutate(Percentage = prop.table(n))%>%
  ggplot(aes(x = FOX, y = Percentage, fill = FOX, label = scales::percent(Percentage))) + 
  geom_col(position = 'dodge') + 
  geom_text(position = position_dodge(width = .9),    # move to center of bars
            vjust = 2,    # nudge above top of bar
            size = 4) + 
  scale_y_continuous(labels = scales::percent)

#Plot GEN
plotGEN<-data %>% 
  filter(!is.na(GEN)) %>%count(GEN = factor(GEN)) %>% 
  mutate(Percentage = prop.table(n))%>%
  ggplot(aes(x = GEN, y = Percentage, fill = GEN, label = scales::percent(Percentage))) + 
  geom_col(position = 'dodge') + 
  geom_text(position = position_dodge(width = .9),    # move to center of bars
            vjust = 2,    # nudge above top of bar
            size = 4) + 
  scale_y_continuous(labels = scales::percent)

#Plot MEM
plotMEM<-data %>% 
  filter(!is.na(MEM)) %>%count(MEM = factor(MEM)) %>% 
  mutate(Percentage = prop.table(n))%>%
  ggplot(aes(x = MEM, y = Percentage, fill = MEM, label = scales::percent(Percentage))) + 
  geom_col(position = 'dodge') + 
  geom_text(position = position_dodge(width = .9),    # move to center of bars
            vjust = 2,    # nudge above top of bar
            size = 4) + 
  scale_y_continuous(labels = scales::percent)

#Plot NOV   
plotNOV<-data %>% 
  filter(!is.na(NOV)) %>%count(NOV = factor(NOV)) %>% 
  mutate(Percentage = prop.table(n))%>%
  ggplot(aes(x = NOV, y = Percentage, fill = NOV, label = scales::percent(Percentage))) + geom_bar(stat="identity") + scale_fill_manual(values=c("#23C3C3")) +
  geom_col(position = 'dodge') +
  geom_text(position = position_dodge(width = .9),    
            vjust = 2,    
            size = 4) + 
  scale_y_continuous(labels = scales::percent) 


#Plot SXT
plotSXT<-data %>% 
  filter(!is.na(SXT)) %>%count(SXT = factor(SXT)) %>% 
  mutate(Percentage = prop.table(n))%>%
  ggplot(aes(x = SXT, y = Percentage, fill = SXT, label = scales::percent(Percentage))) + 
  geom_col(position = 'dodge') + 
  geom_text(position = position_dodge(width = .9),    # move to center of bars
            vjust = 2,    # nudge above top of bar
            size = 4) + 
  scale_y_continuous(labels = scales::percent)

#Plot TCY
plotTCY<-data %>%
  filter(!is.na(TCY)) %>%count(TCY = factor(TCY)) %>% 
  mutate(Percentage = prop.table(n))%>%
  ggplot(aes(x = TCY, y = Percentage, fill = TCY, label = scales::percent(Percentage))) + 
  geom_col(position = 'dodge') + 
  geom_text(position = position_dodge(width = 0.9),    # move to center of bars
            vjust = 2,    # nudge above top of bar
            size = 4) + 
  scale_y_continuous(labels = scales::percent) 
  
 

##Combine the plot of the antibiotics----
library("gridExtra")

grid.arrange(plotAMK, plotAMX,plotAZM,plotCAZ,
             plotCHL,plotCIP,plotCRO,plotCTX,
             plotERY,plotFOX,plotGEN,plotMEM,plotNOV,
             plotPNV,plotSXT,plotTCY,ncol=4, nrow=4) 
             


##Distribution of bacteria according to years----
add_overall(last=TRUE,tbl_summary(data,include=c("Bacteria"),
                        by="Year", missing="no",
                        sort = all_categorical() ~ "frequency"))%>%
                        add_p(test = list(all_categorical() ~ "chisq.test"))


##Distribution of bacteria according to Sex----
add_overall(last=TRUE,tbl_summary(data,include=c("Bacteria"),
                        by="Sex", missing="no",
                        percent="row",
                        sort = all_categorical() ~ "frequency"))%>%
                       add_p(test = list(all_categorical() ~ "chisq.test"))


##Distribution of bacteria according to age groups----
data[c("Bacteria", "Age_Group")] %>% 
  mutate(Age_Group = factor(Age_Group, levels = c("Under 5", "5 - 14", "15 - 24", "25 - 44", "45 - 59","60 +"))) %>% 
  tbl_summary(by = Age_Group, missing="no",
              sort = all_categorical() ~ "frequency")%>%
  add_p(test = list(all_categorical() ~ "chisq.test"))



#Resistance profile of isolated bacteria----


##AMK
t1<-data%>%tbl_summary(by="AMK",
                       include="Bacteria",
                       missing="no",
                       percent="row",
                       sort=all_categorical()~"frequency")
##AMX
t2<-data%>%tbl_summary(by=c("AMX"),
                       include="Bacteria",
                       missing="no",
                       percent="row",
                       sort=all_categorical()~"frequency")
##PNV 
t3<-data%>%tbl_summary(by=c("PNV"),
                       include="Bacteria",
                       missing="no",
                       percent="row",
                       sort=all_categorical()~"frequency")
                  
                       

##AZM
t4<-data%>%tbl_summary(by=c("AZM"),
                       include="Bacteria",
                       missing="no",
                       percent="row",
                       sort=all_categorical()~"frequency")
##ERY
t5<-data%>%tbl_summary(by=c("ERY"),
                       include="Bacteria",
                       missing="no",
                       percent="row",
                       sort=all_categorical()~"frequency")
##CHL
t6<-data%>%tbl_summary(by=c("CHL"),
                       include="Bacteria",
                       missing="no",
                       percent="row",
                       sort=all_categorical()~"frequency")
##CIP 
t7<-data%>%tbl_summary(by=c("CIP"),
                       include="Bacteria",
                       missing="no",
                       percent="row",
                       sort=all_categorical()~"frequency")
##CAZ
t8<-data%>%tbl_summary(by=c("CAZ"),
                       include="Bacteria",
                       missing="no",
                       percent="row",
                       sort=all_categorical()~"frequency")
##CRO 
t9<-data%>%tbl_summary(by=c("CRO"),
                       include="Bacteria",
                       missing="no",
                       percent="row",
                       sort=all_categorical()~"frequency")

##CTX
t10<-data%>%tbl_summary(by=c("CTX"),
                        include="Bacteria",
                        missing="no",
                        percent="row",
                        sort=all_categorical()~"frequency")
##FOX 
t11<-data%>%tbl_summary(by=c("FOX"),
                        include="Bacteria",
                        missing="no",
                        percent="row",
                        sort=all_categorical()~"frequency")

##GEN
t12<-data%>%tbl_summary(by=c("GEN"),
                        include="Bacteria",
                        missing="no",
                        percent="row",
                        sort=all_categorical()~"frequency")

##MEM
t13<-data%>%tbl_summary(by=c("MEM"),
                        include="Bacteria",
                        missing="no",
                        percent="row",
                        sort=all_categorical()~"frequency")

##NOV
t14<-data%>%tbl_summary(by=c("NOV"),
                        include="Bacteria",
                        missing="no",
                        percent="row",
                        sort=all_categorical()~"frequency")

##SXT
t15<-data%>%tbl_summary(by=c("SXT"),
                        include="Bacteria",
                        missing="no",
                        percent="row",
                        sort=all_categorical()~"frequency")

##TCY
t16<-data%>%tbl_summary(by=c("TCY"),
                        include="Bacteria",
                        missing="no",
                        percent="row",
                        sort=all_categorical()~"frequency")

##Putting the tables together----

tbl_merge(
  list(t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15,t16),
  tab_spanner = c("AMK", "AMX","PNV","AZM","ERY","CHL",
                  "CIP","CAZ","CRO","CTX","FOX","GEN",
                  "MEM","NOV","SXT","TCY"))





#####Bivariate analysis of MDR ####----

## Reordering data$Age_Group
data$Age_Group <- data$Age_Group %>%
  fct_relevel(
    "Under 5", "5 - 14", "15 - 24","25 - 44", "45 - 59","60 +"
  )


#Table of bivariate analysis----

data%>%
tbl_summary(by="MDR_Status",include = c("Sex",
                                        "Age",
                                        "Age_Group",
                                        "Hospital_status",
                                        "Bacteria"                                  ), 
            missing = "no", percent="row")%>%add_overall(last=TRUE)%>%add_p(test = list(all_continuous() ~ "kruskal.test"))





####### Logistic regression######----
#import dataset with no missing value----
library(readxl)
regdata <- read_excel("regdata.xlsx", na="NA")

view(regdata)
glimpse(regdata)



#labelling----
regdata <- regdata%>%set_variable_labels(
  MDR_Status="MDR Status",
  Sex="Sex",
  Age_Group="Age Group",
  Hospital_status="Hospitalization Status",
  Bacteria="Isolated Bacteria")

view(regdata)


#reordering some variables----

## Reordering regdata$Age_Group
regdata$Age_Group <- regdata$Age_Group %>%
  fct_relevel(
    "25 - 44","Under 5","5 - 14", "15 - 24", "45 - 59","60 +"
  )

## Reordering regdata$Bacteria
regdata$Bacteria <- regdata$Bacteria %>%
  fct_relevel(
    "Klebsiella spp","Moraxella spp","Staphylococcus spp","Acinetobacter spp", "Enterobacter spp",
    "Escherichia spp",  "Pseudomonas spp",
    "Others")

## Reordering regdata$Hospital_status
regdata$Hospital_status <- regdata$Hospital_status %>%
  fct_relevel(
    "Outpatient","Inpatient")

## Reordering regdata$Sex
regdata$Sex <- regdata$Sex %>%
  fct_relevel(
    "Male","Female")


## Reordering regdata$Hospital_status
regdata$MDR_Status<- regdata$MDR_Status %>%
  fct_relevel(
    "MDR-","MDR+")

##Converting variable from character to factor----

regdata$Sex <- as.factor(regdata$Sex)
regdata$Age_Group <- as.factor(regdata$Age_Group)
regdata$Hospital_status <- as.factor(regdata$Hospital_status)
regdata$Bacteria <- as.factor(regdata$Bacteria)
regdata$MDR_Status <- as.factor(regdata$MDR_Status)


##Change MDR+ to 1 and MDR- to 0
regdata$MDR_Status <- ifelse(regdata$MDR_Status=="MDR+",1,0)
regdata$MDR_Status <- as.factor(regdata$MDR_Status)

#logistic regression (Univariate analysis)----

# uni models
moduniSex <- glm(
  MDR_Status~Sex,
  family = binomial(),
  data = regdata)


modUniAge_Group <- glm(
  MDR_Status~Age_Group,
  family = binomial(),
  data = regdata)

modUniHospital_status <- glm(
  MDR_Status~Hospital_status,
  family = binomial(),
  data = regdata)

modUniBacteria<- glm(
  MDR_Status~Bacteria,
  family = binomial(),
  data = regdata)

#Uni model tables

tmoduniSex<-moduniSex%>% tbl_regression(exponentiate=TRUE)%>%
  add_significance_stars(
    hide_ci = FALSE,
    hide_p = FALSE,
    hide_se = TRUE
  )


tmodUniAge_Group<-modUniAge_Group%>% tbl_regression(exponentiate=TRUE)%>%
  add_significance_stars(
    hide_ci = FALSE,
    hide_p = FALSE,
    hide_se = TRUE
  )

tmodUniHospital_status<-modUniHospital_status%>% tbl_regression(exponentiate=TRUE)%>%
  add_significance_stars(
    hide_ci = FALSE,
    hide_p = FALSE,
    hide_se = TRUE
  )

tmodUniBacteria<-modUniBacteria%>% tbl_regression(exponentiate=TRUE)%>%
  add_significance_stars(
    hide_ci = FALSE,
    hide_p = FALSE,
    hide_se = TRUE
  )


##Univariate logistic analysis table----
#Putting tables together (tbl_stack)
#COR Table
tbl_stack(
  list (tmoduniSex,tmodUniAge_Group, tmodUniHospital_status,tmodUniBacteria ),
  group_header = NULL)



#logistic regression model

##multivariable logistic regression analysis----
modmulti <- glm(
  MDR_Status~Sex+Age_Group+Hospital_status+Bacteria,
  family = binomial(),
  data = regdata)



#AOR Table
modmulti%>% tbl_regression(exponentiate=TRUE)%>%add_significance_stars(
  hide_ci = FALSE,
  hide_p = FALSE,
  hide_se = TRUE)



##Improve the mutli variable model with stepAIC()----
library("MASS")
modmultifinal <- stepAIC (modmulti, direction= "both")

summary(modmultifinal)  

#AOR Table (final model)
modmultifinal%>% tbl_regression(exponentiate=TRUE)%>%add_significance_stars(
  hide_ci = FALSE,
  hide_p = FALSE,
  hide_se = TRUE)



###New figure (barchart) for AMR Resistance profile----

library(readxl)
dfig <- read_excel("data_newfig1.xlsx")
View(dfig)

# Load ggplot2
library(ggplot2)

# Create data (from the excel dataset "data_newfig1" )
datafig <- data.frame(
  ATB=c("AMK",	"AMX","PNV","AZM","ERY","CHL","CIP","CAZ","CTO","CTX","FOX","GEN","MEM","NOV","SXT","TCY") ,  
  Percentage=c(15.54,	77.37,	95.24,	42.61,	51.32,	54.76,	46.73,	38.48,	66.67,	62.36,	74.42,	30.55,	24.03,	0,	67.96,	71.30))

# initial barplot
ggplot(datafig, aes(x=ATB, y=Percentage))+
         geom_bar(stat = "identity", fill="steelblue")+
         geom_text(aes(label=Percentage), vjust=1.6, 
                   color="white", size=5)





