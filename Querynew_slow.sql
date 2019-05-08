### query new	- trips with all pay_type except c.c. and with fare <= 4	46s
###	SLOW
### not in

select location.id_trip, p.borough as pickup, d.borough as dropoff, fare, pay_name
from lookup as p, lookup as d, payment, location,  payment_tab
where location.id_trip = payment.id_trip and location.pu_loc = p.LocationID and location.do_loc = d.LocationID
  and payment_tab.id_payment = payment.pay_type and 
        location.id_trip in (select id_trip
       from location
       where (location.id_trip not in (select id_trip
               from payment
               where pay_type = 1))
        and (location.id_trip not in (select id_trip
               from payment
               where fare > 4)));
