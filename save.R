
counts <- aggregate(all_trips_v4$ride_length ~ all_trips_v4$member_casual +
                      all_trips_v4$day_of_week, FUN = mean)

write.csv(counts, 'avg_ride_len.csv')
