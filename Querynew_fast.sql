### query new	- trips with all pay_type except c.c. and with fare <= 4	0.23s
###	FAST
### not equal

Select location.id_trip, p.borough as pickup, d.borough as dropoff, fare, pay_name   
From location, lookup as d, lookup as p, payment, payment_tab
Where location.id_trip = payment.id_trip and p.LocationID = location.pu_loc and d.LocationID = location.do_loc
              and payment_tab.id_payment = payment.pay_type
                            and (fare <= 4 and pay_type != 1);