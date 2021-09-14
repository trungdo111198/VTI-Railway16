-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó
DROP PROCEDURE IF EXISTS get_all_account_of_department;
DELIMITER //
CREATE PROCEDURE get_all_account_of_department( IN tenphongban NVARCHAR(50))
	BEGIN
		SELECT * FROM `account`
        JOIN department USING(departmentID)
        WHERE DepartmentName = tenphongban;
	END //
DELIMITER ;
-- Question 2: Tạo store để in ra số lượng account trong mỗi group
DROP  PROCEDURE IF EXISTS account_group;
DELIMITER //
CREATE PROCEDURE account_group()
	BEGIN 
		SELECT GroupID,GroupName,COUNT(CreatorID) account_number  FROM `group`
        JOIN groupaccount USING(GroupID)
        GROUP BY GroupID;
	END //
DELIMITER ;
call testingsystem.account_group();
-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại
DROP PROCEDURE IF EXISTS type_question;
DELIMITER //
CREATE PROCEDURE type_question()
	BEGIN 
		SELECT TypeID,TypeName,COUNT(QuestionID) FROM question
        JOIN typequestion USING(TypeID)
        WHERE month(CreateDate) = month(now()) AND year(CreateDate) = year(now())
        GROUP BY TypeID;
	END //
DELIMITER ;
CALL type_question();
	
-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DROP PROCEDURE IF EXISTS typeID_question;
DELIMITER //
CREATE PROCEDURE typeID_question()
	BEGIN 
		SELECT TypeID,COUNT(QuestionID) MaxQuestion FROM question
        GROUP BY TypeID
        HAVING COUNT(QuestionID) = (SELECT COUNT(QuestionID) FROM question GROUP BY TypeID ORDER BY COUNT(QuestionID) DESC LIMIT 1 );
	END //
DELIMITER ;
CALL typeID_question();
-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
DROP PROCEDURE IF EXISTS typeName_question;
DELIMITER //
CREATE PROCEDURE typeName_question()
	BEGIN 
		SELECT TypeName,COUNT(QuestionID) MaxQuestion FROM question
        JOIN typequestion USING(TypeID)
        GROUP BY TypeID
        HAVING COUNT(QuestionID) = (SELECT COUNT(QuestionID) FROM question GROUP BY TypeID ORDER BY COUNT(QuestionID) DESC LIMIT 1 );
	END //
DELIMITER ;
CALL typeName_question();
-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
-- chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa
-- chuỗi của người dùng nhập vào
DROP PROCEDURE IF EXISTS User_group;
DELIMITER //
CREATE PROCEDURE User_group(IN Nhap_Chuoi VARCHAR(50) )
	BEGIN 
		SELECT g.GroupName 
        FROM `group` g 
        WHERE g.GroupName LIKE CONCAT("%",Nhap_Chuoi,"%")
        UNION
       SELECT a.Username 
       FROM `account` a 
       WHERE a.Username LIKE CONCAT("%",Nhap_Chuoi,"%");
	END //
DELIMITER ;



-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và
-- trong store sẽ tự động gán:
-- username sẽ giống email nhưng bỏ phần @..mail đi
-- positionID: sẽ có default là developer
-- departmentID: sẽ được cho vào 1 phòng chờ
-- Sau đó in ra kết quả tạo thành công

DROP PROCEDURE IF EXISTS get_fullname_email;
DELIMITER // 
CREATE PROCEDURE get_fullname_email(IN fullName NVARCHAR(50), IN email VARCHAR(50))
	BEGIN
		DECLARE username VARCHAR(50);
		DECLARE positionID TINYINT DEFAULT 1;
		DECLARE departmentID TINYINT DEFAULT 11;
		SELECT substring_index(Email,'@',1),DepartmentID,PositionID INTO userName,departmentID,positionID
        FROM `account` 
        WHERE fullName = FullName AND email = Email
        LIMIT 1;
		SELECT username,positionID,departmentID ;
	END //
DELIMITER ;
call testingsystem.get_fullname_email('Tong Quang Anh', 'account1@gmail.com');

-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
-- để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất

DROP PROCEDURE IF EXISTS Max_content;
DELIMITER // 
CREATE PROCEDURE Max_content(IN out_type_question VARCHAR(50))
	BEGIN
		SELECT q.Content, MAX(length(q.Content))
        FROM typequestion t
        JOIN question q USING(TypeID)
        WHERE  TypeName = out_type_question;
	END//
DELIMITER ;
call testingsystem.Max_content('essay');

-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
SET FOREIGN_KEY_CHECKS =  0 ;
DROP PROCEDURE IF EXISTS Delete_exam;
DELIMITER // 
CREATE PROCEDURE Delete_exam(IN ID TINYINT)
	BEGIN
		DELETE FROM exam
        WHERE ExamID = ID;
    END //
DELIMITER ;
call testingsystem.Delete_exam(1);

-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử
-- dụng store ở câu 9 để xóa)
-- Sau đó in số lượng record đã remove từ các table liên quan trong khi removing

-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng
-- nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được
-- chuyển về phòng ban default là phòng ban chờ việc

DROP PROCEDURE IF EXISTS Delete_department;
DELIMITER // 
CREATE PROCEDURE Delete_department(IN departnemt_name VARCHAR(50))
	BEGIN
		DECLARE department_id TINYINT;
        SELECT DepartmentID INTO department_id FROM department
			WHERE DepartmentName = departnemt_name;
        DELETE FROM department WHERE DepartmentName = departnemt_name;
        UPDATE `account` a set a.DepartmentID = 11 WHERE  a.DepartmentID = department_id;
    END //
DELIMITER ;
CALL testingsystem.Delete_department();	


-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay
DROP PROCEDURE IF EXISTS count_number_question;
DELIMITER // 
CREATE PROCEDURE count_number_question()
	BEGIN
		SELECT COUNT(*) numberQuestion,month(CreateDate)
        FROM question
        WHERE month(CreateDate) = month(now())  AND year(CreateDate) = year(now())
        GROUP BY month(CreateDate);
       
    END //
DELIMITER ;
call testingsystem.count_number_question();		

-- Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6
-- tháng gần đây nhất
-- (Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong tháng")




