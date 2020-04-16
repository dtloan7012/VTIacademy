USE `adventureworks`;

-- Question 1: Viết 1 query lấy thông tin "Name" từ bảng Production.Product có name của ProductSubcategory là 'Saddles'. 
		-- CÁCH 1: Dùng Subquery
 SELECT 	 `Name`
 FROM  		 product 
 WHERE   	 ProductSubcategoryID = ( SELECT  ProductSubcategoryID
								 FROM    productsubcategory 
								 WHERE   `Name` =  'Saddles' ) ;
 
		-- CÁCH 2: Dùng CTE 
WITH CTE_getName_Saddles AS (
	SELECT  p.`Name`
	FROM 	product p
    JOIN 	productsubcategory ps  ON  p.ProductSubcategoryID = ps.ProductSubcategoryID      
    WHERE  ps.`Name` =  'Saddles' )
        
  SELECT  *
  FROM		CTE_getName_Saddles ; 
 -- Question 2: Thay đổi câu Query 1 để lấy được kết quả sau.
 
 /**** CÁCH 1: Dùng Subquery ****/
 SELECT  	`Name`
 FROM   	product 
 WHERE    	ProductSubcategoryID IN  ( SELECT  ProductSubcategoryID
								 FROM    productsubcategory 
								 WHERE   `Name` LIKE 'Bo%' ) ;
                                 
 /*** CÁCH 2  : Dùng CTE ***/
 WITH CTE_get_name AS (
	SELECT  p.`Name`
	FROM 	product p
    JOIN 	productsubcategory ps  ON  p.ProductSubcategoryID = ps.ProductSubcategoryID
    WHERE   ps.`Name` LIKE 'Bo%'
 )  
	SELECT  *
    FROM     CTE_get_name ;
 
-- Question 3:  Viết câu query trả về tất cả các sản phẩm có giá rẻ nhất (lowest ListPrice) và Touring Bike (nghĩa là ProductSubcategoryID = 3) 
 /**** CÁCH 1: Dùng Subquery ****/
SELECT  `Name`
 FROM   product 
 WHERE ListPrice  = 
				(SELECT MIN(ListPrice) 
				FROM   product 
				WHERE  ProductSubcategoryID = ( SELECT ProductSubcategoryID 
													FROM   productsubcategory 
													WHERE   `Name` = 'Touring Bikes' ));
					
 /*** CÁCH 2  : Dùng CTE ***/
WITH TouringBikesProduct	AS(
	SELECT 	p.ProductID, p.`Name` AS ProductName, p.ListPrice, psc.ProductSubcategoryID, psc.`Name`	AS SubCategoryName
	FROM   	product p
	JOIN	productsubcategory psc ON	p.ProductSubcategoryID = psc.ProductSubcategoryID
	WHERE  	psc.`Name` = 'Touring Bikes'
)
SELECT 	ProductName
FROM    TouringBikesProduct ;

                    
/* Exercise 2: JOIN nhiều bảng 

 Question 1: Viết query lấy danh sách tên country và province được lưu  trong AdventureWorks2008sample database. */
	SELECT 		ct.`Name` , sp.`Name`
	FROM  			countryregion ct 
	JOIN			stateprovince sp  ON  ct.CountryRegionCode = sp.CountryRegionCode ; 
	
 
 /* Question 2 Tiếp tục với câu query trước và thêm điều kiện là chỉ lấy country Germany và Canada 
 Chú ý: sủ dụng sort order và column headings  */
	SELECT 			ct.`Name` , sp.`Name`
	FROM  			countryregion ct 
	JOIN			stateprovince sp  ON  ct.CountryRegionCode = sp.CountryRegionCode 
	WHERE   		ct.`Name` = 'Germany' OR ct.`Name` =  'Canada' 
	ORDER BY  		ct.`Name` ;
 
 /* Question 3 Từ bảng SalesPerson, chúng ta lấy cột BusinessEntityID (là định danh của người sales),
 Bonus and the SalesYTD (là đã sale được bao nhiêu người trong năm nay) 
 Hướng dẫn: Join SalesOrderHeader và SalesPerson để hạn chế kết quả non-Internet orders 
 (order được xử lý trên Internet có OnlineOrderFlag = 1 và cột SalesPersonID = null) 
 Vì không đủ chỗ nên đã lược cột OrderDate Học sinh khi làm bài cần phải thêm cột OrderDate vào bài làm */
 
	SELECT 	sh.SalesOrderID, sh.OrderDate, sp.SalesPersonID, sp.SalesPersonID AS BusinessEntityID, sp.Bonus, sp.SalesYTD
	FROM 		salesorderheader sh 
	JOIN		salesperson  	sp	ON	sh.SalesPersonID = sp.SalesPersonID;
 
 
 /* Question 4:  Sử dụng câu query, thêm cột JobTitle and xóa cột SalesPersonID và BusinessEntityID. 
 Hướng dẫn: Join với bảng HumanResources.Employee */
 
	SELECT 		sh.SalesOrderID, sh.OrderDate, Title AS Jobtitle , sp.Bonus,  sp.SalesYTD
	FROM			salesperson sp 
	JOIN			salesorderheader sh  ON		sh.SalesPersonID = sp.SalesPersonID
	JOIN			employee 		e 	ON		sh.SalesPersonID = e.EmployeeID ;
 
 
 
 
                     
                    
                    
 