install.packages("tidyverse")
library(tidyverse)


getwd()
setwd("/Users/lucnguyen/Documents/Jobs/Certificates/Capstone/Case Study 1 Bike Share/Processed_Data")


data_2022_05 <- read_csv("2022-05-divvy-tripdata.csv")
#data_2022_06 <- read_csv("2022-06-divvy-tripdata.csv")
#data_2022_07 <- read_csv("2022-07-divvy-tripdata.csv")
#data_2022_08 <- read_csv("2022-08-divvy-tripdata.csv")
#data_2022_09 <- read_csv("2022-09-divvy-tripdata.csv")
#data_2022_10 <- read_csv("2022-10-divvy-tripdata.csv")
#data_2022_11 <- read_csv("2022-11-divvy-tripdata.csv")
#data_2022_12 <- read_csv("2022-12-divvy-tripdata.csv")
#data_2023_01 <- read_csv("2023-01-divvy-tripdata.csv")
#data_2023_02 <- read_csv("2023-02-divvy-tripdata.csv")
#data_2023_03 <- read_csv("2023-03-divvy-tripdata.csv")
#data_2023_04 <- read_csv("2023-04-divvy-tripdata.csv")

colnames(data_2022_05)

# next steps: clean data to make it smaller

unique(data_2022_05$rideable_type)

#make c = classic_bike, d = docked_bike, e = electric_bike
#find and replace for all files... LOL

data_2022_05["rideable_type"][data_2022_05["rideable_type"] == "classic_bike"] <- "c"
data_2022_05["rideable_type"][data_2022_05["rideable_type"] == "docked_bike"] <- "d"
data_2022_05["rideable_type"][data_2022_05["rideable_type"] == "electric_bike"] <- "e"

head(data_2022_05)

write.csv(data_2022_05, 
          "Smaller_Processed_Data/2022-05-divvy-tripdata.csv", row.names=FALSE)

