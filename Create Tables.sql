--CREATING TABLES IN DBO SERVER

CREATE TABLE [DBO].[Geolocations](
	[geolocation_zip_code_prefix] INT NOT NULL PRIMARY KEY,
	[geolocation_lat] FLOAT NOT NULL,
	[geolocation_lng] FLOAT NOT NULL,
	[geolocation_city] CHAR(50) NOT NULL,
	[geolocation_state] CHAR(5) NOT NULL
)


CREATE TABLE [dbo].[Customers](
	[customer_id] [nvarchar](50) NOT NULL PRIMARY KEY,
	[customer_unique_id] [nvarchar](50) NOT NULL,
	[customer_zip_code_prefix] INT NULL REFERENCES GEOLOCATions(geolocation_zip_code_prefix),
	[customer_city] CHAR(100) NOT NULL,
	[customer_state] CHAR(5) NOT NULL,
	CONSTRAINT UNI1 UNIQUE(customer_unique_id)
) 


CREATE TABLE [DBO].[Sellers](
	[seller_id] [nvarchar](50) NOT NULL PRIMARY KEY,
	[seller_zip_code_prefix] INT NULL,
	[seller_city] CHAR(100) NOT NULL,
	[seller_state] CHAR(5) NOT NULL,
	FOREIGN KEY (seller_zip_code_prefix) REFERENCES GEOLOCATions(geolocation_zip_code_prefix)
)



CREATE TABLE DBO.[Orders](
	[order_id] [varchar](50) NOT NULL PRIMARY KEY,
	[customer_id] [nvarchar](50) NULL REFERENCES CUSTOMERS(customer_id),
	[order_status] CHAR (20) NOT NULL CHECK (order_status IN ('approved', 'canceled', 'created', 'delivered', 'invoiced', 'processing', 'shipped', 'unavailable')),
	[order_purchase_timestamp] DATETIME,
	[order_approved_at] DATETIME,
	[order_delivered_carrier_date] DATETIME,
	[order_delivered_customer_date] DATETIME,
	[order_estimated_delivery_date] DATETIME
)

DROP TABLE ORDER_ITEMS;
DROP TABLE PRODUCTS;

CREATE TABLE DBO.[Products](
	[product_id] [nvarchar](50) NOT NULL PRIMARY KEY,
	[product_category] CHAR(50) NULL,
	[product_name_length] INT NULL,
	[product_description_length] INT NULL,
	[product_photos_qty] INT NULL,
	[product_weight_g] INT NULL,
	[product_length_cm] INT NULL,
	[product_height_cm] INT NULL,
	[product_width_cm] INT NULL
)


CREATE SEQUENCE PAYMENT_ID_SEQ
START WITH 1
INCREMENT BY 1;

CREATE TABLE DBO.[Payments](
	PAYMENT_ID INT PRIMARY KEY DEFAULT NEXT VALUE FOR PAYMENT_ID_SEQ,
	[order_id] [varchar](50) NULL REFERENCES ORDERS(order_id),
	[payment_sequential] INT NULL,
	[payment_type] CHAR (20) NOT NULL CHECK (payment_type IN ('credit_card', 'debit_card', 'not_defined', 'UPI', 'voucher')),
	[payment_installments] INT NOT NULL,
	[payment_value] FLOAT NOT NULL
)



CREATE TABLE DBO.[Order_items](
	[order_id] [varchar](50) NOT NULL REFERENCES ORDERS(ORDER_ID),
	[order_item_id] INT NOT NULL,
	[product_id] [nvarchar](50) NULL REFERENCES PRODUCTS(PRODUCT_ID),
	[seller_id] [varchar](50) NOT NULL,
	[shipping_limit_date] DATETIME,
	[price] FLOAT NOT NULL,
	[freight_value] FLOAT NOT NULL,
	PRIMARY KEY (order_id, order_item_id)
)


CREATE TABLE DBO.[Walmart_Trustpilot_Reviews](
	[reviewer_name] CHAR (50) NOT NULL,
	[review_time] DATETIME,
	[star_rating] CHAR (50) NULL,
	[headline] [nvarchar](MAX) NULL,
	[review_content] [nvarchar](MAX) NULL,
	[experience_time] DATETIME
)