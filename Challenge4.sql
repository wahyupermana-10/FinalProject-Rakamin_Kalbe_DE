CREATE DATABASE KALBE;
USE KALBE;

CREATE TABLE Inventory (
    Item_code INT PRIMARY KEY,
    Item_name VARCHAR(100),
    Item_price DECIMAL(10, 2),
    Item_total INT
);

INSERT INTO 
	Inventory(Item_code, Item_name, Item_price, Item_total)
VALUES 
	(2341, 'Promag Tablet', 3000, 100),
	(2342, 'Hydro Coco 250ML', 7000, 20),
	(2343, 'Nutrive Benecol 100ML', 20000, 30),
	(2344, 'Blackmores Vit C 500Mg', 95000, 45),
	(2345, 'Entrasol Gold 370G', 90000, 120);

SELECT 
	Item_name, Item_price, MAX(Item_total) as Item_total
From
	inventory
GROUP BY 
	Item_name, Item_price
ORDER BY 
	Item_total 
DESC LIMIT 1;

UPDATE inventory 
SET Item_Price = 80000
WHERE Item_name = 'Entrasol Gold 370G';


INSERT INTO 
	Inventory(Item_code, Item_name, Item_price, Item_total)
VALUES 
	(2343, 'Prenagen Lactamom Velvety Chocolate 400gr', 75400, 25);
	
DELETE FROM inventory 
ORDER BY Item_total ASC LIMIT 1;