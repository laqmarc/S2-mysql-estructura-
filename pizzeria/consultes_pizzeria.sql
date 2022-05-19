--Llista quants productes de tipus 'Begudas' s'han venut en una determinada localitat
--Beguda és la categoria 1 a products_cat --> id_cat_products ... order_detail.products_id ..
--order_detail.order_id --> order.id  ... order.id_shop --> shops.id  ... 
--shops.id_location --> location.id 
--BEGUDES VENUDES A BARCELONA location.id_location = 1
-- 
SELECT location.name, count(order_detail.product_quantity) 
FROM location, order_general
LEFT JOIN shops
ON shops.id = order_general.id_shop
LEFT JOIN order_detail
ON order_general.id = order_detail.order_id
AND order_detail.product_id = 1
WHERE location.name = 'Barcelona'
GROUP BY location.name

--Llista quantes comandes ha efectuat un determinat empleat

SELECT count(order_general.id), workers.name
FROM workers
LEFT JOIN order_general
ON order_general.id_worker = workers.id
WHERE workers.id = 4