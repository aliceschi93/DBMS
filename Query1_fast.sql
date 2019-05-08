### QUERY 1 - most common payment type		9s (5s with index on)
### FAST
### with view

CREATE view count_pay as 
SELECT pay_type, Count(pay_type) as Num_of_payment	
from payment
group by pay_type;
    
select pay_name, max(Num_of_payment)
from count_pay, payment_tab
where pay_type = id_payment;