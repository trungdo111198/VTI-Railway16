USE Testing_System_Assignment;
-- Thêm dữ liệu vào bảng Department
INSERT INTO Department	(DepartmentName)
VALUES					(N'Sale'),
						(N'Marketting'),
						(N'Bảo vệ'),
						(N'Nhân sự'),
						(N'Kỹ thuật');
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
INSERT INTO `Account`	(Email,					Username,		Fullname,			DepartmentID,		PositionID)
VALUES					('anhnguyen@gmail.com',	'nguyenanh',	N'nguyễn văn anh',	1,					1),
						('nguyentam@gmail.com',	'tamnguyen',	N'nguyễn văn tâm',	2,					1),
                        ('hungtran@gmail.com',	'tranhung',		N'trần văn hùng',	3,					2),
                        ('havu@gmail.com',		'vuha',			N'vũ thị hà',		4,					1),
                        ('maile@gmail.com',		'lemai',		N'lê thị mai',		1,					4);
-- Thêm dữ liệu vào bảng Group
INSERT INTO `Group`		(GroupName,		CreatorID)
VALUES					('sale1',		1),
						('marketing',	2),
                        ('dev',			5),
                        ('PM',			4),
                        ('Test',		3);
-- Thêm dữ liệu vào bảng groupaccount
INSERT INTO GroupAccount(GroupID,		AccountID)
VALUES					(2,				4),
						(3,				1),
                        (4,				2),
                        (1,				5),
                        (1,				2);
-- Thêm dữ liệu vào bảng CategoryQuestion
INSERT INTO CategoryQuestion	(CategoryName)
VALUES							('Java'),
								('NET'),
                                ('SQL'),
                                ('Postman'),
                                ('Ruby');
-- Thêm dữ liệu vào bảng Question
INSERT INTO Question	(Content,					CategoryID,		TypeID,		CreatorID	)
VALUES					('Nội dung câu hỏi 1',		1,				1,			4			),
						('Nội dung câu hỏi 2',		2,				1,			1			),
                        ('Nội dung câu hỏi 3',		3,				1,			2			),
                        ('Nội dung câu hỏi 4',		5,				1,			3			),
                        ('Nội dung câu hỏi 5',		4,				1,			5			);
-- Thêm dữ liệu vào bảng Answer
INSERT INTO Answer			(Content,						QuestionID,		isCorrect) 
VALUES						('Nội dung câu trả lời 1',		1,				'TRUE'),
							('Nội dung câu trả lời 2',		2,				'FALSE'),
							('Nội dung câu trả lời 3',		3,				'FALSE'),
							('Nội dung câu trả lời 4',		4,				'TRUE'),
							('Nội dung câu trả lời 5',		5,				'TRUE');
INSERT INTO Exam	( Code, 		Title, 						CategoryID,		Duration, 		CreatorID)
VALUES				( 'D01', 		'Tiêu đề đề thi số 1', 		1,				'01:30:00', 		1),
					( 'D02', 		'Tiêu đề đề thi số 2', 		2,				'01:30:00', 		2),
                    ( 'D03', 		'Tiêu đề đề thi số 3', 		3,				'01:30:00', 		3),
                    ( 'D04', 		'Tiêu đề đề thi số 4', 		4,				'01:30:00', 		4),
                    ( 'D05', 		'Tiêu đề đề thi số 5', 		5,				'01:30:00', 		5);
-- Thêm dữ liệu vào bảng ExamQuestion
INSERT INTO ExamQuestion 	(ExamID,QuestionID)
VALUES 						(1,2),
							(1,3),
                            (2,4),
                            (3,1),
                            (4,5);
