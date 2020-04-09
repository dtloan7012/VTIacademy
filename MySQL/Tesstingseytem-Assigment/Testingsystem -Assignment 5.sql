USE   			Testingsyetem ;

-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale  
CREATE VIEW 	 V_Department AS
SELECT			d.Department_name,GROUP_CONCAT(a.Fullname) , COUNT(Account_id)
FROM  			Department d
JOIN		 	`Account` a 	ON	d.Department_id = a.Department_id 
WHERE  			d.Department_name = 'sale'
GROUP BY 		d.Department_id ;

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất  
CREATE VIEW  	V_Account  AS
SELECT			a.Account_id, a.Email, a.Fullname, a.Department_id , COUNT(Group_id)
FROM			`Account` a 
JOIN			GroupAccount ga  ON		a.Account_id = ga.Account_id
GROUP BY		 a.Account_id  
HAVING  		COUNT(Group_id) = (SELECT			COUNT(Group_id)
									FROM			`Account` a 
									JOIN			GroupAccount ga  ON		a.Account_id = ga.Account_id
									GROUP BY		 a.Account_id  
									ORDER BY  		COUNT(Group_id) DESC LIMIT 1);
COMMIT ;																		
-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 14 từ được coi là quá dài) và xóa nó đi
DROP VIEW IF EXISTS 	V_Question;
CREATE VIEW  			V_Question   AS
SELECT  				Question_id, LENGTH(Content)
FROM            		Question
WHERE 					LENGTH(Content) > 12 ;

SELECT * FROM 			V_Question;

DELETE 					a 
from					 answer a
JOIN  					V_Question vq 	ON   a.Question_id = vq.Question_id ;

DELETE 				  q
FROM   				  Question q
JOIN				  V_Question vq ON vq.Question_id = q.Question_id;

ROLLBACK;							


-- Question 4:  Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất 
DROP VIEW IF EXISTS  V_Department_nhieu_nhan_vien_nhat;
CREATE VIEW			 V_Department_nhieu_nhan_vien_nhat AS	
SELECT     			g.Group_id,g.Group_name, COUNT(ga.Account_id)
FROM			 	`Group`  g 
JOIN		  	 	GroupAccount ga 	ON   g.Group_id = ga.Group_id
GROUP BY       		g.Group_name
HAVING  			COUNT(ga.Account_id) = (SELECT 		COUNT(ga.Account_id)
										FROM			 `Group`  g 
										JOIN		   GroupAccount ga 	ON   g.Group_id = ga.Group_id
										GROUP BY       g.Group_name 
										ORDER BY   		COUNT(ga.Account_id)  DESC LIMIT 1);

-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyen  tạo 
DROP VIEW IF EXISTS W_Question ;
CREATE  VIEW 		Question  AS
SELECT   	 GROUP_CONCAT(q.Content," "), a.Fullname
FROM     	`Account` a
JOIN		Question q 	ON	q.Creator_id = a.Account_id
WHERE		Fullname 	LIKE  'Nguyen%' 
GROUP BY 	Account_id ;

