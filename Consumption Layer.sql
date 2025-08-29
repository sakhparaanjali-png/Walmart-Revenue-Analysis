SELECT A.order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_estimated_delivery_date, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value, PAYMENT_ID, payment_sequential, payment_type, payment_installments, payment_value
INTO Cleaned_Joined_Orders
FROM Cleaned_Orders as A LEFT JOIN Cleaned_Order_items AS B ON A.order_id = B.order_id
					LEFT JOIN Cleaned_Payments AS C ON B.order_id = C.order_id
WHERE C.payment_value IS NOT NULL;



SELECT CAST(A.payment_id AS VARCHAR(50)) AS payment_id, A.payment_value, B.PRICE_FREIGHT_ORDERS
FROM Cleaned_Payments AS A LEFT JOIN Cleaned_Joined_Orders AS B ON A.order_id = B.order_id
WHERE B.order_id IS NULL
UNION ALL
SELECT 'TOTAL' AS payment_id, SUM(payment_value) AS payment_value
FROM Cleaned_Payments;