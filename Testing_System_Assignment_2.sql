DROP DATABASE IF EXISTS Testing_System_Assignment;
CREATE DATABASE IF NOT EXISTS Testing_System_Assignment;
USE Testing_System_Assignment;
-- tao bang Department
DROP TABLE IF EXISTS Department;
CREATE TABLE IF NOT EXISTS Department(
	DepartmentID 		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    DepartmentName 		NVARCHAR(50) NOT NULL UNIQUE KEY 
   
);
-- tao bang Position
DROP TABLE IF EXISTS `Position`;
CREATE TABLE IF NOT EXISTS `Position`(
	PositionID 			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    PositionName 		ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY 
);
-- tao bang Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE IF NOT EXISTS `Account`(
	AccountID 			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Email 				VARCHAR(50) NOT NULL UNIQUE KEY,
    Username			VARCHAR(50) NOT NULL UNIQUE KEY ,
    Fullname 			NVARCHAR(50) NOT NULL ,
    DepartmentID 		TINYINT UNSIGNED ,
    PositionID 			TINYINT UNSIGNED ,
    CreateDate 			DATE ,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
);
-- tao bang Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE IF NOT EXISTS `Group`(
	GroupID 			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    GroupName 			VARCHAR(50) NOT NULL UNIQUE KEY  ,
    CreatorID 			SMALLINT UNSIGNED NOT NULL UNIQUE KEY,
    CreateDate 			DATE ,
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);
-- tao bang GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE IF NOT EXISTS GroupAccount(
	GroupID 			TINYINT UNSIGNED NOT NULL ,
    AccountID 			SMALLINT UNSIGNED NOT NULL ,
    JoinDate 			DATE ,
    PRIMARY KEY(GroupID,AccountID) ,
    FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID),
    FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID)
);
-- tao bang TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE IF NOT EXISTS TypeQuestion(
	TypeID 				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    TypeName 			ENUM('Essay','Multiple-Choice') NOT NULL
);
-- tao bang  CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE IF NOT EXISTS CategoryQuestion(
	CategoryID 			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    CategoryName 		VARCHAR(50) NOT NULL
);
-- tao bang Question
DROP TABLE IF EXISTS Question;
CREATE TABLE IF NOT EXISTS Question(
	QuestionID 			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content 			TEXT NOT NULL,
    CategoryID 			TINYINT UNSIGNED NOT NULL,
    TypeID 				TINYINT UNSIGNED NOT NULL,
    CreatorID 			SMALLINT UNSIGNED NOT NULL,
	CreateDate 			DATE,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
    
);
-- tao bang Answer 
DROP TABLE IF EXISTS Answer;
CREATE TABLE IF NOT EXISTS Answer(
	AnswerID 			TINYINT UNSIGNED  PRIMARY KEY AUTO_INCREMENT,
    Content 			TEXT NOT NULL,
    QuestionID 			SMALLINT UNSIGNED NOT NULL,
    isCorrect 			ENUM('TRUE','FALSE'),
    FOREIGN KEY(QuestionID) REFERENCES  Question(QuestionID)
);
-- tao bang Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE IF NOT EXISTS Exam(
	ExamID 				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Code 				VARCHAR(20) NOT NULL UNIQUE,
    Title 				VARCHAR(50),
    CategoryID 			TINYINT UNSIGNED NOT NULL,
    Duration 			TIME NOT NULL,
    CreatorID 			SMALLINT UNSIGNED NOT NULL,
    CreateDate 			DATETIME DEFAULT NOW() ,
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID),
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID)
  
);
-- tao bang ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE IF NOT EXISTS ExamQuestion(
	ExamID 				TINYINT UNSIGNED NOT NULL,
	QuestionID 			SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(ExamID,QuestionID),
    FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
    );
    -- Th??m d??? li???u v??o b???ng Department
INSERT INTO Department	(DepartmentName)
VALUES					(N'Sale'),
						(N'Marketting'),
						(N'B???o v???'),
						(N'Nh??n s???'),
						(N'K??? thu???t');
-- Th??m d??? li???u v??o b???ng position
INSERT INTO `position`	(PositionName)
VALUES					('Dev'),
						('Test'),
						('Scrum Master'),
						('PM');
