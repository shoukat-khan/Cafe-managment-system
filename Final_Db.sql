Select * from Customer
delete Customer
Select * from Administrator

Select * from User_Account

Select * from Orders

Alter Table Administrator
Alter Column PhoneNumber VARCHAR(12);

Alter table Employee ADD Salary VARCHAR(20);

Alter Table Employee
Alter Column PhoneNumber VARCHAR(12);

INSERT INTO User_Account (UserName, UserPassword) VALUES ('admin_Hashim', 'Hashim123');

-- Then, let's insert the corresponding administrator record into the Administrator table
INSERT INTO Administrator (Account_ID, F_name, L_name, Gender, PhoneNumber, Email) 
VALUES (SCOPE_IDENTITY(), 'Hashim', 'Ahmad', 'Male', 03216549878, 'hashim@gmail.com');
select * from Categories
select * from Items
select * from Item_Ingredients
Select * from Table_Reservations
SELECT Items.item_id, Items.item_name, Items.price, Items.Quantity, Categories.Category_Name, Item_Ingredients.Ingredient_name FROM Items INNER JOIN Categories ON Items.Category_ID = Categories.Category_ID Left JOIN Item_Ingredients ON Item_Ingredients.Item_ID=Items.Item_id
delete User_Account


delete Table_Reservations

delete from Table_Reservations
DBCC CHECKIDENT ('Table_Reservations', RESEED, 0)

Alter table table_Reservations add Constraint fk_customer 
foreign key (Customer_ID) references Customer(Customer_ID) ON DELETE CASCADE ON UPDATE CASCADE;


Delete from User_Account
DBCC CHECKIDENT ('User_Account', RESEED, 0)




delete from Customer
DBCC CHECKIDENT ('Customer', RESEED, 0)

select c.Customer_ID,c.F_name,c.L_name from Customer c join User_Account u on c.Account_ID = u.Account_id


select u.Account_id from User_Account u where u.UserName= 'xyz' AND u.UserPassword='xyz'
select * from User_Account
select * from Customer

delete from Cart
DBCC CHECKIDENT ('Cart', RESEED, 0)

delete from Cart_Items
DBCC CHECKIDENT ('Cart_Items', RESEED, 0)

-- drop the column from the order_item table
alter table order_items
drop column Order_ID

ALTER TABLE Order_Items
DROP CONSTRAINT FK__Order_Ite__Order__6C190EBB

ALTER TABLE Order_Items
add Order_ID int  references Orders(Order_ID) on delete cascade on update cascade


delete from Administrator
DBCC CHECKIDENT ('Administrator', RESEED, 0)

delete from Orders
DBCC CHECKIDENT ('Orders', RESEED, 0)

-- add constraint on the table_reservation
ALTER TABLE Table_Reservations
Drop Column Customer_ID

ALTER TABLE Table_Reservations
Add Customer_ID int references Customer(Customer_ID) on delete cascade on update cascade


INSERT INTO User_Account (UserName, UserPassword) VALUES ('admin', 'adminpassword');

-- Then, let's insert the corresponding administrator record into the Administrator table
INSERT INTO Administrator (Account_ID, F_name, L_name, Gender, PhoneNumber, Email) 
VALUES (SCOPE_IDENTITY(), 'Admin', 'LastName', 'Male', 1234567890, 'admin@example.com');

select Account_id from User_Account where UserName='admin';

select * from Item_Ingredients


SELECT Items.item_id, Items.item_name, Items.price, Items.Quantity, Categories.Category_Name, COUNT(Item_Ingredients.Ingredient_name) AS 'Ingredients' FROM Items INNER JOIN Categories ON Items.Category_ID = Categories.Category_ID Left JOIN Item_Ingredients ON Item_Ingredients.Item_ID=Items.Item_id GROUP BY Items.item_id, Items.item_name, Items.price, Items.Quantity, Categories.Category_Name having count(Item_Ingredients.Ingredient_name)>1
SELECT Items.item_id, Items.item_name, Items.price, Items.Quantity, Categories.Category_Name, COUNT(Item_Ingredients.Ingredient_name) AS 'Ingredients' FROM Items INNER JOIN Categories ON Items.Category_ID = Categories.Category_ID Left JOIN Item_Ingredients ON Item_Ingredients.Item_ID=Items.Item_id GROUP BY Items.item_id, Items.item_name, Items.price, Items.Quantity, Categories.Category_Name 