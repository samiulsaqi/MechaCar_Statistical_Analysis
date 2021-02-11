library(dplyr) #import library
library(tidyverse)

Mech_df <- read.csv('./resources/MechaCar_mpg.csv',stringsAsFactors = F) #read in file as a dataframe

head(Mech_df) #see the data

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=Mech_df) # run linear model

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=Mech_df)) #run summary on linear model.

sus_df <- read.csv('./resources/Suspension_Coil.csv', stringsAsFactors = F)

head(sus_df)

total_summary <- sus_df %>% summarise(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI),SD = sd(PSI), .groups ='keep')

total_summary

lot_summary <- sus_df %>% group_by(Manufacturing_Lot) %>% summarise(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI),SD = sd(PSI), .groups ='keep')

lot_summary

t.test(sus_df$PSI,mu=mean(1500))

lot_1 <- sus_df %>% subset(Manufacturing_Lot == 'Lot1')
lot_2 <- sus_df %>% subset(Manufacturing_Lot == 'Lot2')
lot_3 <- sus_df %>% subset(Manufacturing_Lot == 'Lot3')

t.test(lot_1$PSI, mu=mean(1500)) #testing for Lot 1

t.test(lot_2$PSI, mu=mean(1500)) #testing for Lot 2

t.test(lot_3$PSI, mu=mean(1500)) #testing for Lot 3
