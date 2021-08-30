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
    CreateDate 			DATETIME DEFAULT NOW() ,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
);
-- tao bang Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE IF NOT EXISTS `Group`(
	GroupID 			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    GroupName 			VARCHAR(50) NOT NULL UNIQUE KEY  ,
    CreatorID 			SMALLINT UNSIGNED NOT NULL UNIQUE KEY,
    CreateDate 			DATETIME DEFAULT NOW() ,
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);
-- tao bang GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE IF NOT EXISTS GroupAccount(
	GroupID 			TINYINT UNSIGNED NOT NULL ,
    AccountID 			SMALLINT UNSIGNED NOT NULL ,
    JoinDate 			DATETIME DEFAULT NOW(),
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
	CreateDate 			DATETIME DEFAULT NOW(),
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
    CreateDate 			DATETIME DEFAULT NOW(),
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
   