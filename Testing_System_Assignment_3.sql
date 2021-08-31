USE Testing_System_Assignment;
-- 2 lấy ra tất cả các phòng ban
SELECT * FROM department; 
-- 3 lấy ra id của phòng ban "Sale"
SELECT DepartmentID 
	FROM department 
	WHERE DepartmentName LIKE  'Sale' ; 
-- 5 Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id= 3
SELECT length(FullName), FullName
	FROM `account` 
	WHERE DepartmentID = 3
    ORDER BY length(FullName) DESC
    LIMIT 1;
-- 6 Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT GroupName 
	FROM `group` 
    WHERE CreateDate < '20-12-2019';
-- 8 Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày20/12/2019
SELECT `Code` 
	FROM exam 
    WHERE Duration > '01:00:00' AND CreateDate < 2019-12-20; 
-- 9 Lấy ra 5 group được tạo gần đây nhất
SELECT * FROM `group` 
	ORDER BY CreateDate DESC
	LIMIT 5 ; 
-- 10 Đếm số nhân viên thuộc department có id = 2
SELECT COUNT(DepartmentID)
	FROM `account`
    WHERE DepartmentID = 2; 
-- 11 Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT Fullname
	FROM `account`
    WHERE Fullname LIKE  'D$o'; 
-- 12 Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE FROM exam
	WHERE CreateDate < '2019-12-20'; 
-- 13 Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE FROM question 
	WHERE Content LIKE 'câu hỏi$';
    
-- 4 lấy ra thông tin account có full name dài nhất
SELECT length(FullName), FullName
	FROM `account` 
    ORDER BY length(FullName) DESC
    LIMIT 1
	;
-- 7 Lấy ra ID của question có >= 4 câu trả lời
SELECT QuestionID, COUNT(AnswerID)
	FROM answer
    GROUP BY AnswerID
    HAVING COUNT(AnswerID) >=4;
-- 14 Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE `account`
SET Fullname = 'Nguyễn Bá Lộc',
	Email = 'loc.nguyenba@vti.com.vn'
    WHERE AccountID = 5;
-- 15 update account có id = 5 sẽ thuộc group có id = 4
UPDATE groupaccount
SET GroupID = 4
WHERE AccountID = 5;
/*DELETE FROM groupaccount
WHERE GroupID = 12;
do khi tạo bảng có 2 bảng ghi trùng lặp */














