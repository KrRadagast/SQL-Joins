/* joins: select all the computers from the products table:

using the products table and the categories table, return the product name and the category name */
USE bestbuy;
SHOW TABLES;
SELECT products.Name AS products, categories.Name AS categories FROM products JOIN categories On categories.CategoryID= products.CategoryID
WHERE categories.Name LIKE '%computer%';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name, p.price,r.rating FROM products AS p JOIN reviews AS r ON p.ProductID=r.ProductID WHERE r.Rating=5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT concat(e.FirstName,e.LastName) AS Employee, SUM(s.Quantity) AS total FROM employees AS e JOIN sales AS s ON e.EmployeeID=s.EmployeeID group by e.EmployeeID ORDER BY total;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name AS Department, c.Name AS Category FROM categories AS c INNER JOIN departments On departments.DepartmentID= c.departmentID
WHERE c.Name LIKE '%Appliances%' OR c.Name LIKE '%Games%';
/* joins: find the product name, total # sold, and total price sold,

 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.name AS products, sales.quantity AS units_sold, (products.price * sales.quantity) AS price_sold FROM products JOIN sales ON products.name LIKE '%HOTEL CALIFORNIA%';
SELECT p.name, SUM(s.Quantity) AS total_sold, SUM(s.PricePerUnit*Quantity) AS total_price_sold FROM products AS p JOIN sales as s ON p.ProductID=s.ProductID WHERE p.ProductID = 97;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name,r.Reviewer,r.Rating,r.Comment FROM products AS p JOIN reviews AS r ON p.ProductID=r.ProductID WHERE p.Name='Visio TV' AND r.Rating<2;
