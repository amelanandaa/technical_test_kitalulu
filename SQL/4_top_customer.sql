WITH customer_spending AS(
  SELECT 
    EXTRACT(YEAR FROM o.order_purchase_timestamp) AS year,
    EXTRACT(MONTH FROM o.order_purchase_timestamp) AS month,
    c.customer_id,
    SUM(op.payment_value) AS total_spending,
    FROM `technical_test.order` as o
    JOIN `technical_test.order_payment` as op
    ON o.order_id = op.order_id
    JOIN `technical_test.customer` as c
    ON o.customer_id = c.customer_id
    WHERE o.order_status NOT IN ('canceled','unavailable')
    GROUP BY 1,2,3
  ),
ranked_customer AS(
  SELECT 
    cs.year,
    cs.month,
    cs.customer_id,
    cs.total_spending,
    RANK() OVER (PARTITION BY cs.year, cs.month ORDER BY cs.total_spending DESC) AS top_customer
    FROM customer_spending as cs
)
SELECT
  rc.year,
  rc.month,
  rc.customer_id,
  rc.total_spending
  FROM ranked_customer as rc
  WHERE rc.top_customer <=3
  ORDER BY 1,2,3 desc
