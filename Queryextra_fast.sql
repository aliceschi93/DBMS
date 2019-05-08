### QUERY extra	 - 	avg number of trips per day		90s
### FAST
### having


select round(avg(trips), 0) as av_trips_january
from (select date_pick, count(date_pick) as trips
  from time_info, location
        where location.id_trip = time_info.id_trip and distance < 25 
  group by date_pick
  having date_pick >= "2018-01-01" and date_pick <= "2018-31-01") as count_trips;


 
  
