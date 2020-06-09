package Utils;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * This class is .
 * 
 * @Description:
 * @author: ThuLoan
 * @create_date: May 28, 2020
 * @version: 1.0
 * @modifer: ThuLoan
 * @modifer_date: May 29, 2020
 */
public class ScannerUtils {

	private static Scanner scanner = new Scanner(System.in);

	public static byte inputExpInYear() {
		while (true) {
			byte expInYear = scanner.nextByte();
			if (expInYear >= 0 && expInYear <= 20) {
				return expInYear;
			} else {
				System.out.println("Wrong inputing! ExpInYear is only entered from 0 to 20");
			}
		}
	}

	public static String inputName() {
		return inputString("Please input a name, please input again.");
	}

	public static int inputInt() {
		return inputInt("Please input a number as int, please input again");
	}

	public static int inputInt(String errorMessage) {
		while (true) {
			try {
				return Integer.parseInt(scanner.nextLine().trim());
			} catch (Exception e) {
				System.err.println(errorMessage);
			}
		}
	}

	public static String inputProSkill() {
		while (true) {
			String proSkill = scanner.nextLine();
			if (proSkill != null && (proSkill.contains("Testing System") || proSkill.contains("CRM")
					|| proSkill.contains("TimeSheet"))) {
				return proSkill;

			} else {
				System.out.println("Wrong inputing! Please input \"Testing System\", \"CRM\" or \"TimeSheet\"   ");
			}

		}

	}

	public static String inputString(String errorMessage) {
		while (true) {
			String input = scanner.nextLine().trim();
			if (!input.isEmpty()) {
				return input;
			} else {
				System.err.println(errorMessage);
			}
		}
	}

	public static String inputEmail(String errorMessage) {
		while (true) {
			String email = scanner.nextLine().trim();
			if (email != null && email.contains("@vti.com.vn") && !email.contains(" ")) {

				return email;
			} else {
				System.out.println(errorMessage);

			}
		}
	}

	public static String inputPhone(String errorMessage) {
		while (true) {
			String phone = scanner.nextLine();
			String regex = "^0\\d{9,12}$";
			Pattern pattern = Pattern.compile(regex);
			Matcher matcher = pattern.matcher(phone);
			if (matcher.find()) {

				return phone;
			} else {
				System.out.println(errorMessage);
			}

		}

	}

	public static String inputPassword() {
		while (true) {
			String password = scanner.nextLine();
			String regex = "^[A-Z]+\\w{6,12}$";
			Pattern pattern = Pattern.compile(regex);
			Matcher matcher = pattern.matcher(password);
			if (matcher.find()) {

				return password;
			} else {
				System.out.println("Độ dài Password từ 6-12 kí tự, có ít nhất 1 kí tự viết hoa ");
			}

		}

	}

	public static String projectName() {
		while (true) {
			String projectNames = scanner.nextLine();

			if (projectNames != null
					&& (projectNames.contains("dev") || projectNames.contains("test") || projectNames.contains("java"))
					|| projectNames.contains("sql")) {

				return projectNames;

			} else {
				System.out.println("Wrong inputing! Please input \"dev\", \"test\" or \"java\" ,\"sql\"  ");
			}

		}
	}

}
