package frontend;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

import Utils.ScannerUtils;
import backend.presentation.UserController;

public class Program {
	
	/**
	 * This class is .
	 * 
	 * @Description: .
	 * @author: ThuLoan
	 * @create_date: May 28, 2020
	 * @version: 1.0
	 * @modifer: ThuLoan
	 * @modifer_date: May 29, 2020
	 */
	public static void main(String[] args) throws ClassNotFoundException, SQLException, Exception {
		createUser();

	}

	private static UserController userController;

	public static void createUser() throws ClassNotFoundException, SQLException, Exception {
		userController = new UserController();

		int choose;
		do {
			menuUser();

			choose = ScannerUtils.inputInt();
			switch (choose) {
			case 1:
//				Create manager
				System.out.println("=========Create manager=========");
				createMannagers();
				break;

			case 2:
				// Create employee
				System.out.println("=========Create employee=========");
				createEmployees();
				break;

			default:
				System.out.println("input wrong ! please input again :))");
				break;
			}
		} while (choose != 2);

	}

	private static void menuUser() {
		System.out.println("============MENU===========");
		System.out.println("=|1. Create manager    	 |=");
		System.out.println("=|2. Create employee  	 |=");
		System.out.println("=|3. Exit      			 |=");
		System.out.println("===========================");
		System.out.println("You choose:                ");
	}

	private static void createMannagers()
			throws FileNotFoundException, ClassNotFoundException, SQLException, IOException, Exception {
		System.out.println("Input firstName: ");
		String firstName = ScannerUtils.inputString("Please input email as String!");

		System.out.println("Input lastName: ");
		String lastName = ScannerUtils.inputString("Please input username as String!");

		System.out.println("Input phone: ");
		String phone = ScannerUtils.inputPhone("In the format \"0 ...\" and lengths from 9-12");

		System.out.println("Input email: ");
		String email = ScannerUtils.inputEmail("In the format \"....@vti.com.vn\"");

		System.out.println("Input password: ");
		String password = ScannerUtils.inputPassword();

		System.out.println("Input expInYear");
		byte expInYear = ScannerUtils.inputExpInYear();

		userController.createManager(firstName, lastName, phone, email, password, expInYear);
	}

	private static void createEmployees() throws Exception {

		System.out.println("Input firstName: ");
		String firstName = ScannerUtils.inputString("Please input email as String!");

		System.out.println("Input lastName: ");
		String lastName = ScannerUtils.inputString("Please input username as String!");

		System.out.println("Input phone: ");
		String phone = ScannerUtils.inputPhone("In the format \"0 ...\" and lengths from 9-12");

		System.out.println("Input email: ");
		String email = ScannerUtils.inputEmail("In the format \"....@vti.com.vn\"");

		System.out.println("Input password: ");
		String password = ScannerUtils.inputPassword();

		System.out.println("Input projectName");

		String projectName = ScannerUtils.projectName();

		System.out.println("Input proSkill");
		String proSkill = ScannerUtils.inputProSkill();

		userController.createEmployee(firstName, lastName, phone, email, password, projectName, proSkill);
	}

}
