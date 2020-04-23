import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalTime;

public class Program {
	public static void main(String[] args) {

		// Department
		Department sale = new Department();
		sale.id = 1;
		sale.name = "sale";

		Department manager = new Department();
		manager.id = 2;
		manager.name = "Manager";

		Department marketing = new Department();
		marketing.id = 2;
		marketing.name = "Marketing";

		// Position
		Position dev = new Position();
		dev.id = 1;
		dev.name = EnumPoisitionName.DEV;

		Position sm = new Position();
		sm.id = 2;
		sm.name = EnumPoisitionName.SCRUMMASTER;

		Position test = new Position();
		test.id = 3;
		test.name = EnumPoisitionName.TEST;

		Position pm = new Position();
		pm.id = 4;
		pm.name = EnumPoisitionName.PM;
		
		

		  // Account
		Account mai = new Account();
		mai.accountID = 1;
		mai.email = "mai.nguyenthi@gmail.com";
		mai.userName = "Mai";
		mai.fullName = "Nguyen Mai";
		mai.departments = sale ;
		mai.positions = dev;
		mai.createDate = LocalDate.of(2019, 12, 10);

		Account trang = new Account();
		trang.accountID = 2;
		trang.email = "trang.dinhthu@gmail.com";
		trang.userName = "Trang";
		trang.fullName = "Dinh Trang";
		trang.departments = manager ;
		trang.positions = test;
		trang.createDate = LocalDate.of(2019, 12, 10);

		
		Account tung = new Account();
		tung.accountID = 3;
		tung.email = "tung.phungvan@gmail.com";
		tung.userName = "Tung";
		tung.fullName = "Phung Tung";
		tung.departments = marketing ; 
		tung.positions = dev ;
		tung.createDate = LocalDate.of(2019, 12, 10);
	

		// Group
		Group group1 = new Group();
		group1.id = 1;
		group1.name = "Java Fresher";
		group1.CreatorID = trang;
		group1.CreateDate = LocalDate.of(2019, 06, 20);

		Group group2 = new Group();
		group2.id = 2;
		group2.name = "C# Fresher";
		group2.CreatorID = trang;
		group2.CreateDate = LocalDate.of(2020, 01, 11);
		
		Group group3 = new Group();
		group3.id = 3;
		group3.name = "HTML Fresher";
		group3.CreatorID = mai;
		group3.CreateDate = LocalDate.of(2020, 01, 11);
		
		// AccountOfGroup 
		Group[] groupOfAccount1 = {group1 , group3 } ;
		tung.groups = groupOfAccount1 ;
		Group[] groupOfAccount2 = {group2 , group3 } ; 
		mai.groups = groupOfAccount2 ;
		Group[] groupOfAccount3 = {group2 , group3, group1 } ;
		trang.groups = groupOfAccount3 ;
		
		// TypeQuestion
		TypeQuestion z = new TypeQuestion();
		z.id = 1;
		z.typeName = EnumTypeQuestion.ESSAY;

		TypeQuestion m = new TypeQuestion();
		m.id = 2;
		m.typeName = EnumTypeQuestion.MULTIPLECHOICE;

		// CategoryQuestion
		CategoryQuestion java = new CategoryQuestion();
		java.id = 1;
		java.name = "Java";

		CategoryQuestion net = new CategoryQuestion();
		net.id = 2;
		net.name = "NET";

		// Question
		Question Question1 = new Question();
		Question1.CategoryID = java;
		Question1.Content = "JAVA là gì";
		Question1.CreatorID = mai ;
		Question1.TypeName = z ;
		Question1.CreateDate = LocalDate.of(2019, 02, 15);
		Question1.id = 1 ;
		
		Question Question2 = new Question();
		Question2.CategoryID = java;
		Question2.Content = ".NET là gì";
		Question2.CreatorID = mai ;
		Question2.TypeName = m ;
		Question2.CreateDate = LocalDate.of(2020, 02, 15);
		Question2.id = 2 ;
		
			//Answer  
		Answer answer1 = new Answer ();
		answer1.answerID = 1 ;
		answer1.content = "JAVA là một ngôn ngữ lập trình hướng đối tượng (OOP) và dựa trên các lớp (class)";
		answer1.question = Question1 ;
		answer1.isCorrect = true ;
		
		Answer answer2 = new Answer ();
		answer2.answerID = 1 ;
		answer2.content = ".Net Framework là một khuôn khổ phần mềm chạy chủ yếu trên Microsoft Windows được phát triển bởi Microsoft.";
		answer2.question = Question2 ;
		answer2.isCorrect = true ;
		
			//Exam 
		Exam exam1 = new Exam ();
		exam1.category = java ;
		exam1.code = 001 ;
		exam1.createDate = LocalDate.of(2020,03,15);
		exam1.creator = mai ;
		exam1.duration = LocalTime.of(1,20,0);
		exam1.examID = 1 ;
		
		Exam exam2 = new Exam ();
		exam2.category = java ;
		exam2.code = 002 ;
		exam2.createDate = LocalDate.of (2020,03,15);
		exam2.creator = mai ;
		exam2.duration = LocalTime.of(1,20,0);
		exam2.examID = 2 ;
		
		 // ThôngTinDeparmentSale
		System.out.println("Thông tin phòng ban Sale :");
		System.out.println("id :" + sale.id);
		System.out.println("name :"+ sale.name);
		System.out.println("\n");
		
		// ThôngTinPoisition 
		System.out.println(" Thông tin Poistion Dev ");
		System.out.println("id :" + dev.id );
		System.out.println("name :" + dev.name);
		System.out.println("\n");
		
		// ThôngTinAccountTrang
		System.out.println("Thông tin account Trang");
		System.out.println("ID :"+ trang.accountID );
		System.out.println("UserName:" + trang.userName);
		System.out.println("FullName :" + trang.fullName );
		System.out.println("Email :"+ trang.email );
		System.out.println("Ngày tạo :" + trang.createDate );
		System.out.println("Department : " + trang.departments.name);
		System.out.println("Poisition : " + trang.positions.name ) ;
		for (Group groupOfAccount : groupOfAccount3) {
			System.out.println ("Group của trang :"  + groupOfAccount.name);
		}
		System.out.println("\n");
		
		// ThôngTinGroup1 
		System.out.println("Thông tin Group");
		System.out.println("ID :" + group1.id );
		System.out.println("Name :" + group1.name);
		System.out.println("\n");
		
		// ThôngTinTypeQuestion1
		System.out.println("Thông tin Type Question");
		System.out.println("ID :" + z.id);
		System.out.println("Name :" + z.typeName);
		System.out.println("\n");
		
		// ThôngTinCategoryQuestion
		System.out.println("Thông tin Category Question ");
		System.out.println("ID : " + java.id);
		System.out.println("Name +" + java.name);
		System.out.println("\n");
		
		//ThôngTinQuestion 
		System.out.println ("Thông tin Question");
		System.out.println ("ID :" + Question1.id);
		System.out.println("Câu hỏi :" + Question1.Content);
		System.out.println("ID người tạo câu hỏi :" + Question1.CategoryID.id);
		System.out.println("Ngày tạo câu hỏi :" + Question1.CreateDate);
		System.out.println("Kiểu câu hỏi :" + Question1.TypeName.typeName );
		System.out.println("\n");
		 
		// ThôngTinAnser
		System.out.println("Thông tin Anser");
		System.out.println("ID : "+answer1.answerID);
		System.out.println("Câu hỏi"  + answer1.question.Content );
		System.out.println("Name :" + answer1.content);
		System.out.println("Đúng hay sai :"   + answer1.isCorrect );
		System.out.println("\n");
		
		// ThôngTinExam 
		System.out.println("Thông tin Exam1");
		System.out.println("ID : " + exam1.examID);
		System.out.println("Code :" + exam1.code) ;
		System.out.println("Loại :" + exam1.category.name );
		System.out.println("Người tạo :" + exam1.creator.fullName);
		System.out.println("Ngày :"  + exam1.createDate);
		System.out.println("Thời gian thi:" + exam1.duration  );
		System.out.println("\n");
	}
}
