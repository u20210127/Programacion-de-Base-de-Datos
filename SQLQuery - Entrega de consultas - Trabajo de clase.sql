/*1-Seleccione todos los datos de la tabla Departament del schema HumanResources.*/
SELECT * FROM HumanResources.Department;

/*2- Seleccione un agrupamiento de los nombres de grupos que existen en la tabla Departament del schema 
HumanResources.*/
SELECT GroupName, COUNT(*) AS GroupCount FROM HumanResources.Department
GROUP BY GroupName;

/*3- Seleccione todos los departamentos ordenándolos en orden descendente.*/
SELECT * FROM HumanResources.Department
ORDER BY DepartmentID DESC;

/*4- Seleccione todos los departamentos ordenándolos en orden ascendente.*/
SELECT * FROM HumanResources.Department
ORDER BY DepartmentID ASC;

/*5- Seleccione todos los empleados de la tabla Employee del schema Human Resources.*/
SELECT * FROM HumanResources.Employee;

/*6- Seleccione todos los empleados de la tabla Employee del schema Human Resources donde el género sea masculino.*/
SELECT * FROM HumanResources.Employee WHERE Gender = 'M';

/*7- Seleccione todos los empleados de la tabla Employee del schema Human Resources donde el nivel de organización 
sea mayor a 3.*/
SELECT * FROM HumanResources.Employee
WHERE OrganizationLevel > 3;

/*8- Seleccione todos los empleados de la tabla Employee del schema Human Resources donde el nivel de organización 
sea mayor e igual a 2 y que el género sea femenino.*/
SELECT * FROM HumanResources.Employee
WHERE OrganizationLevel >= 2 AND Gender = 'F';

/*9- Selección los campos BusinessEntityID,NationalIDNumber de la tabla Employee del schema Human Resources donde 
los jobtitle sean Marketing Assistant o Design Engineer.*/
SELECT BusinessEntityID, NationalIDNumber FROM HumanResources.Employee
WHERE JobTitle IN ('Marketing Assistant', 'Design Engineer');

/*10- Seleccionar todos los empleados de la tabla Employee del schema Human Resources que estén entre la fecha de 
nacimiento de 1 de enero de 1969 y 31 de diciembre de 1972.*/
SELECT * FROM HumanResources.Employee
WHERE BirthDate BETWEEN '1969-01-01' AND '1972-12-31';

/*11- De la tabla Employee del schema Human Resources Calcule el total de ah pagar por horas de vacacion si se 
conece que cada hora cuesta $8.00.*/
SELECT BusinessEntityID, VacationHours, VacationHours * 8.00 AS TotalVacationCost FROM HumanResources.Employee;

/*12- De la tabla Production.ProductSubcategory muestre cuantas subcategorías hay registradas por categoría.*/
SELECT ProductCategoryID, COUNT(*) AS SubcategoryCount FROM Production.ProductSubcategory
GROUP BY ProductCategoryID;

/*13- De la tabla Sales.Customer mostrar cuantos clientes existen registrados por territorios.*/
SELECT TerritoryID, COUNT(*) AS CustomerCount FROM Sales.Customer
GROUP BY TerritoryID;

/*14- De la tabla sales.SalesOrderHeader mostrar la suma total del Sub Total de compra según el IdCustomer que se 
coloque.*/
SELECT CustomerID, SUM(SubTotal) AS TotalSubTotal FROM Sales.SalesOrderHeader
GROUP BY CustomerID;

/*15- De la tabla Sales. CreditCard mostrar cuantas tarjetas según su tipo están registradas en el sistema.*/
SELECT CardType, COUNT(*) AS CardCount FROM Sales.CreditCard
GROUP BY CardType;

/*16- De la tabla Sales.SalesOrderDetail evaluar Linea total de compra que es el total de la compra, si la compra 
es mayor de $1000.00 realizar un descuento del 10% y mostrar el nuevo total a pagar si es mayor $1500.00 realizar 
un descuento del 14% y mostrar el nuevo total a pagar si es mayor de $2000.00 realizar un descuento del 18% y 
mostrar el nuevo total a pagar.*/
SELECT SalesOrderID, UnitPrice * OrderQty AS TotalBeforeDiscount,
       CASE
           WHEN UnitPrice * OrderQty > 2000 THEN (UnitPrice * OrderQty) * 0.82
           WHEN UnitPrice * OrderQty > 1500 THEN (UnitPrice * OrderQty) * 0.86
           WHEN UnitPrice * OrderQty > 1000 THEN (UnitPrice * OrderQty) * 0.90
           ELSE UnitPrice * OrderQty
       END AS TotalAfterDiscount
FROM Sales.SalesOrderDetail;