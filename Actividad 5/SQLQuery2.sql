/*Mostrar los 10 clientes con mayor compra de productos
Siempre y cuando hayan comprado productos de alguno de estas Categorías
Condiments, Seafood, Beverages
Mostrar los resultados con esta información*/
SELECT TOP 10 C.CompanyName, SUM(OD.Quantity) [Cantidad de compras]
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
INNER JOIN Products P ON OD.ProductID = P.ProductID
INNER JOIN Categories Ca ON P.CategoryID = Ca.CategoryID
WHERE Ca.CategoryName = 'Condiments' 
OR Ca.CategoryName = 'Seafood' 
OR Ca.CategoryName = 'Beverages'
GROUP BY C.CompanyName
ORDER BY SUM(OD.Quantity) desc