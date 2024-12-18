SELECT 
  EXTRACT(YEAR FROM o.order_estimated_delivery_date) AS year,
  EXTRACT(MONTH FROM o.order_estimated_delivery_date) AS month,
  COUNT(o.order_id) AS count,
  FROM `technical_test.order` as o
  WHERE
    o.order_delivered_customer_date > o.order_estimated_delivery_date
    AND o.order_delivered_customer_date is not null
    AND o.order_estimated_delivery_date is not null
  GROUP BY 1,2
  ORDER BY year asc, month asc