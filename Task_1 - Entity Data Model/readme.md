# Table names and Descriptions
## Orders:
Stores information about each order: Customer who placed it, order method (e.g., walk-in, online), order type (e.g., take-out, dine-in), total price, and the associated store. It also tracks order status and timestamps for creation and modification.

## Inventory_log:
Logs stock movements at the store level, recording when products are added (in) or removed (out) from inventory. It links each movement to an order and a specific store-product combination, tracking the quantity of items moved.

## Products:
Contains a catalog of all the different types of food sold, storing information such as product name, description, and timestamps for creation and updates. This table serves as the core repository of all the types of food sold accross all outlets.

## Customers:
Holds personal information about customers, including name, location (state), gender, age, and timestamps. This table allows us track customer demographics and ordering behavior.

## Stores:
Contains details about each store location, including store name and state. It records when each store was created and modified, and the states they are located in.

## Store_products:
Tracks which products are available at specific stores, including store-specific pricing and availability status. This table ensures that products are only listed for stores where they are sold, therefore allowing each Store to have its own menu.

## Inventory_levels:
Manages current stock levels for each product at each store, including the current quantity, minimum stock threshold for restocking, and the last time inventory was updated. This table helps in inventory monitoring and optimal stock management.

![Entity Data Model](https://raw.githubusercontent.com/DamilolaAdeniji/Data-Modeling-Assignment/main/Task_1%20-%20Entity%20Data%20Model/Fufu_Republic_ER.png)
