-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước

DROP TRIGGER IF EXISTS trigger_1year_ago;
DELIMITER $$
		CREATE TRIGGER trigger_1year_ago
        BEFORE INSERT ON `group`
        FOR EACH ROW
        BEGIN
			IF NEW.CreateDate < (DATE_SUB(NOW(), INTERVAL 1 YEAR)) THEN
			   SIGNAL SQLSTATE '12344' --
               SET MESSAGE_TEXT = " Time Input Error "; 
            END IF;
        END $$
DELIMITER ;
-- Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào
-- department "Sale" nữa, khi thêm thì hiện ra thông báo "Department
-- "Sale" cannot add more user"
DROP TRIGGER IF EXISTS trigger_cannotADDSale;
DELIMITER $$
CREATE TRIGGER trigger_cannotADDSale
BEFORE INSERT ON `account`
FOR EACH ROW
	BEGIN
		IF NEW.DepartmentID = (SELECT DepartmentID FROM department WHERE DepartmentName = "Sale") THEN
        SIGNAL SQLSTATE '11111'
        SET MESSAGE_TEXT = "Department 'Sale' cannot add more user";
        END IF;
    END $$
DELIMITER ;

INSERT INTO `Account`(Email								, Username			, FullName				, DepartmentID	, PositionID, CreateDate)
VALUES 				('haidang29produrctiojns@gmail.com'	, 'dangblack2'		,'Nguyen Hai Dang'		,   '2'			,   '1'		,'2020-03-05');

-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user

DROP TRIGGER IF EXISTS trigger_5user_group;
DELIMITER $$
CREATE TRIGGER trigger_5user_group
BEFORE INSERT ON groupaccount
FOR EACH ROW
	BEGIN
		DECLARE number_user_of_group TINYINT;
        SELECT COUNT(groupaccount.GroupID) INTO number_user_of_group
        FROM groupaccount 
        WHERE NEW.GroupID = GroupID;
		IF number_user_of_group > 5 THEN
        SIGNAL SQLSTATE  '11111'
        SET MESSAGE_TEXT = 'insert error each group only has 5 user';
        END IF;
	END $$
DELIMITER ;
INSERT INTO `GroupAccount`	(  GroupID	, AccountID	, JoinDate	 )
VALUES 						(	1		,    6		,'2019-03-05');

-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question
DROP TRIGGER IF EXISTS trigger_10question_exam;
DELIMITER $$
CREATE TRIGGER trigger_10question_exam
BEFORE INSERT ON examquestion
FOR EACH ROW
	BEGIN
		DECLARE number_question_of_exam TINYINT;
        SELECT COUNT(examquestion.ExamID) INTO number_question_of_exam
        FROM examquestion 
        WHERE NEW.ExamID = ExamID;
		IF number_question_of_exam > 10  THEN
        SIGNAL SQLSTATE  '11111'
        SET MESSAGE_TEXT = 'insert error each exam only has 10 question';
        END IF;
	END $$
DELIMITER ;

INSERT INTO ExamQuestion(ExamID	, QuestionID	) 
VALUES 					(	1	,		11		);

-- Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là
-- admin@gmail.com (đây là tài khoản admin, không cho phép user xóa),
-- còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông
-- tin liên quan tới user đó

DROP TRIGGER IF EXISTS trigger_cannotDelete_email;
DELIMITER $$
CREATE TRIGGER trigger_cannotDelete_email
BEFORE DELETE ON `account`
FOR EACH ROW
	BEGIN
		DECLARE Email_admin VARCHAR(50);
        SET Email_admin = "admin@gmail.com";
		IF OLD.Email = Email_admin THEN
        SIGNAL SQLSTATE '11111'
        SET MESSAGE_TEXT = "đây là tài khoản admin, không cho phép user xóa";
        END IF;
    END $$
DELIMITER ;
DELETE FROM `account`  WHERE Email = 'admin@gmail.com';

-- Question 6: Không sử dụng cấu hình default cho field DepartmentID của table
-- Account, hãy tạo trigger cho phép người dùng khi tạo account không điền
-- vào departmentID thì sẽ được phân vào phòng ban "waiting Department"

DROP TRIGGER IF EXISTS trigger_insert_account;
DELIMITER $$
CREATE TRIGGER trigger_insert_account
BEFORE INSERT ON `account`
FOR EACH ROW
	BEGIN
		IF NEW.DepartmentID IS NULL THEN 
		SET NEW.DepartmentID = "waiting Department";
        END IF;
    END $$
