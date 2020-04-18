  /**** CREATE SelesCar DATABASE ****/
 DROP DATABASE IF EXISTS    SalesCar ;
 CREATE DATABASE IF NOT EXISTS  SalesCar ;
 USE 			SalesCar ;
 
 -- Create Customer table
 DROP TABLE IF EXISTS  Customer ;
 CREATE TABLE IF NOT EXISTS Customer (
	CustomerID   	INT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    `Name`			VARCHAR(30) NOT NULL,
     Phone			CHAR(15)  UNIQUE KEY,
     Email 			VARCHAR(50)  NOT NULL,
     Address		VARCHAR(100) NOT NULL,
     Note			VARCHAR(500)
 );
 
 -- CREATE CAR table 
 DROP TABLE IF EXISTS CAR ;
 CREATE TABLE IF NOT EXISTS CAR (
	CarID			VARCHAR(15) PRIMARY KEY,
    Maker  			ENUM('Honda', 'Toyota' , 'Nissan'),
    Model 			VARCHAR(30) NOT NULL,
    `Year`			YEAR NOT NULL,
    Color			VARCHAR(20) NOT NULL,
    Note 			VARCHAR(300)
) ;

-- Create Car_Order Table 
DROP TABLE IF EXISTS  Car_Order ;
CREATE TABLE IF NOT EXISTS 	Car_Order  (
	OrderID			INT UNSIGNED AUTO_INCREMENT  PRIMARY KEY, 
    CustomerID		INT UNSIGNED NOT NULL ,
    CarID			VARCHAR(15) NOT NULL ,
    Amount			TINYINT UNSIGNED DEFAULT(1) NOT NULL,
    SalePrice		FLOAT NOT NULL,
    OrderDate 		DATE ,
    DeliveryDate	DATE  ,
    DeliveryAddress VARCHAR(100),
	Staus			ENUM ( '1' ,'2' ), -- (0: đã đặt hàng, 1:đã giao, 2:đã hủy
    Note			VARCHAR(500),
		FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE,
        FOREIGN KEY (CarID) REFERENCES CAR(CarID)
    );



-- CREATE Customer Insert
INSERT INTO Customer ( 		`Name`				 ,		Phone		  ,		Email						 ,	Address		,	Note  	)
VALUES				(    'Nguyen Thi Mai'    	 ,    '+08212271158'  ,   'mai.nguyenthi@gmail.com'    	 ,  'Hà Nội '  	,  'Mua trả góp' ),			-- 1
                    (     'Dang Thanh Phuong '   ,    '+08243723465'  ,   'phuong.dangthanh@gmail.com'   ,  'Thanh Hóa' ,  'Đã trả 50%'  ),         -- 2
                    (     'Nguyen Kim Oanhhhh'   ,    '+08265332433'  ,   'oanh.nguyenkim@gmail.com'     ,  'Hưng yên'  ,  'Đã trả 30%'  ),         -- 3
                    (     'Phung Van Tung'       ,    '+08454363348'  ,   'tung.phungvan@gmail.com'      , 	'Nghệ An'   ,  'Mua trả góp' ),         -- 4
                    (     'Dinh Thu Trang'       ,    '+08212124338'  ,   'trang.dinhthu@gmail.com'      , 	'Bình Định' ,      NULL		 ),         -- 5
                    (     'Nguyen Van Hai'       ,    '+08216763258'  ,   'hai.nguyenvan@gmail.com'      , 	'Hà Nội'    ,  'Đã trả 50%'  ),         -- 6
                    (     'Do Manh Hung'         ,    '+08210987132'  ,   'hung.domanh@gmail.com'        ,  'Hưng yên'  ,  'Mua trả góp' ),         -- 7
                    (     'Dang Thuy Linh'       ,    '+08212223466'  ,   'linh.dangthuy@gmail.com'      ,  'Đà Nẵng'   ,     NULL		 ),         -- 8
                    (     'Dinh Thu Loan'        ,    '+08214234323'  ,   'loan.dinhthu@gmail.com'       ,  'Hà Nội '   ,  'Mua trả góp' ),         -- 9
                    (     'Tran Thanh Ha'        ,    '+08214315632'  ,   'han.tranthanh@gmail.com'      ,  'Hà Nội '   ,  'Đã trả 50%'  );         -- 10
                    
-- CREATE CAR Insert
INSERT INTO		CAR (  CarID		, 	Maker	,	Model			, 	`Year`	, 	Color	,	Note 	)
VALUES				( 'H214325'		,'HONDA'	, 'Honda CR-V 1.5'	,   2015	, 'white'   ,  NULL  	),
					( 'H214335'		,'HONDA'	, 'Honda City-V ' 	,   2018	, 'Yellow'  ,  NULL  	),
					( 'N945832'		,'NISSAN'	, 'Nissan X Trail '	,   2019	, 'Black'   ,  NULL  	),
                    ( 'H036548'		,'NISSAN'	, 'Nisan Terra'	  	,   2017	, 'white'   ,  NULL  	),
					( 'T483492'		,'TOYOTA'	, 'Toyota Inova'	,   2018	, 'Black'   ,  NULL  	),
					( 'T028543'		,'TOYOTA'	, 'Toyota Hilux FX'	,   2020	, 'Yellow'  ,  NULL  	);

-- Create Car_Order Insert
INSERT INTO	 Car_Order	  ( CustomerID	,	CarID	,		Amount	,	SalePrice	,	OrderDate	,	DeliveryDate	,	Staus	,	Note	,	DeliveryAddress	)			
VALUES		     		  (		1		,	'H036548'	,	2		,	300000000	, '2019-11-20'	,  '2020-01-15'		,	  1		,	 NULL  	,	'Thanh Hóa' 	),		-- 1                                                                                                                   
                 		  (		2		,	'H214325'	,	1		,	150000000	, '2019-06-13'	,  '2019-07-15'		,	  1		, 	 NULL  	,	'Thanh Hóa' 	),      -- 2                                                                                                       
                 		  (		3		,	'H214335'	,	1		,	300000000	, '2019-10-22'	,  '2019-11-22'		,	  1		,	 NULL  	,	'Hưng yên'  	),      -- 3                                                                                                       
                          (		4		,	'N945832'	,	2		,	120000000	, 	 NULL		,  		NULL		,	  2		,	 NULL  	,	'Nghệ An'   	),      -- 4                                                                                                       
                          (		5		,	'T028543'	,	2		,	220000000	, '2019-08-19'	,  '2019-10-15'		,	  1		,	 NULL  	,	'Bình Định' 	),      -- 5                                                                                                       
                          (		6		,	'T483492'	,	1		,	320000000	, '2020-02-26'	,  '2020-03-15'		,	  1		,	 NULL  	,	'Hà Nội'   		),      -- 6                                                                                                       
                          (		7		,	'H036548'	,	1		,	220000000	, '2020-01-16'	,  '2020-04-10'		,	  1		,	 NULL  	,	'Hưng yên'  	),      -- 7                                                                                                       
                          (		8		,	'H214325'	,	3		,	150000000	,	 NULL		,  		NULL  		,	  2		,	 NULL  	,	'Đà Nẵng'   	),      -- 8                                                                                                       
                          (		9		,	'H214335'	,	1		,	300000000	, '2019-01-15'	,  '2019-03-23'		,	  1		,	 NULL  	,	'Hà Nội'   		),      -- 9
                          (		10		,	'N945832'	,	2		,	220000000	, '2020-02-26'	,  '2020-04-11'		,	  1		,	 NULL  	,	'Hà Nội'   		);      -- 10
                          





 