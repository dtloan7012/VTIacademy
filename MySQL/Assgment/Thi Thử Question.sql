 USE 			SalesCar ;
/* Question 1: Viết lệnh lấy ra thông tin của khách hàng: tên, số lượng oto khách hàng đã mua và 
sắp sếp tăng dần theo số lượng oto đã mua */

SELECT  	c.`Name`, c.Phone, c.Email, SUM(cd.Amount) AS So_oto
FROM		customer c 
JOIN 		car_order cd 	ON	c.CustomerID = cd.CustomerID 
GROUP BY	c.CustomerID
ORDER BY	So_oto DESC ;




/* Question 2:Viết hàm (không có parameter) trả về tên hãng sản xuất đã bán được nhiều oto nhất trong năm nay. )*/
DROP PROCEDURE IF EXISTS P_GetCar ;
DELIMITER $$
CREATE PROCEDURE P_GetCar ()
	BEGIN 
		WITH  CTE_GetCar AS (
			SELECT		c.Maker, SUM(co.Amount) AS So_xe
			FROM		car c 
			JOIN		car_order co  ON	c.CarID = co.CarID
			WHERE 		YEAR(co.DeliveryDate) = YEAR(NOW())
			GROUP BY	c.Maker 
			HAVING     	SUM(co.Amount) )
	
				SELECT cgc1.Maker, cgc1.So_xe
				FROM   CTE_GetCar  cgc1
				WHERE  cgc1.So_xe = (   SELECT  MAX(cgc2.So_xe)
										FROM 	CTE_GetCar cgc2);
	END $$
DELIMITER ;
CALL  salescar.P_GetCar();

COMMIT ;
/****  Question 4 :Viết 1 thủ tục (không có parameter) để xóa các đơn hàng đã bị hủy của những năm trước.
		In ra số lượng bản ghi đã bị xóa. ****/
DROP PROCEDURE IF EXISTS P_Delete_canceled_order
DELIMITER $$
CREATE PROCEDURE P_Delete_canceled_order ()
	BEGIN
		DELETE 
        FROM		car_order
		WHERE 			Staus = 2 AND  YEAR(OrderDate) <> YEAR(NOW());
	END $$
    DELIMITER ;
-- USING
CALL P_Delete_canceled_order ();

/*** Question 5 :Viết 1 thủ tục (có CustomerID parameter) để in ra thông tin của các đơn hàng đã đặt hàng bao gồm: 
tên của khách hàng, mã đơn hàng, số lượng oto và tên hãng sản xuất ****/
DROP PROCEDURE IF EXISTS 	P_Information_line ;
DELIMITER $$
CREATE PROCEDURE  P_Information_line ( IN Customer_ID TINYINT UNSIGNED)
	BEGIN
		SELECT  	ct.`Name`, c.CarID, co.Amount, c.Maker
		FROM		car_order co
		JOIN		customer ct 	ON	co.CustomerID = ct.CustomerID
		JOIN		car c		ON		co.CarID= c.CarID
		WHERE  		ct.CustomerID = Customer_ID ;
	END $$
DELIMITER ;

-- USING
CALL P_Information_line('0');
    



                
		