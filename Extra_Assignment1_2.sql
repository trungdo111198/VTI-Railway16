DROP DATABASE IF EXISTS Fresher;
CREATE DATABASE IF NOT EXISTS Fresher;
USE Fresher;
CREATE TABLE Trainee(
	TraineeID 			MEDIUMINT UNSIGNED PRIMARY KEY,
    Full_name 			VARCHAR(50) NOT NULL,
    Birth_date 			DATE NOT NULL,
    Gender 				ENUM('male','female','unknown'),
    ET_IQ 				TINYINT UNSIGNED CHECK (ET_IQ<=20),
    ET_Gmath 			TINYINT UNSIGNED CHECK(ET_Gmath<= 20),
    ET_English 			TINYINT UNSIGNED CHECK(ET_English<=50),
    Training_Class 		TINYINT UNSIGNED NOT NULL,
    Evaluation_Note 	VARCHAR(255),
    VTI_Account 		VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE Data_Type1(
	ID 					MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Name` 				VARCHAR(50) NOT NULL,
    `Code` 				CHAR(5),
    ModifiedDate 		DATETIME
);
CREATE TABLE Data_Type2(
	ID 					MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Name` 				VARCHAR(50) NOT NULL,
    BirthDate 			DATE,
    Gender 				ENUM ('0','1','null'),
    IsDeletedFlag		ENUM ('0','1')
);