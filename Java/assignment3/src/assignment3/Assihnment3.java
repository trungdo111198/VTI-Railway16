package assignment3;

import java.time.LocalDate;
import java.util.Date;
import java.util.Random;
import java.util.Scanner;

public class Assihnment3 {

	public static void main(String[] args) {
//		Datatypequestion1();
//		Datatypequestion2();
//		Datatypequestion3();
//		Datatypequestion4();
//		defaultValueQuestion1();
//		boxingUnboxingQuestion1();
//		boxingUnboxingQuestion2();
//		boxingUnboxingQuestion3();
//		stringQuestion1();
//		stringQuestion2();
//		stringQuestion3();
//		stringQuestion4();
//		stringQuestion6();
//	
		stringQuestion7();
//		stringQuestion8();
//		stringQuestion10();
//		stringQuestion11();
//		stringQuestion13();
//		stringQuestion14();
//		stringQuestion15();
//		stringQuestion16();

	}

	private static void stringQuestion16() {
		String s = "asdfgjjebaa";
		int a = 2;
		if (s.length() % 2 != 0) {
			System.out.println("ko");
		}

	}

	private static void stringQuestion15() {
		String s = "   I am developer    ";
		String[] a = s.trim().split(" ");
		String b = "";
		for (int i = a.length; i >= 1; i--) {
			b = (b + a[i - 1] + " ");

		}
		System.out.println(b.trim());
	}

	private static void stringQuestion14() {
		String s = "VTI Academy";
		System.out.println(s.replace("e", "*"));
	}

	private static void stringQuestion13() {
		String s = "abc1";
		if (s.contains("\\d+")) {
			System.out.println("False");
		} else {
			System.out.println("True");
		}
	}

	private static void stringQuestion11() {
		String s = "hahahahahahahahaa";
		int number = 0;
		for (int i = 0; i < s.length(); i++) {
			char location = s.charAt(i);
			char kiTu = 'a';
			if (location == kiTu) {
				number = number + 1;
			}
		}
		System.out.println(number);
	}

	// Question 12 lm o question 10
	private static void stringQuestion10() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("moi ban nhap vao chuoi 1: ");
		String a = scanner.nextLine();
		StringBuffer b = new StringBuffer(a);
		String c = b.reverse().toString();
		System.out.println("moi ban nhap chuoi thu 2: ");
		String d = scanner.nextLine();
		System.out.println(d.equals(c) ? "OK" : "KO");
	}

	private static void stringQuestion8() {
		// thêm dữ liệu vào class Group
		Group group1 = new Group();
		group1.id = 1;
		group1.name = "Java developernemt";

		Group group2 = new Group();
		group2.id = 2;
		group2.name = "Developement";

		Group group3 = new Group();
		group3.id = 3;
		group3.name = "Java";
		Group[] lsGroup = { group1, group2, group3 };
		for (Group group : lsGroup) {
			if (group.name.startsWith("Java") == true) {
				System.out.println("Group id: " + group.id);
			}
		}
		// voi bai 9 thay (group.name.startsWith("Java")== true)
		// bang cau (group.name.subtring(0,4) == "Java")
	}

	// chua lm dc question7
	private static void stringQuestion7() {
		Scanner sacnner = new Scanner(System.in);

		System.out.println("moi ban nhap vao ten");

		String a = sacnner.nextLine();
		String b = a.trim();

		String[] c = b.split("\\s+");
		String s = "";
		for (int i = 0; i < c.length; i++) {
			String d = c[i].trim().substring(0, 1).toUpperCase();
			String e = c[i].trim().substring(1);
			s = s + (d + e) + " ";
		}
		System.out.println(s.trim());
	}

	private static void stringQuestion6() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("moi ban nhap vao ho ten: ");
		String a = scanner.nextLine();
		String[] b = a.split("\\s+");
		for (String string : b) {
			System.out.println(string);

		}
	}

	private static void stringQuestion4() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("moi nhap vao ten");
		String a = scanner.nextLine();
		for (int i = 0; i < a.length(); i++) {
			String b = a.substring(i, i + 1).toUpperCase();
			System.out.println("ky tu thu " + (i + 1) + " la: " + b);

		}
	}

	private static void stringQuestion3() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("moi ban nhap vao ten:");
		String ten = scanner.nextLine();
		String chuCaiDau = ten.substring(0, 1).toUpperCase();
		String s = chuCaiDau.concat(ten.substring(1));
		System.out.println(s);
	}

	private static void stringQuestion2() {
		String s1 = "ten toi la: ";
		String s2 = "abc";
		String s = s1.concat(s2);
		System.out.println(s);
	}

	private static void stringQuestion1() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("moi ban nhap vap chuoi");
		String a = scanner.nextLine();
		System.out.println("so luong cac tu trong chuoi la: " + a.length());
	}

	private static void boxingUnboxingQuestion3() {
		Integer a = 1234567;
		int b = a.intValue();
		System.out.println(b);

	}

	private static void boxingUnboxingQuestion2() {
		String a = "1234567";
		int b = Integer.parseInt(a);
		System.out.println(b);

	}

	private static void boxingUnboxingQuestion1() {
		Integer a = 5000;
		float b = a.floatValue();
		System.out.printf("%.2f", b);

	}

	private static void defaultValueQuestion1() {
		Account[] listaccounts = new Account[5];
		for (int i = 0; i < listaccounts.length; i++) {
			listaccounts[i] = new Account();
			listaccounts[i].email = "Email 1" + (i + 1);
			listaccounts[i].userName = "User name 1" + (i + 1);
			listaccounts[i].fullName = "Full name 1" + (i + 1);
			listaccounts[i].createDate = LocalDate.now();
		}
		for (int i = 0; i < listaccounts.length; i++) {
			System.out.printf("Email: %20s,%n", listaccounts[i].email);
			System.out.printf("Full name: %20s,%n", listaccounts[i].fullName);
			System.out.printf("User name: %20s,%n", listaccounts[i].userName);
			System.out.printf("Create Date: %16s,%n", listaccounts[i].createDate);
		}
	}

	private static void Datatypequestion4() {
		Scanner sacnner = new Scanner(System.in);
		System.out.println("nhap vao so thu nhat");
		int a = sacnner.nextInt();
		System.out.println("nhap vao so thu 2");
		int b = sacnner.nextInt();
		System.out.println(a / b);

	}

	private static void Datatypequestion3() {
		Random random = new Random();
		int a = random.nextInt(99999) + 1;
		int b = a % 100;
		// System.out.println(b);
		String c = String.valueOf(a);
		String d = c.substring(3, 5);
		System.out.println(d);

	}

// 	question 2 chua lm dc
	private static void Datatypequestion2() {
		Random random = new Random();
		int a = random.nextInt(99999) + 1;
		System.out.printf("%5d", a);
	}

	private static void Datatypequestion1() {
		float account1 = 5240.5f;
		float account2 = 10970.055f;
		int a = (int) account1;
		int b = (int) account2;
		System.out.println(a);
		System.out.println(b);
	}

}