/* USE Testing_System_Assignment;
-- Thêm dữ liệu vào bảng Department
INSERT INTO Department	(DepartmentName)
VALUES					(N'Sale'),
						(N'Marketting'),
						(N'Bảo vệ'),
						(N'Nhân sự'),
						(N'Kỹ thuật'),
                        (N'Tài chính'),
						(N'Phó giám đốc'),
						(N'Giám đốc'),
						(N'Thư ký'),
						(N'Bán hàng'),
                        (N'Sale1'),
                        (N'Marketting1'),
                        (N'Bảo vệ1'),
                        (N'Nhân sự1'),
                        (N'Kỹ thuật1');

-- Thêm dữ liệu vào bảng position
INSERT INTO `position`	(PositionName)
VALUES					('Dev'),
						('Test'),
						('Scrum Master'),
						('PM');
                        
                        
-- Thêm dữ liệu vào bảng typequestion			
INSERT INTO typequestion(TypeName)
VALUES					('Essay'),
						('Multiple-Choice');
-- Thêm dữ liệu vào bảng Account
INSERT INTO `Account`	(Email,						Username,			Fullname,			DepartmentID,		PositionID,		CreateDate)
VALUES					('anhnguyen1@gmail.com',	'nguyenanh1',		N'Nguyễn Văn Anh',	1,					1,				'2014-01-03'),
						('nguyentam1@gmail.com',	'tamnguyen1',		N'Nguyễn Văn Tâm',	2,					1,				'2019-10-26'),
                        ('hungtran1@gmail.com',		'tranhung1',		N'Trần Văn Hùng',	3,					2,				'2017-01-29'),
                        ('havu1@gmail.com',			'vuha1',			N'Vũ Thị Hà',		4,					1,				'2020-05-14'),
                        ('maile1@gmail.com',		'lemai1',			N'Lê Thị Mai',		1,					4,				'2015-02-11'),
                        ('anhnguyen2@gmail.com',	'nguyenanh2',		N'Nguyễn Văn Anh',	12,					4,				'2017-11-11'),
                        ('nguyentam2@gmail.com',	'tamnguyen2',		N'Nguyễn Văn Tâm',	8,					2,				'2016-10-26'),
                        ('hungtran2@gmail.com',		'tranhung2',		N'Trần Văn Hùng',	6,					3,				'2014-01-25'),
                        ('havu2@gmail.com',			'vuha2',			N'Vũ Thị Hà',		3,					2,				'2020-05-14'),
                        ('maile2@gmail.com',		'lemai2',			N'Lê Thị Mai',		7,					1,				'2014-01-03'),
                        ('anhnguyen3@gmail.com',	'nguyenanh3',		N'Nguyễn Văn Anh',	2,					4,				'2014-01-03'),
                        ('nguyentam3@gmail.com',	'tamnguyen3',		N'Nguyễn Văn Tâm',	11,					3,				'2019-02-26'),
                        ('hungtran3@gmail.com',		'tranhung3',		N'Trần Văn Hùng',	9,					3,				'2017-01-29'),
                        ('havu3@gmail.com',			'vuha3',			N'Vũ Thị Hà',		10,					2,				'2019-12-14'),
                        ('maile3@gmail.com',		'lemai3',			N'Lê Thị Mai',		15,					1,				'2015-09-11');
                        
-- Thêm dữ liệu vào bảng Group
INSERT INTO `Group`		(GroupName,		CreatorID,		CreateDate)
VALUES					('sale1',		1,      		'2019-12-03'),
						('marketing',	2,      		'2019-10-26'),
                        ('dev',			5,      		'2016-01-29'),
                        ('PM',			4,      		'2019-05-14'),
                        ('Test',		3,     			'2018-02-11');
                        ('sale2',		8,      		'2017-06-30'),
                        ('marketing1',	11,      		'2016-05-21'),
                        ('dev1',		7,      		'2015-09-21'),
                        ('PM1',			15,      		'2014-01-14'),
                        ('Test1',		6,     			'2019-03-14'),
                        ('sale3',		9,      		'2018-11-21'),
                        ('marketing2',	12,      		'2016-12-14'),
                        ('dev2',		10,      		'2017-02-28'),
                        ('PM2',			13,      		'2018-04-30'),
                        ('Test2',		14,     		'2019-08-11');
-- Thêm dữ liệu vào bảng groupaccount
INSERT INTO GroupAccount(GroupID,		AccountID,	JoinDate)
VALUES					(2,				4,      	'2020-12-03'),
						(3,				1,      	'2020-10-26'),
                        (4,				2,      	'2021-06-11'),
                        (1,				5,      	'2020-08-15'),
                        (1,				2,			'2019-04-21'),
                        (6,				2,      	'2020-01-20'),
                        (12,			5,      	'2020-12-20'),
                        (1,				8,      	'2021-04-05'),
                        (2,				3,      	'2020-01-13'),
                        (3,				11,			'2019-04-30'),
                        (1,				4,      	'2020-06-16'),
                        (5,				14,      	'2020-10-13'),
                        (4,				1,      	'2021-11-11'),
                        (7,				1,      	'2020-03-29'),
                        (15,			5,			'2019-06-01');
                        
-- Thêm dữ liệu vào bảng CategoryQuestion
INSERT INTO CategoryQuestion	(CategoryName)
VALUES							('Java'),
								('NET'),
                                ('SQL'),
                                ('Postman'),
                                ('Ruby'),
                                ('Java1'),
                                ('NET1'),
                                ('SQL1'),
                                ('Postman1'),
                                ('Ruby1'),
                                ('Java2'),
                                ('NET2'),
                                ('SQL2'),
                                ('Postman2'),
                                ('Ruby2');
-- Thêm dữ liệu vào bảng Question
INSERT INTO Question	(Content,					CategoryID,		TypeID,		CreatorID, 	CreateDate)
VALUES					('Nội dung câu hỏi 1',		1,				1,			4,			'2018-03-26'),
						('Nội dung câu hỏi 2',		2,				1,			1,			'2017-10-26'),
                        ('Nội dung câu hỏi 3',		3,				1,			2,			'2019-04-30'),
                        ('Nội dung câu hỏi 4',		5,				1,			3,			'2019-06-14'),
                        ('Nội dung câu hỏi 5',		4,				1,			5,			'2016-02-11'),
                        ('Nội dung câu hỏi 6',		4,				1,			11,			'2018-06-25'),
                        ('Nội dung câu hỏi 7',		8,				2,			14,			'2019-11-26'),
                        ('Nội dung câu hỏi 8',		5,				1,			15,			'2019-02-21'),
                        ('Nội dung câu hỏi 9',		10,				1,			13,			'2019-04-12'),
                        ('Nội dung câu hỏi 10',		3,				1,			12,			'2017-02-11'),
                        ('Nội dung câu hỏi 11',		14,				1,			10,			'2018-06-23'),
                        ('Nội dung câu hỏi 12',		7,				1,			8,			'2017-08-10'),
                        ('Nội dung câu hỏi 13',		12,				2,			9,			'2019-03-04'),
                        ('Nội dung câu hỏi 14',		13,				1,			6,			'2019-05-16'),
                        ('Nội dung câu hỏi 15',		4,				1,			7,			'2019-02-11');
                        
-- Thêm dữ liệu vào bảng Answer
INSERT INTO Answer			(Content,						QuestionID,		isCorrect) 
VALUES						('Nội dung câu trả lời 1',		1,				'TRUE'),
							('Nội dung câu trả lời 2',		2,				'FALSE'),
							('Nội dung câu trả lời 3',		3,				'FALSE'),
							('Nội dung câu trả lời 4',		4,				'TRUE'),
							('Nội dung câu trả lời 5',		5,				'TRUE'),
                            ('Nội dung câu trả lời 6',		6,				'TRUE'),
                            ('Nội dung câu trả lời 7',		7,				'FALSE'),
                            ('Nội dung câu trả lời 8',		8,				'FALSE'),
                            ('Nội dung câu trả lời 9',		9,				'TRUE'),
                            ('Nội dung câu trả lời 10',		10,				'TRUE'),
                            ('Nội dung câu trả lời 11',		11,				'TRUE'),
                            ('Nội dung câu trả lời 12',		12,				'FALSE'),
                            ('Nội dung câu trả lời 13',		13,				'FALSE'),
                            ('Nội dung câu trả lời 14',		14,				'TRUE'),
                            ('Nội dung câu trả lời 15',		15,				'TRUE');
                            
INSERT INTO Exam	( Code, 		Title, 						CategoryID,		Duration, 			CreatorID)
VALUES				( 'D01', 		'Tiêu đề đề thi số 1', 		1,				'01:30:00', 		1)
					( 'D02', 		'Tiêu đề đề thi số 2', 		2,				'01:30:00', 		2)
                    ( 'D03', 		'Tiêu đề đề thi số 3', 		3,				'01:30:00', 		3)
                    ( 'D04', 		'Tiêu đề đề thi số 4', 		4,				'01:30:00', 		4)
                    ( 'D05', 		'Tiêu đề đề thi số 5', 		5,				'01:30:00', 		5),
                    ( 'D06', 		'Tiêu đề đề thi số 6', 		6,				'01:30:00', 		15),
                    ( 'D07', 		'Tiêu đề đề thi số 7', 		7,				'01:30:00', 		12),
                    ( 'D08', 		'Tiêu đề đề thi số 8', 		8,				'01:30:00', 		9),
                    ( 'D09', 		'Tiêu đề đề thi số 9', 		9,				'01:30:00', 		10),
                    ( 'D10', 		'Tiêu đề đề thi số 10', 	10,				'01:30:00', 		7),
                    ( 'D11', 		'Tiêu đề đề thi số 11', 	11,				'01:30:00', 		5),
                    ( 'D12', 		'Tiêu đề đề thi số 12', 	12,				'01:30:00', 		2),
                    ( 'D13', 		'Tiêu đề đề thi số 13', 	13,				'01:30:00', 		13),
                    ( 'D14', 		'Tiêu đề đề thi số 14', 	14,				'01:30:00', 		14),
                    ( 'D15', 		'Tiêu đề đề thi số 15', 	15,				'01:30:00', 		8);
                    
-- Thêm dữ liệu vào bảng ExamQuestion
INSERT INTO ExamQuestion 	(ExamID,	QuestionID)
VALUES 						(1,			2),
							(1,			3),
                            (2,			4),
                            (3,			1),
                            (4,			5),
                            (10,		12),
                            (4,			9),
                            (6,			6),
                            (7,			7),
                            (15,		8),
                            (3,			11),
                            (5,			3),
                            (13,		14),
                            (8,			1),
                            (12,		5);
*/