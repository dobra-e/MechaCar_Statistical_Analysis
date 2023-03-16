# Load dependencies
library(dplyr)
library(tidyverse)


# DELIVERABLE 1
# Read in the data
mecha_car <- read_csv('MechaCar_mpg.csv')
head(mecha_car)

# Linear model
lmMpg = lm(mpg~vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mecha_car)
summary(lmMpg)


# DELIVERABLE 2
# Read in the data
suspension <- read.csv('Suspension_Coil.csv', header=TRUE)
head(suspension)

# Summarize PSI
total_summary <- suspension %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
total_summary

# Summarize PSI by manufacturing lot
lot_summary <- suspension %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')
lot_summary


# DELIVERABLE 3
# T-test
t.test(suspension$PSI, mu=1500)

t.test(subset(suspension,Manufacturing_Lot=="Lot1")$PSI, mu = 1500)
t.test(subset(suspension,Manufacturing_Lot=="Lot2")$PSI, mu = 1500)
t.test(subset(suspension,Manufacturing_Lot=="Lot3")$PSI, mu = 1500)