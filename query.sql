select 
	Customers.CustomerName,
    Customers.Country,
    Products.ProductName,
    Count(DISTINCT Orders.OrderID) as TotalOrders,
    sum(OrderDetails.Quantity) as TotalItems,
    avg(Products.Price) as AvgPrice
 from Customers
 left join Orders 
 on Customers.CustomerID = Orders.CustomerID
 inner join OrderDetails 
 on Orders.OrderID = OrderDetails.OrderID
 inner join Products
 on OrderDetails.ProductID = Products.ProductID
 where Customers.Country <> 'Germany'
 group by Customers.CustomerID, Customers.CustomerName, Customers.Country,Products.ProductName
 having count (distinct Orders.OrderID) > 1
 order by TotalOrders, TotalItems desc;
