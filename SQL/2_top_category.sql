-- Based on total_revenue
select 
  cn.translation as category,
  sum(oi.price) as total_revenue,
  count(distinct o.order_id) as total_order
  from `technical_test.order` as o
  join `technical_test.order_item` as oi
  on o.order_id = oi.order_id
  join `technical_test.products` as p
  on oi.product_id = p.product_id
  join `technical_test.category_name` as cn
  on p.product_category_name = cn.category
  where o.order_status = 'delivered'
  group by 1
  order by total_revenue desc
  limit 20

-- Based on total_order
select 
  cn.translation as category,
  sum(oi.price) as total_revenue,
  count(distinct o.order_id) as total_order
  from `technical_test.order` as o
  join `technical_test.order_item` as oi
  on o.order_id = oi.order_id
  join `technical_test.products` as p
  on oi.product_id = p.product_id
  join `technical_test.category_name` as cn
  on p.product_category_name = cn.category
  where o.order_status = 'delivered'
  group by 1
  order by total_order desc
  limit 20