CREATE TABLE "Orders" (
  "Order_id" integer PRIMARY KEY,
  "Order_method" varchar(10),
  "Order_type" varchar(10),
  "Order_status" varchar(20),
  "Customer_id" integer,
  "Store_id" integer,
  "Total_price" float,
  "Delivery_fee" float,
  "created_at" timestamp,
  "modified_at" timestamp
);

CREATE TABLE "inventory_log" (
  "inventory_log_id" integer PRIMARY KEY,
  "Store_product_id" integer,
  "date_created" timestamp,
  "Order_id" integer,
  "type" varchar(3),
  "quantity" integer
);

CREATE TABLE "products" (
  "Product_id" integer PRIMARY KEY,
  "Product_name" varchar(100),
  "Product_description" varchar(255),
  "created_at" timestamp,
  "modified_at" timestamp
);

CREATE TABLE "customers" (
  "customer_id" integer PRIMARY KEY,
  "Name" varchar(100),
  "State" varchar(15),
  "Gender" varchar(1),
  "Age" integer,
  "created_at" timestamp,
  "modified_at" timestamp
);

CREATE TABLE "Stores" (
  "Store_id" integer,
  "Name" varchar(30),
  "State" varchar(15),
  "created_at" timestamp,
  "modified_at" timestamp
);

CREATE TABLE "store_products" (
  "Store_product_id" integer PRIMARY KEY,
  "Store_id" integer,
  "Product_id" integer,
  "price" float,
  "available" boolean
);

CREATE TABLE "inventory_levels" (
  "Inventory_level_id" integer PRIMARY KEY,
  "Store_product_id" integer,
  "Current_quantity" integer,
  "Min_stock_level" integer,
  "Last_updated" timestamp
);

COMMENT ON TABLE "Orders" IS 'Stores data of all orders by customers';

COMMENT ON COLUMN "Orders"."Order_method" IS 'Walk in, Online';

COMMENT ON COLUMN "Orders"."Order_type" IS 'Take out, Dine in';

COMMENT ON COLUMN "inventory_log"."type" IS 'In, Out';

COMMENT ON COLUMN "inventory_log"."quantity" IS 'Number of products that was taken in/out';

COMMENT ON COLUMN "customers"."Gender" IS 'M, F';

COMMENT ON COLUMN "store_products"."price" IS 'Store-specific price';

COMMENT ON COLUMN "store_products"."available" IS 'Whether the product is available at the store';

COMMENT ON COLUMN "inventory_levels"."Store_product_id" IS 'Store-specific product';

COMMENT ON COLUMN "inventory_levels"."Current_quantity" IS 'Current stock of the product at the store';

COMMENT ON COLUMN "inventory_levels"."Min_stock_level" IS 'Minimum stock level before restocking is needed';

ALTER TABLE "store_products" ADD FOREIGN KEY ("Store_product_id") REFERENCES "inventory_levels" ("Store_product_id");

ALTER TABLE "Orders" ADD FOREIGN KEY ("Customer_id") REFERENCES "customers" ("customer_id");

ALTER TABLE "inventory_log" ADD FOREIGN KEY ("Order_id") REFERENCES "Orders" ("Order_id");

ALTER TABLE "inventory_log" ADD FOREIGN KEY ("Store_product_id") REFERENCES "store_products" ("Store_product_id");

ALTER TABLE "store_products" ADD FOREIGN KEY ("Product_id") REFERENCES "products" ("Product_id");

ALTER TABLE "store_products" ADD FOREIGN KEY ("Store_id") REFERENCES "Stores" ("Store_id");
