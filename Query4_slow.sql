### QUERY 4 - number of trips per provider	105s
### SLOW
### join

SELECT provider_name, Count(pu_loc) as num_trips	
from provider, location, time_info
where provider.vendor_id = time_info.vendor_id and location.id_trip = time_info.id_trip
group by provider_name
order by num_trips desc;