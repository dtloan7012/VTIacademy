-- Create THỰC TẬP Database
DROP DATABASE IF EXISTS  		Thuc_tap;
CREATE DATABASE IF NOT EXISTS	Thuc_tap;
USE								Thuc_tap;

-- Create KHOA tabele
DROP TABLE IF EXISTS 		KHOA;
CREATE TABLE IF NOT EXISTS  KHOA (
		Ma_khoa 		VARCHAR(50) NOT NULL PRIMARY KEY,
		Ten_khoa  		NVARCHAR(50) NOT NULL,
        So_dien_thoai 	CHAR(50) NOT NULL UNIQUE KEY 
);

-- Create GIANG VIEN table
DROP TABLE IF EXISTS 	Giang_vien;
CREATE TABLE IF NOT EXISTS Giang_vien (
		Ma_giang_vien    TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        Full_name_gv	 VARCHAR(50) NOT NULL,
        Luong			 FLOAT ,
        Ma_khoa			 VARCHAR(50) NOT NULL,
        FOREIGN KEY (Ma_khoa) REFERENCES KHOA(Ma_khoa)
);

-- Create SINH_VIEN table
DROP TABLE IF EXISTS   		Sinh_vien;
CREATE TABLE IF NOT EXISTS  Sinh_vien (
		Ma_sv			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        Fullname_sv		NVARCHAR(50) NOT NULL,
		Ma_khoa			VARCHAR(50) NOT NULL,
        Nam_sinh		DATE NOT NULL,
        Que_quan		NVARCHAR(50) NOT NULL,
        FOREIGN KEY(Ma_khoa) REFERENCES KHOA(Ma_khoa) 
);		

-- Create De_tai table
DROP TABLE IF EXISTS  		De_tai;
CREATE TABLE IF NOT EXISTS 	De_tai (
		Ma_detai		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        Ten_dt			NVARCHAR(100) NOT NULL,
        Kinh_phi		FLOAT,
        Noi_thuc_tap	NVARCHAR(200) NOT NULL
);

-- Create Huong_dan table
DROP TABLE IF EXISTS Huong_dan;
CREATE TABLE IF NOT EXISTS  Huong_dan (
		Ma_sv				TINYINT UNSIGNED NOT NULL ,
        Ma_giang_vien 		TINYINT UNSIGNED NOT NULL ,
        Ma_detai			TINYINT UNSIGNED NOT NULL ,	
        Ket_qua             TINYINT UNSIGNED NOT NULL,
		PRIMARY KEY (Ma_sv, Ma_giang_vien ,Ma_detai),
        FOREIGN KEY (Ma_sv) REFERENCES Sinh_vien (Ma_sv),
		FOREIGN KEY (Ma_giang_vien) REFERENCES Giang_vien(Ma_giang_vien),
		FOREIGN KEY (Ma_detai) REFERENCES De_tai(Ma_detai)
);      

USE  				Thuc_tap ;
 -- Create KHOA tabele
 INSERT INTO 		KHOA (	Ma_khoa , 			Ten_khoa , 		 So_dien_thoai 	)
 VALUES					( 'V001'	, 'CONG NGHE THONG TIN'		, '+08212271158' ),			-- 1
						( 'V002' 	, 'QUAN TRI DOANH NGHIEP'	, '+08243723465' ),         -- 2
                        ( 'V003'	, 'KE TOAN'					, '+08265332433' ),			-- 3
                        ( 'V004'	, 'DIA LI'					, '+08454363348' ),			-- 4
                        ( 'V005'	, 'LICH SU'					, '+08212124338' ),  		-- 5
                        ( 'V006'	, 'QUAN LY TAI NGUYEN'		, '+08216763258' ),			-- 6
                        ( 'V007'	, 'CONG NGHE SINH HOC'		, '+08210987132' ),			-- 7
                        ( 'V009'	, 'QUAN LY HANH CHINH'		, '+08212223466' ),			-- 8
                        ( 'V010'	, 'HANH CHINH NHAN SU'		, '+08214234323' ),			-- 9
                        ( 'V008'	, 'NHAN SU TONG HOP'		, '+08214315632' );			-- 10
                        
