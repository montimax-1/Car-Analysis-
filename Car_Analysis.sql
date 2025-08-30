Create Database Carsalesdb

Use Carsalesdb

--Top 5 most expensive car parts with brand and category

Select Top 5 PartID, Brand, Category, Price
from Car_Parts
Order by Price Desc;

--Average price of parts grouped by category

Select Category, avg(Price) as AvgPrice
from Car_Parts
group by Category;


--Brands who have supplied more than 200 parts in stock
Select Brand, sum(StockQty) as TotalStock
from Car_Parts
group by Brand
having sum(StockQty) > 200;

--Number of parts per country of origin

Select CountryOfOrigin, count(*) as PartCount
from Car_Parts
Group by CountryOfOrigin
Order by PartCount Desc;

--Parts manufactured after 2015 with warranty more than 1 year
Select PartID, Brand, Category, ManufactureYear, Warranty
from Car_Parts
where ManufactureYear > 2015 and Warranty like '%Year%'
      and cast(left(Warranty,1) as int) > 1;


--Supplier with highest total stock quantity
Select top 1 Supplier, sum(StockQty) as TotalStock
from Car_Parts
group by Supplier
Order by TotalStock desc;

--Average discount per supplier
Select Supplier, avg(Discount) as AvgDiscount
from Car_Parts
group by Supplier;


--Categories where average customer rating < 4
Select Category, avg(CustomerRating) as AvgRating
from Car_Parts
Group by Category
having avg(CustomerRating) < 4;


--Total stock value (Price × StockQty) per supplier
Select Supplier, sum(Price * StockQty) as TotalStockValue
from Car_Parts
group by Supplier
order by TotalStockValue desc;


--Most shipping method
Select ShippingMethod, count(*) as CountUsed
from Car_Parts
group by ShippingMethod
order bY CountUsed desc;

--Top 3 countries by average price of parts
Select top 3 CountryOfOrigin, avg(Price) as AvgPrice
from Car_Parts
group by CountryOfOrigin
order by AvgPrice desc;


--Distribution of fuel types across categories
Select Category, FuelType, count(*) as CountParts
from Car_Parts
group by Category, FuelType
order by Category, CountParts desc;


--Supplier-wise count of refurbished vs new parts
Select Supplier, Condition, count(*) as CountParts
fRom Car_Parts
Group by Supplier, Condition;


--Brands that supply the maximum number of categories
Select top 3 Brand, count(distinct Category) as CategoryCount
from Car_Parts
group by Brand
order by CategoryCount desc;