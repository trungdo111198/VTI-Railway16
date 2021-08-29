DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE IF NOT EXISTS Testing_System_Assignment_1;
USE Testing_System_Assignment_1;
-- tao bang Department

CREATE TABLE Department(
	DepartmentID 		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    DepartmentName 		NVARCHAR(50) NOT NULL UNIQUE KEY CHECK(length(DepartmentName)>= 6 AND length(DepartmentName)<= 50)
);
-- tao bang Position

CREATE TABLE `Position`(
	PositionID 			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    PositionName 		ENUM('(Dev','Test','Scrum Master','PM') NOT NULL 
);
-- tao bang Account

CREATE TABLE `Account`(
	AccountID 			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Email 				VARCHAR(50) NOT NULL UNIQUE KEY,
    Username			VARCHAR(50) NOT NULL UNIQUE KEY CHECK(length(Username)>= 6 AND length(Username)<= 50),
    Fullname 			NVARCHAR(50) NOT NULL CHECK(length(Fullname)>= 6 AND length(Fullname)<= 50),
    DepartmentID 		TINYINT UNSIGNED ,
    PositionID 			TINYINT UNSIGNED ,
    CreateDate 			DATE DEFAULT NOW() ,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
);
-- tao bang Group

CREATE TABLE `Group`(
	GroupID 			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    GroupName 			VARCHAR(50) NOT NULL UNIQUE KEY CHECK(length(GroupName)>= 6 AND length(GroupName)<= 50) ,
    CreatorID 			SMALLINT UNSIGNED NOT NULL UNIQUE KEY,
    CreateDate 			DATE DEFAULT NOW() ,
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);
-- tao bang GroupAccount

CREATE TABLE GroupAccount(
	GroupID 			TINYINT UNSIGNED NOT NULL UNIQUE KEY,
    AccountID 			SMALLINT UNSIGNED NOT NULL UNIQUE KEY,
    JoinDate 			DATE DEFAULT NOW(),
    PRIMARY KEY(GroupID,AccountID) ,
    FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID),
    FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID)
);
-- tao bang TypeQuestion

CREATE TABLE TypeQuestion(
	TypeID 				TINYINT UNSIGNED PRIMARY KEY,
    TypeName 			VARCHAR(50) NOT NULL
);
-- tao bang  CategoryQuestion

CREATE TABLE CategoryQuestion(
	CategoryID 			TINYINT UNSIGNED PRIMARY KEY,
    CategoryName 		VARCHAR(50) NOT NULL
);
-- tao bang Question

CREATE TABLE Question(
	QuestionID 			TINYINT UNSIGNED PRIMARY KEY,
    Content 			NVARCHAR(100),
    CategoryID 			TINYINT UNSIGNED NOT NULL,
    TypeID 				TINYINT UNSIGNED NOT NULL,
    CreatorID 			SMALLINT UNSIGNED NOT NULL,
	CreateDate 			DATE DEFAULT NOW(),
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
    
);
-- tao bang Answer 

CREATE TABLE Answer(
	AnswerID 			TINYINT UNSIGNED  PRIMARY KEY,
    Content 			NVARCHAR(100),
    QuestionID 			TINYINT UNSIGNED NOT NULL,
    isCorrect 			ENUM('TRUE','FALSE'),
    FOREIGN KEY(QuestionID) REFERENCES  Question(QuestionID)
);
-- tao bang Exam

CREATE TABLE Exam(
	ExamID 				TINYINT UNSIGNED PRIMARY KEY,
    Code 				VARCHAR(20) NOT NULL UNIQUE,
    Title 				VARCHAR(50),
    CategoryID 			TINYINT UNSIGNED NOT NULL,
    Duration 			TIME NOT NULL,
    CreatorID 			SMALLINT UNSIGNED NOT NULL,
    CreateDate 			DATE DEFAULT NOW(),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
 
);
-- tao bang ExamQuestion

CREATE TABLE ExamQuestion(
	ExamID 				TINYINT UNSIGNED NOT NULL,
	QuestionID 			TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY(ExamID,QuestionID),
    FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
    );
   