USE 				Testingsyetem; 

-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ 
SELECT 		a.Account_id, a.Fullname, a.Department_id, d.Department_name 
FROM  		`Account` a
JOIN 		Department d ON a.Department_id = d.Department_id ; 

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010 
SELECT 			Account_id, Fullname, Create_date, Department_id
FROM			`Account`
WHERE 			Create_date > '2010-12-20'; 

-- Question 3: Viết lệnh để lấy ra tất cả các developer  
   
   SELECT 
    a.Fullname, p.Position_name
FROM
    `account` a
        JOIN
    `Position` p ON a.Position_id = p.Position_id
WHERE
    Position_name = 'developer';
   
   -- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >=3 nhân viên 

SELECT  d.Department_name, d.Department_id, COUNT(Account_id) AS So_nhan_vien
FROM 			Department d
JOIN 			`Account` a	 ON  d.Department_id = a.Department_id
GROUP BY 		d.Department_id 
HAVING          COUNT(Account_id) >= 3 ;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất 
SELECT q.Content, COUNT(eq.Question_id)
FROM  ExamQuestion eq
join  Question q ON   q.Question_id =eq.Question_id
group by eq.Question_id
HAVING COUNT(eq.Question_id) = (SELECT COUNT(eq.Question_id)
								FROM  ExamQuestion eq
								join  Question q ON   q.Question_id =eq.Question_id
								group by eq.Question_id 
								ORDER BY COUNT(eq.Question_id) DESC
								LIMIT 1);
                                
                                
-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question 
SELECT 			c.Category_name,q.Content, COUNT(c.Category_id)
FROM 			CategoryQuestion c
JOIN			Question q 		ON		c.Category_id =q.Category_id
GROUP BY		Content ;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT 		 Question_id, COUNT(e.Exam_id) 
FROM		Exam e
JOIN		ExamQuestion eq ON  e.Exam_id = eq.Exam_id
GROUP BY 	Question_id ; 

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất 
SELECT 		q.Question_id, q.Content, COUNT(Answer_id)
FROM 		Question q
JOIN		Answer a  ON	q.Question_id  =  a.Question_id
GROUP BY    q.Question_id
HAVING COUNT(Answer_id) = (
							SELECT COUNT(Answer_id) 
							FROM 		Question q
							JOIN		Answer a  ON	q.Question_id  =  a.Question_id
							GROUP BY    q.Question_id 
							ORDER BY   COUNT(Answer_id) DESC LIMIT 1
							);
-- Question 9: Thống kê số lượng account trong mỗi group 
SELECT		g.Group_id, g.Group_name, COUNT(Account_id)
FROM		`Group` g
LEFT JOIN 		GroupAccount ga  ON 	g.Group_id = ga.Group_id
GROUP BY  	g.Group_id;


-- Question 10: Tìm chức vụ có ít người nhất  

SELECT  		p.Position_id, p.Position_name, COUNT(Account_id)
FROM			`Position` p 
JOIN			`Account` a  ON		p.Position_id = a.Position_id
GROUP BY		p.Position_id
HAVING  		COUNT(Account_id) = ( SELECT  		 COUNT(Account_id)
									FROM			`Position` p 
									JOIN			`Account` a  ON		p.Position_id = a.Position_id
									GROUP BY		p.Position_id
									ORDER BY     	COUNT(Account_id) ASC LIMIT 1
																		);					
 -- Question 11: thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM 
SELECT 			d.Department_name,p.Position_name, GROUP_CONCAT(a.Fullname), COUNT(p.Position_id)
FROM			Department d 
JOIN			`Account` a  ON	 d.Department_id = a.Department_id
JOIN			`Position`p  ON  a.Position_id = p.Position_id
GROUP BY  		d.Department_id, p.Position_name ;

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, 
-- loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, … Question 
SELECT		q.Question_id, q.Content, tq.Type_name, an.Content, a.Account_id, a.Fullname 
FROM		Question q
JOIN 		TypeQuestion tq 	ON	q.Type_id = tq.Type_id
JOIN		Answer an    	ON an.Question_id = q.Question_id
JOIN		 `Account` a		ON	a.Account_id = 	q.Creator_id;	


-- Question 13: lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm 
SELECT 			Type_name, COUNT(Question_id)  
FROM			TypeQuestion tq
JOIN			Question q ON	tq.Type_id =q.Type_id
WHERE			tq.Type_name = 'Essay' OR Type_name = 'Multiple-Choice'  
GROUP BY 		tq.Type_name ;

-- Question 14: lấy ra group không có account nào 
SELECT 			g.Group_name, Account_id
FROM			`Group` g
LEFT JOIN		GroupAccount ga ON  g.Group_id = ga.Group_id
WHERE       	a.Account_id  IS NULL
GROUP BY    	g.Group_name;

-- Question 16: lấy ra question không có answer nào 
SELECT		   q.Question_id, q.Content, a.Answer_id
FROM			Question q
LEFT JOIN		Answer a    ON  q.Question_id = a.Question_id
WHERE			a.Answer_id IS NULL
GROUP BY        q.Content ;


-- Question 17:  a) Lấy các account thuộc nhóm thứ 1
			  -- b) Lấy các account thuộc nhóm thứ 2 
			  -- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau  
SELECT			ga.Group_id, a.Fullname, a.Email, a.Account_id	 
FROM			 `Account` a 
JOIN			GroupAccount  ga  ON  a.Account_id = ga.Account_id
WHERE           ga.Group_id = 1
GROUP BY 		a.Fullname
UNION  
SELECT			ga.Group_id, a.Fullname, a.Email, a.Account_id	 
FROM			 `Account` a 
JOIN			GroupAccount  ga  ON  a.Account_id = ga.Account_id
WHERE           ga.Group_id = 2
GROUP BY 		a.Fullname ;

-- Question 18:  a) Lấy các group có lớn hơn 2 thành viên
			  -- b) Lấy các group có nhỏ hơn 5 thành viên 
			  -- c) Ghép 2 kết quả từ câu a) và câu b) 
SELECT     	g.Group_id, g.Group_name, COUNT(ga.Account_id)
FROM		`Group` g 
JOIN		 GroupAccount ga   ON  g.Group_id = ga.Group_id 
GROUP BY  	 g.Group_id 
HAVING        COUNT(ga.Account_id) > 2
UNION 
SELECT     	g.Group_id, g.Group_name, COUNT(ga.Account_id)
FROM		`Group` g 
JOIN		 GroupAccount ga   ON  g.Group_id = ga.Group_id 
GROUP BY  	 g.Group_id 
HAVING        COUNT(ga.Account_id)  < 5 ;


