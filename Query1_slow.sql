### QUERY 1 - most common payment type	 140s 
### SLOW
### nested

SELECT tbl.quali, tbl.quanti
FROM (
  SELECT pay_name as quali, COUNT(pay_type) AS quanti
  FROM payment, payment_tab
  where payment.pay_type = payment_tab.id_payment
  GROUP BY pay_type
) AS tbl
order by tbl.quanti
desc limit 1;