


colnames(all_trips_v4)

all_trips_v5 <- all_trips_v4

all_trips_v5 <- all_trips_v5 %>%
  separate(started_at_time, c('started_at_hour', 'started_at_min', 'started_at_sec'), sep=":")


all_trips_v2 <- all_trips %>%
  select(-c(start_station_id, start_station_name, end_station_name, end_station_id, ride_id))

all_trips_small <- all_trips_v2[sample(nrow(all_trips_v2), size=60000), ]

(ggplot(data = all_trips_small) + 
  geom_jitter(mapping = aes(x = start_lng, y = start_lat), alpha = .3)) + 
  facet_wrap(~day_of_week)


# all_trips_v5 <- all_trips_v5 %>%
#   filter(started_at_hour != "NA")

options(scipen = 999)

all_trips_v2 %>%
  group_by(member_casual, started_at_hour) %>%
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>%
  arrange(member_casual, started_at_hour)  %>%
  ggplot(aes(x = started_at_hour,
             y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge")+
  labs(title="Number of Rides By Hour of Day") +
  xlab('Hour of Day') +
  ylab('Number of Rides')


all_trips_v2 %>%
  group_by(member_casual, started_at_month) %>%
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>%
  arrange(member_casual, started_at_month)  %>%
  ggplot(aes(x = factor(started_at_month, 
                        level=c('05','06','07','08','09','10','11','12','01','02','03','04')),
             y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge")+
  labs(title="Number of Rides By Hour of Day") +
  xlab('Hour of Day') +
  ylab('Number of Rides')

