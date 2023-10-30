SELECT c.customer_name, sum(unpaid.due)
FROM customer c JOIN
(SELECT o.customer_id,
s.price_per_month*s.subsctription_length as due,
o,order_status
from orders o join subscriptions s
on o.subscirptions_id = s.subscription-id 
where o.order_status ="unpaid"
and description="Fashon Magazine") unpaid
on c.customer_id = unpaid.customer_id
group by c.customer_name;
