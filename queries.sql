-- 1. Топ-категории по выручке
SELECT PRODUCTLINE, SUM(SALES) as total_revenue
FROM sales
GROUP BY PRODUCTLINE
ORDER BY total_revenue DESC;

-- 2. Самый прибыльный месяц
SELECT MONTH_ID, SUM(SALES) as total
FROM sales
GROUP BY MONTH_ID
ORDER BY total DESC;

-- 3. Топ-5 клиентов
SELECT CUSTOMERNAME, SUM(SALES) as total
FROM sales
GROUP BY CUSTOMERNAME
ORDER BY total DESC
LIMIT 5;

-- 4. Средний чек и количество заказов по категориям
SELECT PRODUCTLINE,
       AVG(SALES) as avg_amount,
       COUNT(*) as order_count
FROM sales
GROUP BY PRODUCTLINE
ORDER BY avg_amount DESC;

-- 5. Выручка по месяцам с приростом к предыдущему
SELECT YEAR_ID, MONTH_ID,
       SUM(SALES) as revenue,
       LAG(SUM(SALES)) OVER (ORDER BY YEAR_ID, MONTH_ID) as prev_month,
       SUM(SALES) - LAG(SUM(SALES)) OVER (ORDER BY YEAR_ID, MONTH_ID) as growth
FROM sales
GROUP BY YEAR_ID, MONTH_ID
ORDER BY YEAR_ID, MONTH_ID;
