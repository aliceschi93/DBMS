### QUERY 4 - number of trips per provider	5s
### FAST
### nested


SELECT provider_name, num
from (SELECT vendor_id, COUNT(vendor_id) as num 
	FROM time_info 
	GROUP BY vendor_id 
	ORDER BY num desc) as conta_prov, provider
where provider.vendor_id = conta_prov.vendor_id;