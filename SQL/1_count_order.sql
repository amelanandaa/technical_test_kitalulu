select 
  EXTRACT(YEAR FROM order_purchase_timestamp) AS year,
  EXTRACT(MONTH FROM order_purchase_timestamp) AS month,
  FORMAT_TIMESTAMP('%b',order_purchase_timestamp) AS month_name,
  count (distinct order_id) as order_count
from `technical_test.order`
group by 1,2,3
order by year asc, month asc