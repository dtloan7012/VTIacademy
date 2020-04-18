USE			Testingsyetem;

-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó 
DROP PROCEDURE IF EXISTS	select_account_dep ;
DELIMITER $$ 
CREATE PROCEDURE  			select_account_dep ( IN in_department_name VARCHAR(100) )
BEGIN	
	SELECT 	 a.Account_id, a.Email, a.Fullname , d.department_id, d.Department_name
    FROM	`account` a
    JOIN	department d	ON		d.department_id = a.department_id 
	WHERE		in_department_name = d.Department_name ;
END $$
DELIMITER ;
-- USING
call testingsyetem.Select_account_dep('sale');


-- Question 2: Tạo store để in ra số lượng account trong mỗi group  
DROP PROCEDURE	IF EXISTS	 get_account_of_each_group ;
DELIMITER $$
CREATE PROCEDURE		get_account_of_each_group ()
BEGIN	
	SELECT	  	g.Group_id,g.Group_name, GROUP_CONCAT(Username), COUNT(a.Account_id) AS So_account
    FROM   		`account` a
    JOIN		groupaccount ga  ON		a.Account_id = ga.Account_id
    JOIN		`group` g		ON		ga.Group_id = g.Group_id
    GROUP BY    g.Group_id ;
END  $$
DELIMITER ;
-- USING
call testingsyetem.get_account_of_each_group();


-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại 
DROP PROCEDURE IF EXISTS  select_type_question ;
DELIMITER $$
CREATE PROCEDURE		select_type_question ()
	BEGIN	
	SELECT		tq.Type_id, tq.Type_name,  q.Content , COUNT(Q.Question_id) AS So_Question
    FROM		typequestion tq
    JOIN		question q		ON 	tq.Type_id = q.Type_id
    WHERE		MONTH(Create_date) = MONTH(NOW())
	GROUP BY 	tq.Type_id ;
END $$
DELIMITER ;

-- USING
call testingsyetem.Select_type_question();


-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất 
DROP PROCEDURE IF EXISTS  	get_typeQuestionID ;
DELIMITER $$
CREATE PROCEDURE 		get_typeQuestionID (OUT Type_QuestionID TINYINT UNSIGNED )
	BEGIN 
    
		SELECT  	Type_id 		 INTO   Type_QuestionID
		FROM 		question
		GROUP BY  	Type_id
		HAVING		COUNT(Question_id) = (SELECT 	   COUNT(Question_id)
							FROM		question  
							GROUP BY 	Type_id	
							ORDER BY   COUNT(Question_id)  	DESC LIMIT 1 ) ; 
	END $$
DELIMITER ;
-- USING 
 set @Type_QuestionID = 3;
call testingsyetem.get_typeQuestionID(@Type_QuestionID);
select @Type_QuestionID;

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question  
	SET 		@Type_QuestionID = 0 ;
    CALL 		get_typeQuestionID (@Type_QuestionID);
    SELECT 		Type_name
    FROM		typequestion
    WHERE 		Type_id = @Type_QuestionID ;

/* Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên chứa chuỗi của người dùng nhập vào 
hoặc trả về user có name chứa chuỗi của người dùng nhập vào */

 DROP PROCEDURE IF EXISTS   P_Account_name
 DELIMITER $$
 CREATE PROCEDURE P_Account_name (IN In_Search NVARCHAR(100))
 BEGIN  
	SELECT 		Group_name, NULL AS Username
    FROM  		`group`
    WHERE  		Group_name LIKE CONCAT( '%' ,In_Search, '%' )
	UNION  
    SELECT 		 NULL AS Group_name, Username
    FROM		`account`
    WHERE		Username LIKE CONCAT('%' ,In_Search,'%' ) ;
END $$
DELIMITER ;    
-- USING 
CALL     P_Account_name('h') ; 
    
    
 /*Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và trong store sẽ tự động gán   
		username sẽ giống email nhưng bỏ phần @..mail đi 
		positionID: sẽ có default là developer  
		departmentID: sẽ được cho vào 1 phòng chờ
 Sau đó in ra kết quả tạo thành công */
 
 DROP PROCEDURE IF EXISTS P_user_information
 DELIMITER $$
 CREATE PROCEDURE P_user_information 		(IN in_fullname NVARCHAR(50) , in_email NVARCHAR(50))
	BEGIN 
      DECLARE 	v_User_Name  VARCHAR(50);
      SET		v_User_Name = SUBSTRING_INDEX(Email, '@', 1); 
      
      INSERT INTO `account` ( Email 	, Username 	, Fullname 		, Department_id , Position_id )
      VALUES				( in_email  , v_User_Name,  in_fullname ,   NULL		,	NULL 	  );
    END $$
DELIMITER ;


/**** Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID ****/
DROP PROCEDURE IF EXISTS P_Delete_Exam ;
DELIMITER $$
CREATE PROCEDURE 	P_Delete_Exam  (IN in_ExamID TINYINT UNSIGNED )
	BEGIN 
		DELETE 
		FROM 		Exam
		WHERE   Exam_id = in_ExamID;
     END $$
DELIMITER ;

CALL    P_Delete_Exam ('') ;

/****Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng nhập vào tên phòng ban
 và các account thuộc phòng ban đó sẽ được chuyển về phòng ban default là phòng ban chờ việc ****/
 DROP PROCEDURE IF EXISTS delete_department;
DELIMITER $$
CREATE PROCEDURE delete_department( IN in_department_name VARCHAR(50))
BEGIN
	UPDATE `Account`
	SET Department_id = NULL
	WHERE Department_id = (SELECT Department_id FROM Department WHERE Department_id = in_department_name);

	DELETE FROM Department
	WHERE Department_id = in_department_name;

 END$$
DELIMITER ;

-- USING 
CALL select_type_question() ;


/**** Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay ****/
DROP PROCEDURE IF EXISTS   Get_Month_of_Question
DELIMITER $$
CREATE PROCEDURE  Get_Month_of_Question ()
	BEGIN
			WITH 	Get_Month AS (
			SELECT  `MONTH`
			FROM (
					SELECT 1  AS `MONTH`
					UNION SELECT 2	AS `MONTH`
					UNION SELECT 3	AS `MONTH`
					UNION SELECT 4 	AS `MONTH`
					UNION SELECT 5	AS `MONTH`
					UNION SELECT 6	AS `MONTH`
					UNION SELECT 7	AS `MONTH`
					UNION SELECT 8	AS `MONTH`
					UNION SELECT 9	AS `MONTH`
					UNION SELECT 10	AS `MONTH`
					UNION SELECT 11	AS `MONTH`  
					UNION SELECT 12	AS `MONTH`) AS Month_in_year) 
				
			SELECT gm.`MONTH` , COUNT(q.Question_id) AS So_Question
			FROM	 Get_Month gm 
			LEFT JOIN   question q   ON  MONTH(Create_date) = gm.`MONTH`
			GROUP BY gm.`MONTH`  
			ORDER BY gm.`MONTH`;
	END $$
DELIMITER ;    
    
