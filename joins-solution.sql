-- Get all customers and their addresses.
SELECT * FROM "customers" JOIN "addresses" on "customers"."id" = "addresses"."customer_id";

-- Get all orders and their line items.
SELECT * FROM "orders" JOIN "line_items" on "orders"."id" = "line_items"."order_id";

-- Which warehouses have cheetos?
SELECT * FROM "products" JOIN "warehouse_product" on "products"."id" = "warehouse_product"."product_id" JOIN "warehouse" on "warehouse_product"."warehouse_id" = "warehouse"."id"
WHERE "products"."description" ILIKE 'cheetos';

-- Which warehouses have diet pepsi?
SELECT * FROM "products" JOIN "warehouse_product" on "products"."id" = "warehouse_product"."product_id" JOIN "warehouse" on "warehouse_product"."warehouse_id" = "warehouse"."id"
WHERE "products"."description" ILIKE 'diet pepsi';

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers"."first_name", "customers"."last_name", count("orders"."address_id")
FROM "customers" JOIN "addresses" on "customers"."id" = "addresses"."customer_id"
JOIN "orders" on "orders"."address_id" = "addresses"."id" GROUP BY "customers"."id";

-- How many customers do we have?
SELECT count(*) FROM "customers";

-- How many products do we carry?
SELECT count(*) FROM "products";

-- What is the total available on-hand quantity of diet pepsi?
SELECT SUM("on_hand") FROM "products" JOIN "warehouse_product" on "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" ILIKE 'diet pepsi';
