
### QUERY 1 - most common payment type

CREATE view count_pay as 
SELECT pay_type, Count(pay_type) as Num_of_payment	
from payment
group by pay_type;

select pay_name, Num_of_payment
from count_pay, payment_tab
where Num_of_payment = (select max(Num_of_payment)
      from count_pay) and pay_type = id_payment;


### QUERY 2 - boroughs list ordered by number of trips (departure)

SELECT borough, Count(pu_loc) as num_trips	
from lookup, location
where lookup.LocationID = location.pu_loc
group by lookup.borough
order by num_trips desc;


### QUERY 3 - average number of passengers per (departure) borough

SELECT Borough, ROUND(avg(pass_num)) as avg_pass
FROM payment, location, lookup
where payment.id_trip = location.id_trip and lookup.LocationID = location.pu_loc
group by Borough;


### QUERY 4 - number of trips per provider

SELECT provider_name, Count(pu_loc) as num_trips	
from provider join location
on provider.vendor_id = location.vendor_id
group by provider_name
order by num_trips desc;

### QUERY 5 - trips with high distances

SELECT p.borough as pickup, c.borough as dropoff, distance 
FROM lookup as p, lookup as c, location
where p.LocationID = location.pu_loc and c.LocationID = location.do_loc
having distance >= 10 and distance <= 100 
order by distance desc
limit 100;

### QUERY 6 - outliers: trip with high distance and low total_amount

SELECT p.borough as pickup, c.borough as dropoff, distance, total 
FROM lookup as p, lookup as c, location, payment
where p.LocationID = location.pu_loc and c.LocationID = location.do_loc
having distance > 100 or total < 3
limit 100;


### QUERY 7 - top trips with average distance, duration and most common borough

SELECT p.borough as pickup, c.borough as dropoff, distance, time_drop, time_pick
FROM lookup as p, lookup as c, location, time_info
where location.id_trip = time_info.id_trip and p.LocationID = location.pu_loc and 
											   c.LocationID = location.do_loc
having (time_drop - time_pick) between 180 and 360 and distance between 2.5 and 3 and 
		pickup = 'Manhattan'
order by distance desc
limit 1000;


### QUERY 8 - average tip for trips from Manhattan to Jfk airport

SELECT b.Borough as pickup, a.Zone as dropoff, round(avg(tip), 2) as average_tip
FROM payment, location, lookup as a, lookup as b
where location.id_trip = payment.id_trip and
		(a.LocationID = location.do_loc and a.Zone = 'JFK Airport' and
        b.LocationID = location.pu_loc and b.Borough = "Manhattan");

