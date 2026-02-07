CREATE TABLE User_Account(Account_id INT identity(1,1),
UserName VARCHAR(20),
UserPassword VARCHAR(20),
PRIMARY KEY(Account_id)
);

CREATE TABLE Administrator(Administrator_ID INT IDENTITY(1,1),
Account_ID INT,
F_name VARCHAR(20), 
L_name VARCHAR(20),
Gender VARCHAR(10),
PhoneNumber INT,
Email VARCHAR(30),
Primary key(Administrator_ID),
Foreign Key(Account_ID) References User_Account (Account_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Customer(Customer_ID INT IDENTITY(1,1),
Account_ID INT,
F_name VARCHAR(20), 
L_name VARCHAR(20),
Gender VARCHAR(10),
PhoneNumber INT,
Email VARCHAR(30),
Primary key(Customer_ID),
Foreign Key(Account_ID) References User_Account (Account_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Employee(Employee_ID INT IDENTITY(1,1),
Account_ID INT,
F_name VARCHAR(20), 
L_name VARCHAR(20),
Gender VARCHAR(10),
PhoneNumber INT,
Email VARCHAR(30),
Primary Key(Employee_ID),
Foreign Key(Account_ID) References User_Account (Account_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Categories(Category_id INT Identity(1,1),
Category_name varchar(20),
Primary Key(Category_id)
);

CREATE TABLE Items(Item_id INT identity(1,1),
item_name varchar(20),
price float,
Quantity INT,
Category_id INT,
Primary Key(Item_id),
foreign key(Category_id) references Categories(Category_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Item_Ingredients(Ingredient_ID INT Identity(1,1),
Ingredient_name VARCHAR(20),
Item_ID INT,
Quantity float,
Primary key(Ingredient_ID),
Foreign key(Item_ID) references Items(Item_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Reviews(Review_ID INT Identity(1,1),
Customer_ID INT,
Item_ID INT,
rating Float,
Primary key(Review_ID),
Foreign key(Item_ID) references Items(Item_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Cart(Cart_ID INT Identity(1,1),
Customer_ID INT,
creation_date Date,
Primary Key(Cart_ID),
Foreign key(Customer_ID) References Customer(Customer_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Cart_Items(Cart_Item_ID INT Identity(1,1),
Cart_ID INT,
Item_ID INT,
Quantity Float,
Primary Key(Cart_Item_ID),
Foreign key(Cart_ID) References Cart(Cart_ID) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign key(Item_ID) References Items(Item_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CafeTable(Table_num INT Identity(1,1),
Table_capacity INT,
Primary Key(Table_num)
);

CREATE TABLE Table_Reservations(Reservation_ID INT Identity(1,1),
Customer_ID INT,
table_Num INT,
Primary Key(Reservation_ID),
Foreign Key (table_num) References CafeTable (Table_num) ON DELETE CASCADE ON UPDATE CASCADE
);

Create table Payments(Payment_ID INT IDENTITY(1,1),
Cart_ID INT,
Payment_type VARCHAR(20),
Primary Key(Payment_ID),
Foreign Key(Cart_ID) references Cart (Cart_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Orders(Order_ID INT Identity(1,1),
Customer_ID INT,
Order_date Date,
Primary Key(Order_ID),
Foreign key(Customer_ID) References Customer(Customer_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Order_Items(Order_Items_ID INT Identity(1,1),
Cart_ID INT,
Item_ID INT,
Quantity Float,
Primary Key(Order_Items_ID),
Foreign key(Cart_ID) References Cart(Cart_ID) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign key(Item_ID) References Items(Item_id) ON DELETE CASCADE ON UPDATE CASCADE
);


select * from Items

INSERT INTO Categories VALUES ('Tea'), ('Cakes'), ('Coffee'),
('Shakes');

Alter Table Employee
Alter Column PhoneNumber VARCHAR(12);

SELECT * FROM Items
Select * from Item_Ingredients
Select * from User_Account;
select * from Employee

Alter table Employee ADD Salary VARCHAR(20);

delete User_Account

Select I.Item_id, I.item_name from Item_Ingredients n Join Items I ON n.Item_ID=I.Item_id
Group by I.Item_id, I.item_name having count(n.Ingredient_ID)>5

Select U.UserName, E.F_name, E.L_name from User_Account U Join Employee E ON U.Account_id=E.Account_ID
where E.Salary>(Select avg(Convert(Decimal(10,2),E1.Salary)) from Employee E1);



Select I.item_name, C.Category_name from Items I join Categories c ON I.Category_id=C.Category_id

-- First, let's insert a new user into the User_Account table
INSERT INTO User_Account (UserName, UserPassword) VALUES ('admin', 'adminpassword');

-- Then, let's insert the corresponding administrator record into the Administrator table
INSERT INTO Administrator (Account_ID, F_name, L_name, Gender, PhoneNumber, Email) 
VALUES (SCOPE_IDENTITY(), 'Admin', 'LastName', 'Male', 1234567890, 'admin@example.com');

Alter Table Administrator
Alter Column PhoneNumber VARCHAR(12);

select * from Customer