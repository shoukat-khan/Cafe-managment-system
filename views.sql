
create view review_less_than_3 as
select i.item_name from Items i join Reviews r on r.Item_ID = i.Item_id
where r.Rating < 3

create view items_with_high_order as
select top 3 count (i.Item_name) as high_order from Items i join Order_Items o on i.Item_id=o.Item_id
group by i.Item_name 
order by high_order desc

create view report as
select c.F_name,c.L_name
from Customer c 
join Reviews r on r.Customer_ID=c.Customer_ID
join Items i on i.Item_id=r.Item_ID
join Categories ca on ca.Category_id=i.Category_id
group by ca.Category_name, c.F_name,c.L_name;

CREATE OR ALTER PROCEDURE get_last_month_order_details
    @Customer_ID INT
AS
BEGIN
    -- Check if the view exists, drop it if it does
    IF OBJECT_ID('last_month_order_details', 'V') IS NOT NULL
        DROP VIEW last_month_order_details;

    -- Create the view
    DECLARE @sql NVARCHAR(MAX);
    SET @sql = '
        CREATE VIEW last_month_order_details AS
        SELECT
            i.item_name,
            i.price,
            oi.Quantity,
            ca.Category_name,
            o.Order_date
        FROM Orders o
        JOIN Order_Items oi ON o.Order_ID = oi.Order_ID
        JOIN Customer c ON o.Customer_ID = c.Customer_ID
        JOIN Items i ON oi.Item_ID = i.Item_ID
        JOIN Categories ca ON i.Category_ID = ca.Category_ID
        WHERE o.Order_date >= DATEADD(MONTH, -1, DATEADD(DAY, 1, EOMONTH(GETDATE(), -1)))
            AND o.Order_date <= EOMONTH(GETDATE())
            AND c.Customer_ID = ' + CONVERT(NVARCHAR(10), @Customer_ID) + ';
    ';
    EXEC sp_executesql @sql;
END;


CREATE OR ALTER PROCEDURE get_last_week_order_details
	@Customer_ID INT
AS
BEGIN
	-- Check if the view exists, drop it if it does
	IF OBJECT_ID('last_week_order_details', 'V') IS NOT NULL
		DROP VIEW last_week_order_details;

	-- Create the view
	DECLARE @sql NVARCHAR(MAX);
	SET @sql = '
		CREATE VIEW last_week_order_details AS
		SELECT
			i.item_name,
			i.price,
			oi.Quantity,
			ca.Category_name,
			o.Order_date
		FROM Orders o
		JOIN Order_Items oi ON o.Order_ID = oi.Order_ID
		JOIN Customer c ON o.Customer_ID = c.Customer_ID
		JOIN Items i ON oi.Item_ID = i.Item_ID
		JOIN Categories ca ON i.Category_ID = ca.Category_ID
		WHERE o.Order_date >= DATEADD(WEEK, -1, GETDATE())
			AND o.Order_date <= GETDATE()
			AND c.Customer_ID = ' + CONVERT(NVARCHAR(10), @Customer_ID) + ';
	';
	EXEC sp_executesql @sql;
END;