-- Create Giang_vien table 
INSERT INTO   	Giang_vien (	 Full_name_gv 		,	Luong	    ,	Ma_khoa	)			
VALUES						( 'Nguyen Thi Mai'     ,  	3000000		, 	'V001'	),          -- 1
                            (  'Dang Thanh Phuong ',	2300000		,	'V002'	),          -- 2
							( 'Nguyen Kim Oanhhhh' ,	3500000		,	'V001'	),          -- 3
							( 'Phung Van Tung'     ,	6500000		,	'V004'	),          -- 4
							('Dinh Thu Trang'      ,	3250000		,	'V001'	),          -- 5
							('Nguyen Van Hai'      ,	3340000		,	'V006'	),          -- 6
							('Do Manh Hung'        ,	3475000		,	'V003'	),          -- 7
							('Dang Thuy Linh'      ,	3023000		,	'V002'	),          -- 8
							('Dinh Thu Loan'       ,	1120000		,	'V008'	),          -- 9
							( 'Tran Thanh Ha'	   ,	3250000		,	'V008'  );			-- 10
                            
         -- Create De_tai table 
	INSERT INTO   Sinh_vien	(	Fullname_sv			,	Ma_khoa	,	Nam_sinh	,	Que_quan	)
	VALUES					('Đinh Thu Loan'		,  'V001'	, '1996-07-28'	, 'HÀ NỘI'		),   	  -- 1
							('Lê Thị Hà Trang'		,  'V004'	, '1995-11-19'	, 'HÀ NỘI'		),        -- 2
							('Phan Văn Đức'			,  'V007'	, '1998-04-25'	, 'HẢI DƯƠNG'	),        -- 3
                            ('Phạm Thị Phương'		,  'V006'	, '1997-09-11'	, 'QUẢNG BÌNH'	),        -- 4
                            ('Nguyễn Văn Đức'		,  'V001'	, '1995-12-22'	, 'ĐÀ NẴNG'		),        -- 5
                            ('Trịnh Văn Hòa'		,  'V004'	, '1996-04-19'	, 'THANH HÓA'	),        -- 6
                            ('Nguyễn Quỳnh Trang'	,  'V008'	, '1994-08-14'	, 'NGHỆN AN'	),        -- 7
                            ('Nguyễn Văn Hải'		,  'V003'	, '1994-12-21'	, 'HẢI PHÒNG'	),        -- 8
                            ('Phạm Hồng Phước'		,  'V010'	, '1993-09-24'	, 'THANH HÓA'	),        -- 9
                            ('Lê Văn Sơn'			,  'V002'	, '1994-10-19'	, 'NGHỆ AN'		);        -- 10

      
   -- Create De_tai table 
  INSERT INTO 		De_tai (	Ten_dt 									,	Kinh_phi	,	Noi_thuc_tap)
  VALUES			    	( 'Ứng dụng của CNTT trong đời sống'		,  	1200000		, 'Công nghệ FPT' 			),		-- 1
							( 'Kinh tế thị trường-hàng hóa'				,  	2340000		, 'Công ty TNHH Cherry' 	),       -- 2
                            ( 'Xây dựng hệ thống viễn thông'			,  	1110000		, 'Công ty TNHH Namek' 		),       -- 3
							( 'Nhu cầu khách hàng hàng khi cư trú'		,  	8800000		, 'Khách sạn Reiwa' 		),       -- 4
                            ( '1000 năm Thăng Long-Hà Nội'				,  	8700000		, 'Bảo tàng lịch sử dân tộc'),       -- 5
                            ( 'Quản lí tài nguyên-môi trường hợp lý'	,  	6700000		, 'Cục quản lí MT Hà Nội' 	),       -- 6
                            ( 'Phát triển sản xuất các loại kháng virut',  	5600000		, 'Bệnh viện Quân đội' 		),       -- 7
                            ( 'Quản lí hành chính trong công ty'		,  	3400000		, 'Công ty TNHH Thành Đô' 	),       -- 8
                            ( 'Các bước phỏng vấn nhân sự trong công ty',  	2200000		, 'Công ty TNHH VTI' 		),       -- 9
                            ( 'Hoạt động thanh toán thẻ tại Vietcombank',  	1110000		, 'Ngân hàng Vietcombank'	);       -- 10
      
      
   -- Cerate Huong_dan table 
   INSERT INTO   	Huong_dan(	Ma_sv	,	Ma_giang_vien,	Ma_detai, Ket_qua	)			  
   VALUES					(   1    	,		3		 ,    2     ,	78		),            -- 1
							(   5    	,		10		 ,    1     ,	90		),            -- 2
                            (   4    	,		8		 ,    5     ,	98		),            -- 3
                            (   2    	,		2		 ,    6     ,	88		),            -- 4
                            (   6    	,		5		 ,    4     ,	90		),            -- 5
                            (   7    	,		5		 ,    4     ,	78		),            -- 6
                            (   8    	,		7		 ,    9     ,	60		),            -- 7
                            (   3    	,		4		 ,    3     ,	67		),            -- 8
							(   10    	,		9		 ,    7     ,	0		),            -- 9                                         -- 10
							(   2    	,		3		 ,    2     ,	88		);            -- 10                     