DELIMITER ;
INSERT INTO `Account`(Email								, Username			, FullName					, PositionID, CreateDate)
VALUES 				('haidang29prodfdsucdtions@gmail.com'	, 'dangblfddack'		,'Nguyen Hai Dang'		   		,   '1'		,'2020-03-05');

-- Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi
-- question, trong đó có tối đa 2 đáp án đúng.

DROP TRIGGER IF EXISTS trigger_4_answers_of_question;
DELIMITER $$
CREATE TRIGGER trigger_4_answers_of_question
BEFORE INSERT ON answer
FOR EACH ROW
	BEGIN
    DECLARE number_answer_of_question TINYINT;
    DECLARE number_isCorrect TINYINT;
    SELECT COUNT(*) INTO number_answer_of_question
    FROM answer 
    WHERE NEW.QuestionID = answer.QuestionID
    GROUP BY QuestionID
    ;
    SELECT COUNT(*) INTO number_isCorrect
    FROM answer 
    WHERE NEW.QuestionID = answer.QuestionID AND NEW.isCorrect= isCorrect 
    GROUP BY isCorrect;
    IF (number_answer_of_question > 4) OR (number_isCorrect >2) THEN 
    SIGNAL SQLSTATE '11111'
    SET MESSAGE_TEXT ='error';
    END IF;
    END $$
DELIMITER ;

INSERT INTO Answer	(  Content		, QuestionID	, isCorrect	)
VALUES 				(N'Trả lời 11'	,   1			,	0		);

-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày
DROP TRIGGER IF EXISTS trigger_cannotDleteExam;
DELIMITER $$
CREATE TRIGGER trigger_cannotDleteExam
BEFORE DELETE ON exam
FOR EACH ROW
	BEGIN
		IF  datediff(DATE(now()),OLD.CreateDate)  <=2 THEN
        SIGNAL SQLSTATE '11111'
        SET MESSAGE_TEXT= 'Can not delete';
        END IF;

	END $$
DELIMITER ;
set foreign_key_checks=0;
DELETE FROM exam
WHERE ExamID = 10;

-- Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các
-- question khi question đó chưa nằm trong exam nào
DROP TRIGGER IF EXISTS trigger_cannotDleteExam;
DELIMITER $$
CREATE TRIGGER trigger_cannotDleteExam
BEFORE DELETE ON exam
FOR EACH ROW
	BEGIN
	

	END $$
DELIMITER ;

-- Question 12: Lấy ra thông tin exam trong đó:
-- Duration <= 60 thì sẽ đổi thành giá trị "Short time"
-- 60 < Duration <= 90 thì sẽ đổi thành giá trị "Medium time"
-- Duration > 90 thì sẽ đổi thành giá trị "Long time"
SELECT 
    *,
    CASE
		WHEN Duration <= 60 THEN "Short time"
        WHEN Duration > 60 AND Duration <= 90  THEN "Medium time"
        WHEN Duration > 90 THEN "Long time"
		ELSE " khong xac dinh"
        END AS Duration
FROM
    exam;
    
/*Question 13: Thống kê số account trong mỗi group và in ra thêm 1 column nữa có tên
là the_number_user_amount và mang giá trị được quy định như sau:
Nếu số lượng user trong group =< 5 thì sẽ có giá trị là few
Nếu số lượng user trong group <= 20 và > 5 thì sẽ có giá trị là normal
Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher*/
SELECT GroupID, COUNT(*), CASE
					WHEN COUNT(*) <= 5 THEN "few"
                    WHEN COUNT(*) > 5 AND COUNT(*)<= 20 THEN "normal"
                    WHEN COUNT(*) > 20  THEN "higher"
                    END AS the_number_user_amount
FROM `groupaccount`
GROUP BY GroupID;
-- Question 14: Thống kê số mỗi phòng ban có bao nhiêu user, nếu phòng ban nào
-- không có user thì sẽ thay đổi giá trị 0 thành "Không có User"
SELECT d.DepartmentName, CASE
						WHEN COUNT(a.DepartmentID) = 0 THEN 'Không có User'
						ELSE COUNT(a.DepartmentID)
						END AS SL
FROM department d
LEFT JOIN account a ON d.DepartmentID = a.DepartmentID
GROUP BY d.DepartmentID;
