DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE IF NOT EXISTS Testing_System_Assignment_1;
USE Testing_System_Assignment_1;
-- tao bang Department
CREATE TABLE Department(
	DepartmentID 		INT,
    DepartmentName 		VARCHAR(50)
);
-- tao bang Position
CREATE TABLE `Position`(
	PositionID 			INT,
    PositionName 		VARCHAR(50)
);
-- tao bang Account
CREATE TABLE `Account`(
	AccountID 			INT,
    Email 				VARCHAR(50),
    Username			VARCHAR(50),
    Fullname 			VARCHAR(50),
    DepartmentID 		INT,
    PositionID 			INT,
    CreateDate 			DATE
);
-- tao bang Group
CREATE TABLE `Group`(
	GroupID 			INT,
    GroupName 			VARCHAR(50),
    CreatorID 			INT,
    CreateDate 			DATE
);
-- tao bang GroupAccount
CREATE TABLE GroupAccount(
	GroupID 			INT,
    AccountID 			INT,
    JoinDate 			DATE
);
-- tao bang TypeQuestion
CREATE TABLE TypeQuestion(
	TypeID 				INT,
    TypeName 			VARCHAR(50)
);
-- tao bang  CategoryQuestion
CREATE TABLE CategoryQuestion(
	CategoryID 			INT,
    CategoryName 		VARCHAR(50)
);
-- tao bang Question
CREATE TABLE Question(
	QuestionID 			INT,
    Content 			VARCHAR(50),
    CategoryID 			INT,
    TypeID 				INT,
    CreatorID 			INT,
	CreateDate 			DATE
);
-- tao bang Answer 
CREATE TABLE Answer(
	AnswerID 			INT,
    Content 			VARCHAR(50),
    QuestionID 			INT,
    isCorrect 			VARCHAR(50)
);
-- tao bang Exam
CREATE TABLE Exam(
	ExamID 				INT,
    Code 				INT,
    Title 				VARCHAR(50),
    CategoryID 			INT,
    Duration 			TIME,
    CreatorID 			INT,
    CreateDate 			DATE
);
-- tao bang ExamQuestion
CREATE TABLE ExamQuestion(
	ExamID 				INT,
	QuestionID 			INT
);