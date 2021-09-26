package assignment1;

import java.time.LocalDate;

public class Progaram {

	public static void main(String[] args) {
		
		// thêm dữ liệu vào calss department
		Department dept1 = new Department();
		dept1.id = 1;
		dept1.name = "Sale";
		
		Department dept2 = new Department();
		dept2.id = 2;
		dept2.name = "Marketing";
		
		Department dept3 = new Department();
		dept3.id = 3;
		dept3.name = "Giám đốc";
		
		System.out.println("Thông tin phòng ban");
		System.out.println("id: " + dept1.id);
		System.out.println("Name: " + dept1.name);
		System.out.println("\n");
		
		// thêm dữ liệu vào class position
		Position position1 = new Position();
		position1.id = 1;
		position1.name = "Dev";
		
		Position position2 = new Position();
		position2.id = 2;
		position2.name = "Test";
		
		Position position3 = new Position();
		position3.id = 3;
		position3.name = "Scrum Master";
		
		Position position4 = new Position();
		position4.id = 4;
		position4.name = "PM";
		
		System.out.println("thông tin chức vụ");
		System.out.println("id: " + position1.id );
		System.out.println("Name: " + position1.name );
		System.out.println("\n");
		
		// thêm dữ liệu vào class account
		Account acc1 = new Account();
		acc1.id = 1;
		acc1.email = "songcodaoly@gmail.com";
		acc1.userName = "huanhoahong";
		acc1.fullName = "Bui Xuan Huan";
		acc1.deptID = dept2;
		acc1.positionID = position1;
		acc1.createDate =LocalDate.of(2016, 12, 16);
		
		Account acc2 = new Account();
		acc2.id = 2;
		acc2.email = "sontungmtp@gmail.com";
		acc2.userName = "tungnui";
		acc2.fullName = "Nguyen Thanh Tung";
		acc2.deptID = dept3;
		acc2.positionID = position4;
		acc2.createDate =LocalDate.of(2019, 05, 20);
		
		Account acc3 = new Account();
		acc3.id = 3;
		acc3.email = "dapphatchetngay@gmail.com";
		acc3.userName = "khabanh";
		acc3.fullName = "Ngo Ba Kha";
		acc3.deptID = dept1;
		acc3.positionID = position1;
		acc3.createDate =LocalDate.of(2017, 06, 01);
		
		System.out.println("thông tin Account");
		System.out.println("id: " + acc1.id);
		System.out.println("Email: " + acc1.email);
		System.out.println("UserName: " + acc1.userName);
		System.out.println("FullName: " + acc1.fullName);
		System.out.println("Department: " + acc1.deptID.name);
		System.out.println("Position: " + acc1.positionID.name);
		System.out.println("CreateDate: " + acc1.createDate);
		System.out.println("\n" );
		
		// thêm dữ liệu vào class Group
		Group group1  = new Group();
		group1.id = 1;
		group1.name = "Testing System";
		group1.creatorID = acc1;
		group1.createDate = LocalDate.of(2020, 10, 16);
		
		Group group2  = new Group();
		group2.id = 2;
		group2.name = "Developement";
		group2.creatorID = acc2;
		group2.createDate = LocalDate.of(2020, 04, 26);
		
		Group group3  = new Group();
		group3.id = 3;
		group3.name = "Management";
		group3.creatorID = acc3;
		group3.createDate = LocalDate.of(2020, 11, 26);
		
		System.out.println("Thông tin Group");
		System.out.println("id: " + group1.id);
		System.out.println("Name: " + group1.name);
		System.out.println("Creator: " + group1.creatorID.id);
		System.out.println("CreateDate: " + group1.createDate);
		System.out.println("\n" );
		
		// thêm dữ liệu vào class GroupAccount
		GroupAccount ga1 = new GroupAccount();
		ga1.groupID = group1;
		ga1.accountID = acc2;
		ga1.joinDate = LocalDate.of(2021, 07, 21);
		
		GroupAccount ga2 = new GroupAccount();
		ga2.groupID = group2;
		ga2.accountID = acc1;
		ga2.joinDate = LocalDate.of(2021, 10, 02);
		
		GroupAccount ga3 = new GroupAccount();
		ga3.groupID = group3;
		ga3.accountID = acc2;
		ga3.joinDate = LocalDate.of(2021, 11, 11);
		
		System.out.println("Thông tin GroupAccount");
		System.out.println("GroupID: " + ga2.groupID.id );
		System.out.println("Account: " + ga2.accountID.id);
		System.out.println("joinDate: " + ga2.joinDate);
		System.out.println("\n" );
		
		// thêm dữ liệu vào class TypeQuestion
		TypeQuestion tq1 = new  TypeQuestion();
		tq1.id = 1;
		tq1.name = "Essay";
		
		TypeQuestion tq2 = new  TypeQuestion();
		tq2.id = 2;
		tq2.name = "Multiple-Choice";
		
		System.out.println("Thông tin TypeQuestion");
		System.out.println("id: " + tq1.id);
		System.out.println("id: " + tq1.name);
		System.out.println("\n" );
		
		// thêm dữ liệu vào class CategoryQuestion
		CategoryQuestion cq1 = new CategoryQuestion();
		cq1.id = 1;
		cq1.name = "Java";
		
		CategoryQuestion cq2 = new CategoryQuestion();
		cq2.id = 2;
		cq2.name = ".NET";
		
		CategoryQuestion cq3 = new CategoryQuestion();
		cq3.id = 3;
		cq3.name = "SQL";
		
		System.out.println("Thông tin  CategoryQuestion");
		System.out.println("id: " + cq1.id);
		System.out.println("Name: " + cq1.name);
		System.out.println("\n" );
		
		// thêm dữ liệu vào class Question
		Question question1 = new Question();
		question1.id = 1;
		question1.content = "Câu hỏi về Java";
		question1.categoryID = cq1;
		question1.typeID = tq1;
		question1.creatorID = acc1;
		question1.createDate = LocalDate.of(2020, 10, 13);
		
		Question question2 = new Question();
		question2.id = 2;
		question2.content = "Câu hỏi về .NET";
		question2.categoryID = cq2;
		question2.typeID = tq1;
		question2.creatorID = acc2;
		question2.createDate = LocalDate.of(2020, 03, 15);
		
		Question question3 = new Question();
		question3.id = 1;
		question3.content = "Câu hỏi về SQL";
		question3.categoryID = cq3;
		question3.typeID = tq2;
		question3.creatorID = acc3;
		question3.createDate = LocalDate.of(2020, 06, 20);
		
		System.out.println("Thông tin Question");
		System.out.println("id: " + question1.id);
		System.out.println("Content: " + question1.content);
		System.out.println("CategoryID: " + question1.categoryID.id);
		System.out.println("TypeID: " + question1.typeID.id);
		System.out.println("CreatorID: " + question1.creatorID.id);
		System.out.println("CreateDate: " + question1.createDate);
		System.out.println("\n" );
		
		// thêm dữ liệu vào class Exam
		Exam exam1 = new Exam();
		exam1.id = 1;
		exam1.code = "Dề thi số 01";
		exam1.title = "Tiêu đề của đề số 1";
		exam1.categoryID = cq1;
		exam1.duration = "90p";
		exam1.creatorID = acc1;
		exam1.createDate = LocalDate.of(2020, 02, 10);
		
		Exam exam2 = new Exam();
		exam2.id = 2;
		exam2.code = "Dề thi số 02";
		exam2.title = "Tiêu đề của đề số 2";
		exam2.categoryID = cq2;
		exam2.duration = "90p";
		exam2.creatorID = acc1;
		exam2.createDate = LocalDate.of(2020, 02, 10);
		
		Exam exam3 = new Exam();
		exam3.id = 3;
		exam3.code = "Dề thi số 03";
		exam3.title = "Tiêu đề của đề số 3";
		exam3.categoryID = cq3;
		exam3.duration = "90p";
		exam3.creatorID = acc2;
		exam3.createDate = LocalDate.of(2020, 02, 10);
		
		System.out.println("Thông tin Exam");
		System.out.println("id: " + exam1.id);
		System.out.println("Code: " + exam1.code);
		System.out.println("Title: " + exam1.title);
		System.out.println("categoryID: " + exam1.categoryID.id);
		System.out.println("CreatorID: " + exam1.creatorID.id);
		System.out.println("CreateDate: " + exam1.createDate);
		System.out.println("\n" );
		
		// thêm dữ liệu vào class ExamQuesstion
		ExamQuestion eq1 = new ExamQuestion();
		eq1.examID = exam3;
		eq1.questionID = question2;
		
		ExamQuestion eq2 = new ExamQuestion();
		eq2.examID = exam2;
		eq2.questionID = question3;
		
		ExamQuestion eq3 = new ExamQuestion();
		eq3.examID = exam3;
		eq3.questionID = question1;
		
		System.out.println("Thông tin ExamQuestion");
		System.out.println("ExamID: " + eq1.examID.id);
		System.out.println("QuestionID: " + eq1.questionID.id);
		System.out.println("\n" );
				
	}

	

}
