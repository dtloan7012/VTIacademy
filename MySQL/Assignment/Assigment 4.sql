DROP DATABASE IF EXISTS 		Testing ;
CREATE DATABASE IF NOT EXISTS   Testing;
USE								Testing;

-- Create Department table 
DROP TABLE IF EXISTS  Department;
CREATE TABLE IF NOT EXISTS  Department (
			Deparment_id 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            Deparment_name 		 	VARCHAR(50) NOT NULL
);

-- Create Employee table
DROP TABLE IF EXISTS  Employee ;
CREATE TABLE IF NOT EXISTS  Employee (
			Employee_id			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			Employee_Name		VARCHAR(50) NOT NULL,
            Deparment_id		TINYINT UNSIGNED NOT NULL ,
            FOREIGN KEY (Deparment_id) REFERENCES Department(Deparment_id)
);

-- Create  Skill table
DROP TABLE IF EXISTS  			Skill ;
CREATE TABLE IF NOT EXISTS 		Skill (
		Skill_id			TINYINT	UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
        Skill_Name			VARCHAR(20) NOT NULL
);

-- Create Employee_Skill table
DROP TABLE IF EXISTS  Employee_Skill;
CREATE TABLE IF NOT EXISTS  Employee_Skill (
			Skill_id			TINYINT	UNSIGNED NOT NULL ,
			Employee_id			TINYINT UNSIGNED NOT NULL,
			`Date Registered`   DATETIME DEFAULT NOW() NOT NULL, 
            PRIMARY KEY (Skill_id, Employee_id),
            FOREIGN KEY (Employee_id)   REFERENCES Employee (Employee_id),
            FOREIGN KEY (Skill_id)  	REFERENCES 	Skill (Skill_id)
);

USE			Testing ;
INSERT INTO			Department (Deparment_name)
VALUES						  ( 'Marketing'       	),        -- 1
							  ( 'sale'            	),        -- 2
							  ( 'Manager'         	),        -- 3
                              ( 'Accounting'      	),        -- 4
                              ( 'Administration'  	),        -- 5
                              ( 'Training'        	),        -- 6
                              ('Finance'		  	),		  -- 7
							  ('IT'				  	 ),	      -- 8
							  ('Legal'               ),		  -- 9
							 ('Office Administration');		  -- 10	
                             
INSERT INTO			Employee (		 Employee_Name	 , 	Deparment_id)
VALUES						 (  'Nguyen Thi Mai'     ,  	5	    ),         -- 1           
                             (  'Dang Thanh Phuong' ,       3		),         -- 2
							 ( 	'Nguyen Kim Oanhhhh' , 		4		),         -- 3
							 ( 	'Phung Van Tung'     ,      6		),         -- 4
                             (  'Dinh Thu Trang'     ,  	4		),         -- 5
                             (  'Nguyen Van Hai'     ,  	2		),         -- 6
                             (  'Do Manh Hung'       ,  	4		),         -- 7
                             (  'Dang Thuy Linh'     ,  	1		),         -- 8
                             (  'Dinh Thu Loan'      ,  	5		),         -- 9
                             (   'Tran Thanh Ha'     , 		2		);         -- 10	
                             
INSERT INTO			Skill 	(  Skill_Name  )				
VALUES					   	(    'JAVA'      ),				-- 1     
							(     'NET'      ),             -- 2
							(     'Ruby'     ),             -- 3
							(    'Postman'   ),             -- 4
							(     'HTML'     ),             -- 5
							(     'CSS'		 ),             -- 6
							( 'JavaScript'   ),             -- 7
							( 'C++ '         ),             -- 8
							( 'Ruby là gì'   );             -- 9
                                                            
INSERT INTO		Employee_Skill( Employee_id		 , Skill_id ) 
VALUES						 	( 		1	    ,    3		),
								( 		2	    ,    1		),
								( 		3	    ,    5		),
								( 		1	    ,    1		),
								( 		5	    ,    4		),                           
                                ( 		2	    ,    2		),                            
                                ( 		7	    ,    1		),                            
                                ( 		8	    ,    3		),
                                ( 		5	    ,    2		),
                                ( 		1	    ,    6		);
                                
 USE				Testing;


-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java    
SELECT 		e.Employee_id, e.Employee_Name, s.Skill_Name
FROM		Employee e 
JOIN		Employee_Skill es  ON  e.Employee_id = es.Employee_id
JOIN		Skill s  		   ON  es.Skill_id = s.Skill_id
WHERE		s.Skill_Name = 'Java' ;

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >=2 nhân viên  
SELECT			d.Deparment_id, d.Deparment_name , GROUP_CONCAT(Employee_Name, " ") AS Employee_Name , COUNT(Employee_id)
FROM   			Department d 
JOIN			Employee e 		ON  d.Deparment_id = e.Deparment_id
GROUP BY    	d.Deparment_id 
HAVING         COUNT(Employee_id) >= 2 ; 


-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.   
SELECT 			d.Deparment_id, d.Deparment_name , GROUP_CONCAT(Employee_Name, " ") AS Employee_Name , COUNT(Employee_id)
FROM			Department d
JOIN			Employee e 	ON		d.Deparment_id = e.Deparment_id
GROUP BY		d.Deparment_id
ORDER BY 		COUNT(Employee_id) ASC;  

-- Question 6:  Viết lệnh để lấy ra danh sách nhân viên có > 1 skills. 
SELECT			e.Employee_Name, COUNT(Skill_id)
FROM			Employee e
JOIN			Employee_Skill es	ON	e.Employee_id = es.Employee_id
GROUP BY 		e.Employee_Name
HAVING			COUNT(Skill_id) > 1 ; 


                               
                                
                                                   
                                    


