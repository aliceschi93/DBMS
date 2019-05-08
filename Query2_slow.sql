### QUERY 2 - boroughs list ordered by number of trips (departure)		38s 
### SLOW
### nested

SELECT borough, Count(pu_loc) as num_trips	
from lookup, location
where lookup.LocationID = location.pu_loc
group by lookup.borough
order by num_trips desc;
