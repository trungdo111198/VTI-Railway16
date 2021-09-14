USE TestingSystem;
-- Question 1: Tạo view(CTE) có chứa danh sách nhân viên thuộc phòng ban sale

DROP VIEW IF EXISTS view_account_sale;
CREATE  VIEW view_account_sale AS
    SELECT 
        *
    FROM
        `account`
            JOIN
        department USING (DepartmentID)
	WHERE DepartmentName = 'Sale';
SELECT * FROM view_account_sale;

-- tạo CTE
 WITH CTE_account_sale AS ( SELECT 
        *
    FROM
        `account`
            JOIN
        department USING (DepartmentID)
	WHERE DepartmentName = 'Sale')
    SELECT * FROM CTE_account_sale;

 -- Question 2: Tạo view(CTE) có chứa thông tin các account tham gia vào nhiều group nhất

DROP VIEW IF EXISTS view_account_group;

CREATE VIEW view_account_group AS
    SELECT 
        * , GROUP_CONCAT(GroupID)
    FROM
        `account`
            JOIN
        groupaccount USING (AccountID)
    GROUP BY AccountID
    HAVING COUNT(*) = (SELECT 
            COUNT(*)
        FROM
            `account`
                JOIN
            groupaccount USING (AccountID)
        GROUP BY AccountID
        ORDER BY COUNT(*) DESC
        LIMIT 1);        
SELECT * FROM view_account_group;

-- tạo CTE
WITH CTE_account_group AS(SELECT 
        * , GROUP_CONCAT(GroupID)
    FROM
        `account`
            JOIN
        groupaccount USING (AccountID)
    GROUP BY AccountID
    HAVING COUNT(*) = (SELECT 
            COUNT(*)
        FROM
            `account`
                JOIN
            groupaccount USING (AccountID)
        GROUP BY AccountID
        ORDER BY COUNT(*) DESC
        LIMIT 1))
	SELECT * FROM CTE_account_group;
	

-- Question 4: Tạo view(CTE) có chứa danh sách các phòng ban có nhiều nhân viên nhất

DROP VIEW IF EXISTS view_account_department ;
CREATE VIEW view_account_department AS
    SELECT 
        *
    FROM
        `account`
            JOIN
        department USING (DepartmentID)
    GROUP BY DepartmentID
    HAVING COUNT(*) = (SELECT 
            COUNT(*)
        FROM
            `account`
                JOIN
            department USING (DepartmentID)
        GROUP BY DepartmentID
        ORDER BY COUNT(*) DESC
        LIMIT 1);
SELECT * FROM view_account_department;
-- tạo CTE
WITH CTE_account_department AS( SELECT 
        *
    FROM
        `account`
            JOIN
        department USING (DepartmentID)
    GROUP BY DepartmentID
    HAVING COUNT(*) = (SELECT 
            COUNT(*)
        FROM
            `account`
                JOIN
            department USING (DepartmentID)
        GROUP BY DepartmentID
        ORDER BY COUNT(*) DESC
        LIMIT 1))
 SELECT * FROM CTE_account_department;

-- Question 3: Tạo view(CTE) có chứa câu hỏi có những content quá dài (content quá 20 từ được coi là quá dài) và xóa nó đi

DROP VIEW IF EXISTS view_content ;
CREATE VIEW view_content AS
    SELECT 
        QuestionID, Content
    FROM
        question
    WHERE
        LENGTH(Content) > 20;
SELECT 
    *
FROM
    view_content;
SET foreign_key_checks=0;
DELETE FROM question 
WHERE
    QuestionID = 10;
SELECT * FROM view_content;
-- tạo CTE
WITH CTE_content AS (SELECT 
        QuestionID, Content
    FROM
        question
    WHERE
        LENGTH(Content) > 20)
	SELECT * FROM CTE_content;

    
-- Question 5: Tạo view(CTE) có chứa tất các các câu hỏi do user họ Nguyễn tạo
DROP VIEW IF EXISTS view_content_name;
CREATE VIEW view_content_name AS
    SELECT 
        q.QuestionID, q.content, FullName
    FROM
        question q
            JOIN
        `account` a ON q.CreatorID = a.AccountID
    WHERE
        SUBSTRING(FullName, 1, 6) LIKE 'Nguyen';
SELECT 
    *
FROM
    view_content_name;
-- tạo CTE
WITH CTE_content_name AS (SELECT 
        q.QuestionID, q.content, FullName
    FROM
        question q
            JOIN
        `account` a ON q.CreatorID = a.AccountID
    WHERE
        SUBSTRING(FullName, 1, 6) LIKE 'Nguyen')
	SELECT * FROM CTE_content_name;







