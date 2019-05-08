### QUERY 7 - top trips with average distance and duration	 	200s
### SLOW
### join

SELECT p.borough as pickup, c.borough as dropoff, distance, time_pick, time_drop
FROM lookup as p, lookup as c, location, time_info
where location.id_trip = time_info.id_trip and p.LocationID = location.pu_loc and c.LocationID = location.do_loc 
										   and p.borough = 'Manhattan' and ((time_drop - time_pick) between 180 and 360) 
                                           and (distance between 2.5 and 3) 
order by distance desc;