-- Th??m d??? li???u v??o b???ng typequestion			
INSERT INTO typequestion(TypeName)
VALUES					('Essay'),
						('Multiple-Choice');
-- Th??m d??? li???u v??o b???ng Account
INSERT INTO `Account`	(Email,					Username,		Fullname,			DepartmentID,		PositionID,		CreateDate)
VALUES					('anhnguyen@gmail.com',	'nguyenanh',	N'Nguy???n V??n Anh',	1,					1,				'2014-01-03 00:00:00'),
						('nguyentam@gmail.com',	'tamnguyen',	N'Nguy???n V??n T??m',	2,					1,				'2019-10-26'),
                        ('hungtran@gmail.com',	'tranhung',		N'Tr???n V??n H??ng',	3,					2,				'2017-01-29'),
                        ('havu@gmail.com',		'vuha',			N'V?? Th??? H??',		4,					1,				'2020-05-14'),
                        ('maile@gmail.com',		'lemai',		N'L?? Th??? Mai',		1,					4,				'2015-02-11');
-- Th??m d??? li???u v??o b???ng Group
INSERT INTO `Group`		(GroupName,		CreatorID,		CreateDate)
VALUES					('sale1',		1,      		'2019-12-03'),
						('marketing',	2,      		'2019-10-26'),
                        ('dev',			5,      		'2016-01-29'),
                        ('PM',			4,      		'2019-05-14'),
                        ('Test',		3,     			'2018-02-11');
-- Th??m d??? li???u v??o b???ng groupaccount
INSERT INTO GroupAccount(GroupID,		AccountID,	JoinDate)
VALUES					(2,				4,      	'2020-12-03'),
						(3,				1,      	'2020-10-26'),
                        (4,				2,      	'2021-06-11'),
                        (1,				5,      	'2020-08-15'),
                        (1,				2,			'2019-04-21');
-- Th??m d??? li???u v??o b???ng CategoryQuestion
INSERT INTO CategoryQuestion	(CategoryName)
VALUES							('Java'),
								('NET'),
                                ('SQL'),
                                ('Postman'),
                                ('Ruby');
-- Th??m d??? li???u v??o b???ng Question
INSERT INTO Question	(Content,					CategoryID,		TypeID,		CreatorID, 	CreateDate)
VALUES					('N???i dung c??u h???i 1',		1,				1,			4,			'2018-03-26'),
						('N???i dung c??u h???i 2',		2,				1,			1,			'2017-10-26'),
                        ('N???i dung c??u h???i 3',		3,				1,			2,			'2019-04-30'),
                        ('N???i dung c??u h???i 4',		5,				1,			3,			'2019-06-14'),
                        ('N???i dung c??u h???i 5',		4,				1,			5,			'2016-02-11');
-- Th??m d??? li???u v??o b???ng Answer
INSERT INTO Answer			(Content,						QuestionID,		isCorrect) 
VALUES						('N???i dung c??u tr??? l???i 1',		1,				'TRUE'),
							('N???i dung c??u tr??? l???i 2',		2,				'FALSE'),
							('N???i dung c??u tr??? l???i 3',		3,				'FALSE'),
							('N???i dung c??u tr??? l???i 4',		4,				'TRUE'),
							('N???i dung c??u tr??? l???i 5',		5,				'TRUE');
INSERT INTO Exam	( Code, 		Title, 						CategoryID,		Duration, 		CreatorID)
VALUES				( 'D01', 		'Ti??u ????? ????? thi s??? 1', 		1,				'01:30:00', 		1),
					( 'D02', 		'Ti??u ????? ????? thi s??? 2', 		2,				'01:30:00', 		2),
                    ( 'D03', 		'Ti??u ????? ????? thi s??? 3', 		3,				'01:30:00', 		3),
                    ( 'D04', 		'Ti??u ????? ????? thi s??? 4', 		4,				'01:30:00', 		4),
                    ( 'D05', 		'Ti??u ????? ????? thi s??? 5', 		5,				'01:30:00', 		5);
-- Th??m d??? li???u v??o b???ng ExamQuestion
INSERT INTO ExamQuestion 	(ExamID,	QuestionID)
VALUES 						(1,			2),
							(1,			3),
                            (2,			4),
                            (3,			1),
                            (4,			5);

   