-- Create FresherManagement Database--
DROP DATABASE IF EXISTS FresherManagement;
CREATE DATABASE IF NOT EXISTS  FresherManagement;
USE 						FresherManagement;

-- Create Trainee table--
DROP TABLE IF EXISTS Trainee;
CREATE TABLE		Trainee (
    Trainee_id 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Full_name			NVARCHAR(100) NOT NULL,
    Birth_day			DATE NOT NULL,
    Gender				ENUM('Male','Female','Unknown') NOT NULL,
    ET_IQ				TINYINT UNSIGNED NOT NULL CHECK ( ET_IQ <= 20) ,
    ET_Gmath 			TINYINT UNSIGNED NOT NULL CHECK (ET_Gmath <=20 ),
    ET_English			TINYINT UNSIGNED NOT NULL CHECK (ET_English <= 50) ,
    Training_Class      CHAR(10) NOT NULL,
    Evalution_Notes  	TEXT 
);
ALTER TABLE Trainee
    ADD VTI_Account     VARCHAR(50) NOT NULL UNIQUE KEY;
    
-- Question 1: 
INSERT INTO       Trainee     (    Full_name      ,    Birth_day      ,  Gender   ,  ET_IQ  , ET_Gmath, ET_English, Training_Class , Evalution_Notes ,  VTI_Account )
VALUES                     ( 'Nguyễn Thị Mai'     ,   '1997-11-27'    , 'Male'    ,    5    ,    5    ,     10    , 'VTI_Tester' ,'Tiếp thu nhanh' , 'mai.nguyenthi@vti.com.vn' ),    -- 1
                            ( 'Đoàn Văn Hải'      ,   '1995-03-12'    , 'Unknown' ,    10   ,    10   ,     40    , 'VTI_JAVA'   , 'Chăm học'      , 'hai.doanvan@vti.com.vn'   ),    -- 2
							( 'Phạm Văn Minh'     ,   '1995-05-13'    , 'Female'  ,    16   ,    18   ,     30    , 'VTI_Tester' , 'Có cố gắng'    , 'minh.phamvan@vti.com.vn'  ),    -- 3
						    ( 'Đinh Thu Trang'    ,   '1998-11-17'    , 'Male'    ,    15   ,    10   ,     40    , 'VTI_JAVA'   , 'Tiếp thu nhanh', 'trang.dinhthu@vti.com.vn' ),    -- 4
                            ( 'Đặng Thanh Phương' ,   '1996-09-10'    , 'Unknown' ,    10   ,    19   ,     39    , 'VTI_JAVA'   , 'Có cố gắng'    , 'phuong.dangthanh@vti.com.vn'),  -- 5
                            ( 'Phùng Văn Tùng'    ,   '1994-12-12'    , 'Female'  ,    13   ,    19   ,     47    , 'VTI_Tester' , 'Tiếp thu nhanh', 'tung.phungvan@vti.com.vn'),     -- 6
                            ( 'Lê Thị Tuyết'      ,   '1996-09-19'    , 'Male'    ,    7    ,    1    ,     15    , 'VTI_JAVA'   , ' Chăm học'     , 'tuyet.lethi@tia.com.vn'  ),     -- 7
                            ( 'Nguyễn Kim Oanh'   ,   '1994-12-19'    , 'Male'    ,    18   ,    15   ,     39    , 'VTI_Tester' , 'Có cố gắng'    , 'oanh.nguyenki,@vti.cm.vn'),     -- 8
                            ( 'Nguyễn Văn Hải'    ,   '1996-08-20'    , 'Female'  ,    10   ,    19   ,     48    , 'VTI_JAVA'   , 'Còn lười học'  , 'hai.nguyenvan@vti.com.vn'),     -- 9
                            ('Đinh Thùy Dung'     ,   '1994-11-28'    , 'Unknown' ,    19   ,    18   ,     43    , 'VTI_Tester' , 'Cần cố gắng hơn', 'dung.dinhthuy@vti.com.vn');    -- 10
    

-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào nhóm chúng thành các tháng sinh khác nhau

SELECT 		MONTH(Birth_day), GROUP_CONCAT(Full_name)
FROM		Trainee  
GROUP BY 	MONTH(Birth_day);

-- Question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau: tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)
SELECT 		* ,LENGTH(Full_name)
FROM    	 Trainee 
WHERE   	 LENGTH(Full_name) = (SELECT MAX(LENGTH(Full_name)) FROM Trainee) ; 

-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là những người 
            -- đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau: 
			--  ET_IQ + ET_Gmath>=20
			--  ET_IQ>=8
			--  ET_Gmath>=8
			--  ET_English>=18

SELECT 		 *
FROM 		Trainee
WHERE 		(ET_IQ + ET_Gmath)>=20 
	AND 	ET_IQ>=8
    AND 	ET_Gmath>=8 
    AND 	ET_English>=18;

  -- Question 5: xóa thực tập sinh có TraineeID = 3
   
DELETE FROM		 Trainee
WHERE 			Trainee_id ='3' ; 

-- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật thông tin vào database
   UPDATE 		Trainee
   SET  		Training_Class ='Lớp_2'
   WHERE 		Trainee_id =3 ;





