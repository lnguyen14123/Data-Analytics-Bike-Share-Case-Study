install.packages("tidyverse")
library(tidyverse)


getwd()
setwd("/Users/lucnguyen/Documents/Jobs/Certificates/Capstone/Case Study 1 Bike Share/Processed_Data")

data_2022_05 <- read_csv("2022-05-divvy-tripdata.csv")
data_2022_06 <- read_csv("2022-06-divvy-tripdata.csv")
data_2022_07 <- read_csv("2022-07-divvy-tripdata.csv")
data_2022_08 <- read_csv("2022-08-divvy-tripdata.csv")
data_2022_09 <- read_csv("2022-09-divvy-tripdata.csv")
data_2022_10 <- read_csv("2022-10-divvy-tripdata.csv")
data_2022_11 <- read_csv("2022-11-divvy-tripdata.csv")
data_2022_12 <- read_csv("2022-12-divvy-tripdata.csv")
data_2023_01 <- read_csv("2023-01-divvy-tripdata.csv")
data_2023_02 <- read_csv("2023-02-divvy-tripdata.csv")
data_2023_03 <- read_csv("2023-03-divvy-tripdata.csv")
data_2023_04 <- read_csv("2023-04-divvy-tripdata.csv")

all_trips <- bind_rows(data_2022_05, data_2022_06, data_2022_07,
                       data_2022_08, data_2022_09, data_2022_10,
                       data_2022_11, data_2022_12, data_2023_01,
                       data_2023_02, data_2023_03, data_2023_04)

colnames(all_trips)

all_trips <- all_trips %>%
          select(-c(start_lat, start_lng, end_lat, end_lng))

rm(data_2022_05, data_2022_06, data_2022_07,
   data_2022_08, data_2022_09, data_2022_10,
   data_2022_11, data_2022_12, data_2023_01,
   data_2023_02, data_2023_03, data_2023_04)
