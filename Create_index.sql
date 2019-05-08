
create index idx_pay
on payment_tab (id_payment, pay_name);

create index idx_provider
on provider (vendor_id, provider_name);

create index idx_provider_time
on time_info (vendor_id);

create index idx_pay_type
on payment (pay_type);

create index loc
on lookup (LocationID);
