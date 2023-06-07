min(all_trips_v3$ride_length)

all_trips_v4 <- all_trips_v3

# average of 16 minutes 3.75 seconds (ride_length)
# median 9 minutes 58 seconds (ride_length)
# max 24 hours (ride_length)
# min 0 seconds (ride_length)

aggregate(all_trips_v4$ride_length ~ all_trips_v4$member_casual, FUN = mean)
aggregate(all_trips_v4$ride_length ~ all_trips_v4$member_casual, FUN = median)
aggregate(all_trips_v4$ride_length ~ all_trips_v4$member_casual, FUN = max)
aggregate(all_trips_v4$ride_length ~ all_trips_v4$member_casual, FUN = min)

#all_trips_v4$member_casual all_trips_v4$ride_length
#1                     casual           1307.1963 secs
#2                     member            732.3814 secs
#all_trips_v4$member_casual all_trips_v4$ride_length
#1                     casual                      750
#2                     member                      520
#all_trips_v4$member_casual all_trips_v4$ride_length
#1                     casual               86399 secs
#2                     member               86398 secs
#all_trips_v4$member_casual all_trips_v4$ride_length
#1                     casual                   0 secs
#2                     member                   0 secs

aggregate(all_trips_v4$ride_length ~ all_trips_v4$member_casual 
          + all_trips_v4$day_of_week, FUN = mean)

# all_trips_v4$member_casual all_trips_v4$day_of_week all_trips_v4$ride_length
# 1                      casual                        1           1512.6619 secs
# 2                      member                        1            810.5405 secs
# 3                      casual                        2           1321.5191 secs
# 4                      member                        2            701.0652 secs
# 5                      casual                        3           1174.9529 secs
# 6                      member                        3            700.3328 secs
# 7                      casual                        4           1118.3392 secs
# 8                      member                        4            698.5180 secs
# 9                      casual                        5           1165.4175 secs
# 10                     member                        5            709.5036 secs
# 11                     casual                        6           1244.3664 secs
# 12                     member                        6            721.9319 secs
# 13                     casual                        7           1463.4349 secs
# 14                     member                        7            816.1894 secs

all_trips_v4 %>% 
  group_by(member_casual, day_of_week) %>%  #groups by usertype and weekday
  summarise(number_of_rides = n()							#calculates the number of rides and average duration 
            ,average_duration = mean(ride_length)) %>% 		# calculates the average duration
  arrange(member_casual, day_of_week)								# sorts

# Groups:   member_casual [2]
# member_casual day_of_week number_of_rides average_duration
# <chr>               <dbl>           <int> <drtn>          
#   1 casual                  1          388836 1512.6619 secs  
# 2 casual                  2          275752 1321.5191 secs  
# 3 casual                  3          272663 1174.9529 secs  
# 4 casual                  4          284575 1118.3392 secs  
# 5 casual                  5          318471 1165.4175 secs  
# 6 casual                  6          350084 1244.3664 secs  
# 7 casual                  7          467926 1463.4349 secs  
# 8 member                  1          402081  810.5405 secs  
# 9 member                  2          484564  701.0652 secs  
# 10 member                  3          544402  700.3328 secs  
# 11 member                  4          556916  698.5180 secs  
# 12 member                  5          560884  709.5036 secs  
# 13 member                  6          497476  721.9319 secs  
# 14 member                  7          454431  816.1894 secs  





all_trips_v4$day <- = c("hi")

all_trips_v4["day"][all_trips_v4["day_of_week"] == "1"] <- "Sunday"
all_trips_v4["day"][all_trips_v4["day_of_week"] == "2"] <- "Monday"
all_trips_v4["day"][all_trips_v4["day_of_week"] == "3"] <- "Tuesday"
all_trips_v4["day"][all_trips_v4["day_of_week"] == "4"] <- "Wednesday"
all_trips_v4["day"][all_trips_v4["day_of_week"] == "5"] <- "Thursday"
all_trips_v4["day"][all_trips_v4["day_of_week"] == "6"] <- "Friday"
all_trips_v4["day"][all_trips_v4["day_of_week"] == "7"] <- "Saturday"

options(scipen = 999)

all_trips_v4 %>% 
  group_by(member_casual, day) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, day)  %>% 
  ggplot(aes(x = factor(day, level=c('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday')),
             y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge") +
  labs(title="Number of Rides vs. Day of the Week") + 
  xlab("Day of the Week") +
  ylab("Number of Rides")



all_trips_v4 %>%
  group_by(member_casual, day) %>%
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>%
  arrange(member_casual, day)  %>%
  ggplot(aes(x = factor(day,
                        level=c('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday')),
             y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge") +
  labs(title="Average Length of Rides vs. Day of Week") +
  xlab("Day of the Week") + 
  ylab("Average Ride Length (min)")

