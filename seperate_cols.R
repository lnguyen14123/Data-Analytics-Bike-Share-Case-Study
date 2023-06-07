
summary(all_trips)

all_trips <- all_trips %>% separate(started_at,
                                    c("started_at_date","started_at_time")
                                    ,sep=" ")



all_trips <- all_trips %>% separate(started_at_date,
                                    c("started_at_year","started_at_month", "started_at_day")
                                    ,sep="-")

all_trips <- all_trips %>% separate(started_at_time,
                                    c("started_at_hour","started_at_min", "started_at_sec")
                                    ,sep=":")

all_trips <- all_trips %>%
  filter(started_at_time != "NA")

all_trips_v3 <- all_trips

colnames(all_trips)

head(all_trips)
