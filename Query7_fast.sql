### QUERY 7 - top trips with average distance and duration		32s
###	FAST
###	view

create view time_loc as
select location.id_trip, pu_loc, do_loc, distance, time_pick, time_drop
from location, time_info
where location.id_trip = time_info.id_trip;

select p.borough as pickup, d.borough as dropoff, distance, time_pick, time_drop
from time_loc, lookup as p, lookup as d
where time_loc.id_trip = time_loc.id_trip
  and p.LocationID = time_loc.pu_loc and d.LocationID = time_loc.do_loc
        and p.borough = "Manhattan" and distance between 2.5 and 3
        and (time_drop - time_pick) between 180 and 360;