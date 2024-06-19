####### WWIC FCM Abundance Data  ######
# Author: Miranda Herschel Seixas
# Date: 06/18/2024

#Install packages
install.packages("tidyverse")
library(tidyverse); packageVersion("tidyverse") #1.3.1
citation("tidyverse")

library(devtools)
install.packages("rcompanion")
library(rcompanion); packageVersion("rcompanion") #2.4.1
citation("rcompanion")

install.packages("FSA")
library(FSA); packageVersion("FSA") #0.9.3
citation("FSA")

#########################################

#Create dataframe from csv file
FCM_data <-read_csv(file.choose()) # file = "WWIC_FCM_Stats.csv"                                                                                                                                                

#Check dataset
View(FCM_data)

#Test for normal distribution of data
shapiro.test(FCM_data$BACT)
# Results:
# W = 0.59517, p-value = 1.703e-08 (insignificant)
#   not normally distributed

#Non-parametric test
kruskal.test(BACT ~ Sample, data=FCM_data)
# Results:
# Kruskal-Wallis chi-squared = 14.406, df = 3, p-value = 0.002402

# Non-parametric post hoc test
#     Dunn (1964) Kruskal-Wallis multiple comparison
#     p-values adjusted with the Holm method
dunnTest(BACT ~ Sample, data=FCM_data)
# Results: 
#  Comparison          Z     P.unadj      P.adj
# 1 Background ice - Blank-mir -0.0204980 0.983646106 0.98364611
# 2 Background ice - Ice block  0.3334314 0.738808696 1.00000000
# 3      Blank-mir - Ice block  0.3188741 0.749822008 1.00000000
# 4     Background ice - Water -3.0666134 0.002164987 0.01298992
# 5          Blank-mir - Water -2.3192472 0.020381637 0.10190818
# 6          Ice block - Water -2.0852423 0.037047315 0.14818926
