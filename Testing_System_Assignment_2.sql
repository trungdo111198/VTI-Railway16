DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE IF NOT EXISTS Testing_System_Assignment_1;
USE Testing_System_Assignment_1;
-- tao bang Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	DepartmentID 		SMALLINT UNSIGNED PRIMARY KEY,
    DepartmentName 		VARCHAR(50) NOT NULL UNIQUE CHECK(length(DepartmentName)>= 6 AND length(DepartmentName)<= 50)
);
-- tao bang Position
DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
	PositionID 			SMALLINT UNSIGNED PRIMARY KEY,
    PositionName 		VARCHAR(50) NOT NULL UNIQUE
);
-- tao bang Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountID 			SMALLINT UNSIGNED PRIMARY KEY,
    Email 				VARCHAR(50),
    Username			VARCHAR(50) NOT NULL CHECK(length(Username)>= 6 AND length(Username)<= 50),
    Fullname 			VARCHAR(50) NOT NULL CHECK(length(Fullname)>= 6 AND length(Fullname)<= 50),
    DepartmentID 		SMALLINT UNSIGNED ,
    PositionID 			SMALLINT UNSIGNED ,
    CreateDate 			DATE NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
);
-- tao bang Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	GroupID 			SMALLINT UNSIGNED PRIMARY KEY,
    GroupName 			VARCHAR(50) NOT NULL UNIQUE CHECK(length(GroupName)>= 6 AND length(GroupName)<= 50) ,
    CreatorID 			SMALLINT UNSIGNED NOT NULL UNIQUE,
    CreateDate 			DATE NOT NULL,
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);
-- tao bang GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
	GroupID 			SMALLINT UNSIGNED NOT NULL UNIQUE,
    AccountID 			SMALLINT UNSIGNED NOT NULL UNIQUE,
    JoinDate 			DATE,
    FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID),
    FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID)
);
-- tao bang TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion(
	TypeID 				SMALLINT UNSIGNED PRIMARY KEY,
    TypeName 			VARCHAR(50) NOT NULL
);
-- tao bang  CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
	CategoryID 			SMALLINT UNSIGNED PRIMARY KEY,
    CategoryName 		VARCHAR(50) NOT NULL
);
-- tao bang Question
DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
	QuestionID 			SMALLINT UNSIGNED PRIMARY KEY,
    Content 			VARCHAR(50),
    CategoryID 			SMALLINT UNSIGNED NOT NULL,
    TypeID 				SMALLINT UNSIGNED NOT NULL,
    CreatorID 			SMALLINT NOT NULL,
	CreateDate 			DATE,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID)
);
-- tao bang Answer 
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
	AnswerID 			SMALLINT UNSIGNED  PRIMARY KEY,
    Content 			VARCHAR(50),
    QuestionID 			SMALLINT UNSIGNED NOT NULL,
    isCorrect 			ENUM('TRUE','FALSE'),
    FOREIGN KEY(QuestionID) REFERENCES  Question(QuestionID)
);
-- tao bang Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
	ExamID 				SMALLINT UNSIGNED PRIMARY KEY,
    Code 				VARCHAR(20) NOT NULL UNIQUE,
    Title 				VARCHAR(50),
    CategoryID 			SMALLINT UNSIGNED NOT NULL,
    Duration 			TIME NOT NULL,
    CreatorID 			SMALLINT UNSIGNED NOT NULL,
    CreateDate 			DATE NOT NULL
);
-- tao bang ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
	ExamID 				SMALLINT UNSIGNED NOT NULL,
	QuestionID 			SMALLINT UNSIGNED NOT NULL
);