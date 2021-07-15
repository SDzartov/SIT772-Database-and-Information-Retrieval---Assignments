-- TASK 1
SELECT 	c.country_name AS Country, 
		r.region_name AS Region, 
        COUNT(r.region_id) AS Warehouses
FROM regions r
INNER JOIN countries AS c
	ON r.region_id = c.region_id
INNER JOIN locations AS l
	ON c.country_id = l.country_id
INNER JOIN warehouses AS wh
	ON l.location_id = wh.location_id
GROUP BY country_name ORDER BY country_name;

-- TASK 2
SELECT cs.customer_id , cs.name
FROM customers AS cs
INNER JOIN orders AS od 
	ON cs.customer_id = od.customer_id
WHERE salesman_id = 64
ORDER BY customer_id DESC; 

-- TASK 3 
SELECT 	emp.employee_id, emp.first_name, emp.last_name, 
		mgr.first_name AS 'Manager First Name', 
		mgr.last_name AS 'Manager Last Name'
FROM employees AS emp
LEFT JOIN employees AS mgr ON emp.manager_id = mgr.employee_id
WHERE emp.first_name LIKE '%co%' 
		OR emp.last_name LIKE '%co%' 
		OR mgr.first_name LIKE '%co%' 
		OR mgr.last_name LIKE '%co%'
ORDER BY emp.last_name DESC;

-- TASK 4
SELECT pr.product_id, pr.product_name, pr.list_price
FROM products as pr
LEFT JOIN inventories as iv 
	ON pr.product_id = iv.product_id
LEFT JOIN warehouses as wh 
	ON iv.warehouse_id = wh.warehouse_id
LEFT JOIN locations as lc 
	ON wh.location_id = lc.location_id
LEFT JOIN countries as ct 
	ON ct.country_id = lc.country_id
WHERE country_name LIKE 'a%'
ORDER BY pr.list_price;

-- TASK 5
SELECT warehouse_name, 
inventories.quantity*order_items.unit_price AS Total_Sales
FROM warehouses
JOIN inventories 
	ON warehouses.warehouse_id = inventories.warehouse_id
JOIN order_items 
	ON inventories.product_id = order_items.product_id 
GROUP BY warehouse_name ORDER BY Total_Sales DESC;

-- TASK 6
SELECT cu.customer_id, cu.name, 
	SUM(oi.quantity*oi.unit_price) AS Total_Spending
FROM customers AS cu
LEFT JOIN orders AS od ON od.customer_id = cu.customer_id
LEFT JOIN order_items AS oi ON oi.order_id = od.order_id
GROUP BY cu.customer_id 
ORDER BY Total_Spending DESC;
 






