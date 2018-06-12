-- 1. Get all customers and their addresses.
SELECT * FROM customers
JOIN addresses ON addresses.customer_id = customers.id;
-- 2. Get all orders and their line items.
SELECT * FROM orders
JOIN line_items ON line_items.order_id = orders.id
-- 3. Which warehouses have cheetos?
SELECT * FROM products
JOIN warehouse_product ON warehouse_product.product_id = products.id
JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
WHERE products.description = 'cheetos';
-- 4. Which warehouses have diet pepsi?
SELECT * FROM products
JOIN warehouse_product ON warehouse_product.product_id = products.id
JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
WHERE products.description = 'diet pepsi';
-- 5. Get the number of orders for each customer. 
SELECT customers.first_name, COUNT(*) FROM customers
JOIN addresses ON customers.id = addresses.customer_id
JOIN orders ON orders.address_id = addresses.id
GROUP BY customers.first_name;
-- 6. How many customers do we have?
SELECT COUNT(*) FROM customers
-- 7. How many products do we carry?
SELECT COUNT(*) FROM products
-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM(warehouse_product.on_hand) FROM warehouse_product
JOIN products ON warehouse_product.product_id = products.id
WHERE products.description = 'diet pepsi';
