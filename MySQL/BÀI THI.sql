-- Create Student_grades_management Databese--
DROP DATABASE IF EXISTS Student_grades_management;
CREATE DATABASE  		Student_grades_management;
USE 					Student_grades_management;

-- Create Student Table --
DROP TABLE IF EXISTS         Student ;
CREATE  TABLE IF NOT EXISTS  Student  (
		StudentID    	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        `Name`			NVARCHAR(30) NOT NULL,
        Age  			TINYINT UNSIGNED NOT NULL,
        Gender		    ENUM('Female','Male','UNKNOW')	
);



	-- Create Subject Table --
DROP TABLE IF EXISTS         `Subject` ;
CREATE  TABLE IF NOT EXISTS  `Subject` (
		SubjectID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        Subject_Name	NVARCHAR(50) NOT NULL
);


-- Create StudentSubject Table --
DROP TABLE IF EXISTS         StudentSubject ;
CREATE  TABLE IF NOT EXISTS  StudentSubject (
		StudentID		TINYINT UNSIGNED NOT NULL, 
        SubjectID		TINYINT UNSIGNED NOT NULL,
        Mark			TINYINT UNSIGNED NOT NULL,
        `Date`			DATE NOT NULL,
        PRIMARY KEY (StudentID ,SubjectID),
        FOREIGN KEY (StudentID) REFERENCES Student (StudentID),
        FOREIGN KEY (SubjectID) REFERENCES `Subject`  (SubjectID)
);


INSERT INTO   Student (  `Name`				,	 Age		,	Gender )
VALUES				 ( 'Nguyen Thi Mai'  	,    22			,   'Female'    ),
                     (  'Dang Thanh Phuong'  ,	 22			,   'UNKNOW'),
					(	'Nguyen Kim Oanhhh'  ,    22		,   'Female'    ),
                    (   'Phung Van Tung'     ,    22		,   'Male'    );
                    
 INSERT INTO `Subject` (    Subject_Name )                 
 VALUES					(    'Toán'     ),
						(    'Văn'      ),  
						(    'Anh'      ),
                        (    'Lịch sử'	);
                        
                        
 INSERT INTO    StudentSubject (  StudentID	,  SubjectID ,   Mark   ,    `Date`	 )
 VALUES						   (     1		,		1	 ,    1	, '2020-01-02'),
								(    2		,		2	 ,    8		, '2020-01-02'),
                                (    3		,		1	 ,    2		, '2020-01-02'),
                                (    4		,		1	 ,    10	, '2020-01-02'),
                                (    1		,		2	 ,    9		, '2020-01-02'),
                                (    4		,		3	 ,    10	, '2020-01-02');
                                

/**b) Viết lệnh để
 a. Lấy tất cả các môn học không có bất kì điểm nào 
 b. Lấy danh sách các môn học có ít nhất 2 điểm ***/
 
 -- a. Lấy tất cả các môn học không có bất kì điểm nào
SELECT 			s.SubjectID,s.Subject_Name
FROM		    `Subject` s 
LEFT JOIN	    StudentSubject ss ON s.SubjectID = ss.SubjectID
WHERE       	ss.StudentID IS NULL
GROUP BY    	s.SubjectID;

-- b. Lấy danh sách các môn học có ít nhất 2 điểm 

SELECT 			s.SubjectID,s.Subject_Name,COUNT(ss.Mark)
FROM			`Subject` s 
JOIN		 	StudentSubject ss ON s.SubjectID = ss.SubjectID
GROUP BY    	s.SubjectID
HAVING      	COUNT(ss.Mark) >=2 ;


/***c) Tạo "StudentInfo" view có các thông tin về học sinh bao gồm: RN,sID,Name, Age, Gender, sName, Mark, Date.
 Với cột Gender show Male để thay thế cho 0, Female thay thế cho 1 và Unknow thay thế cho null **/
 CREATE VIEW  V_Student_information AS 
		 SELECT   st.StudentID, sb.SubjectID,st.Age, st.`Name`,
				  st.Gender,sb.Subject_Name, ss.Mark, ss.`Date`  , CASE
														WHEN Gender = 'Male' THEN  0
														WHEN Gender = 'Female' THEN 1
														END AS C_Gender
		 FROM	  	Student 	st 
		 JOIN		Studentsubject ss 	ON  st.StudentID = ss.StudentID
		 JOIN		`Subject` sb	  	ON  sb.SubjectID = ss.SubjectID 
		 GROUP BY st.StudentID;
 COMMIT ;
 
 
 /*** d) Tạo trigger cho table Subject: 
 a. Trigger CasUpdate: khi thay đổi data của cột sID, thì giá trị của cột sID của table StudentSubject cũng thay đổi theo 
 b. Trigger casDel: Khi xóa 1 student, các dữ liệu của table StudentSubject cũng sẽ bị xóa theo e ***/
 
DELETE 
FROM  `Subject`
WHERE SubjectID = 
 /***b. Trigger casDel: Khi xóa 1 student, các dữ liệu của table StudentSubject cũng sẽ bị xóa theo e ***/
DROP TRIGGER IF EXISTS Trigger_casDel
   DELIMITER $$ 
	CREATE TRIGGER  Trigger_casDel
	BEFORE  DELETE ON studentsubject
	 FOR EACH ROW 
		BEGIN 
				DELETE 
                FROM studentsubject
			    WHERE SubjectID = OLD.SubjectID;
	END $$
	DELIMITER ;   



  --  a. Trigger CasUpdate: khi thay đổi data của cột sID, thì giá trị của cột sID của table StudentSubject cũng thay đổi theo  
DROP TRIGGER IF EXISTS  Trigger_CasUpdate 
   DELIMITER $$ 
	CREATE TRIGGER  Trigger_CasUpdate
	ALTER UPDATE ON `Subject` 
	 FOR EACH ROW 
		BEGIN 
				
	  END IF ;
	END $$
	DELIMITER ;   

DELETE 
FROM  `Subject`
WHERE SubjectID = 
                                
                        
                        
                        

