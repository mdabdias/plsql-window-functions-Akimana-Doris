SELECT c.region,
       TO_CHAR(t.sale_date, 'YYYY-MM') AS sale_month,
       p.product_name,
       SUM(t.amount) AS total_revenue,
       RANK() OVER (
           PARTITION BY c.region, TO_CHAR(t.sale_date, 'YYYY-MM')
           ORDER BY SUM(t.amount) DESC
       ) AS product_rank
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
JOIN products p ON t.product_id = p.product_id
GROUP BY c.region, TO_CHAR(t.sale_date, 'YYYY-MM'), p.product_name
ORDER BY c.region, sale_month, product_rank;


SELECT c.region,
       TO_CHAR(t.sale_date, 'YYYY-MM') AS sale_month,
       SUM(t.amount) AS monthly_sales,
       SUM(SUM(t.amount)) OVER (
           PARTITION BY c.region ORDER BY TO_CHAR(t.sale_date, 'YYYY-MM')
       ) AS running_total
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY c.region, TO_CHAR(t.sale_date, 'YYYY-MM')
ORDER BY c.region, sale_month;

-------------------------------------------------------------------------------

WITH monthly_sales AS (
  SELECT c.region,
         TO_CHAR(t.sale_date, 'YYYY-MM') AS sale_month,
         SUM(t.amount) AS total_sales
  FROM transactions t
  JOIN customers c ON t.customer_id = c.customer_id
  GROUP BY c.region, TO_CHAR(t.sale_date, 'YYYY-MM')
)
SELECT region,
       sale_month,
       total_sales,
       LAG(total_sales) OVER (PARTITION BY region ORDER BY sale_month) AS prev_month_sales,
       ROUND(
         CASE 
           WHEN LAG(total_sales) OVER (PARTITION BY region ORDER BY sale_month) IS NULL THEN NULL
           ELSE ( (total_sales - LAG(total_sales) OVER (PARTITION BY region ORDER BY sale_month))::numeric
                   / LAG(total_sales) OVER (PARTITION BY region ORDER BY sale_month) ) * 100
         END, 2
       ) AS mom_growth_pct
FROM monthly_sales
ORDER BY region, sale_month;

--------------------------------------------------------------------------------------------------------

WITH monthly_sales AS (
  SELECT c.region,
         TO_CHAR(t.sale_date, 'YYYY-MM') AS sale_month,
         SUM(t.amount) AS total_sales
  FROM transactions t
  JOIN customers c ON t.customer_id = c.customer_id
  GROUP BY c.region, TO_CHAR(t.sale_date, 'YYYY-MM')
)
SELECT region,
       sale_month,
       total_sales,
       LAG(total_sales) OVER (PARTITION BY region ORDER BY sale_month) AS prev_month_sales,
       ROUND(
         CASE 
           WHEN LAG(total_sales) OVER (PARTITION BY region ORDER BY sale_month) IS NULL THEN NULL
           ELSE ( (total_sales - LAG(total_sales) OVER (PARTITION BY region ORDER BY sale_month))::numeric
                   / LAG(total_sales) OVER (PARTITION BY region ORDER BY sale_month) ) * 100
         END, 2
       ) AS mom_growth_pct
FROM monthly_sales
ORDER BY region, sale_month;

------------------------------------------------------------------------------------

SELECT c.customer_id,
       c.customer_name,
       SUM(t.amount) AS total_spent,
       NTILE(4) OVER (ORDER BY SUM(t.amount) DESC) AS spending_quartile,
       CUME_DIST() OVER (ORDER BY SUM(t.amount) DESC) AS cum_dist
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;

-------------------------------------------------------------------------------------

WITH monthly_sales AS (
  SELECT c.region,
         TO_CHAR(t.sale_date, 'YYYY-MM') AS sale_month,
         SUM(t.amount) AS total_sales
  FROM transactions t
  JOIN customers c ON t.customer_id = c.customer_id
  GROUP BY c.region, TO_CHAR(t.sale_date, 'YYYY-MM')
)
SELECT region,
       sale_month,
       total_sales,
       ROUND(
         AVG(total_sales) OVER (
           PARTITION BY region 
           ORDER BY sale_month
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
         ), 2
       ) AS three_month_avg
FROM monthly_sales
ORDER BY region, sale_month;


