library(dplyr) #import library
library(tidyverse)

Mech_df <- read.csv('./resources/MechaCar_mpg.csv',stringsAsFactors = F) #read in file as a dataframe

head(Mech_df) #see the data

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=Mech_df) # run linear model

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=Mech_df)) #run summary on linear model.

sus_df <- read.csv('./resources/Suspension_Coil.csv', stringsAsFactors = F)

total_summary <- sus_df %>% summarise(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI),SD = sd(PSI), .groups ='keep')

total_summary

lot_summary <- sus_df %>% group_by(Manufacturing_Lot) %>% summarise(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI),SD = sd(PSI), .groups ='keep')

lot_summary

t.test(sus_df$PSI,mu=mean(1500))

t.test(subset(sus_df$PSI, sus_df$Manufacturing_Lot=='Lot1'), mu=mean(1500)) #testing for Lot 1

t.test(subset(sus_df$PSI, sus_df$Manufacturing_Lot=='Lot2'), mu=mean(1500)) #testing for Lot 2

t.test(subset(sus_df$PSI, sus_df$Manufacturing_Lot=='Lot3'), mu=mean(1500)) #testing for Lot 3
