### QUERY 2 - boroughs list ordered by number of trips (departure)		11s 
### FAST
### nested

select borough, sum(num_trips) as number_trips
from (
	select pu_loc, count(pu_loc) as num_trips
	from location
	group by pu_loc) as count_trip, lookup
	where lookup.LocationID = count_trip.pu_loc
group by borough
order by number_trips desc;


