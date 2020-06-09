package backend.presentation;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

import Utils.MessageProperties;
import backend.businesslayer.IUserService;
import backend.businesslayer.UserService;
import entiny.Employee;
import entiny.Manager;

/**
 * @author ThuLoan
 *
 */
public class UserController {

	private IUserService service;
	private MessageProperties messageProperties;

	public UserController() throws IOException {
		service = new UserService();
		messageProperties = new MessageProperties();

	}

	public void createEmployee(String firstName, String lastName, String phone, String email, String password,
			String projectName, String proSkill) throws Exception {
		// check Account id exist
		if (service.isCheckMailExists(email)) {
			throw new Exception(messageProperties.getProperty("user.email.is.Exists") + email);
		}

		service.createEmployee(firstName, lastName, phone, email, password, projectName, proSkill);
	}

	public void createManager(String firstName, String lastName, String phone, String email, String password,
			byte expInYear) throws FileNotFoundException, ClassNotFoundException, SQLException, IOException, Exception {

		// check Account id exist
		if (service.isCheckMailExists(email)) {
			throw new Exception(messageProperties.getProperty("user.email.is.Exists") + email);
		}

		service.createManager(firstName, lastName, phone, email, password, expInYear);
	}

	public boolean isCheckLogin(Manager email, String password)
			throws SQLException, FileNotFoundException, ClassNotFoundException, IOException {
		return service.isCheckLogin(email, password);
	}

	public boolean isCheckLogin(Employee email, String password)
			throws SQLException, FileNotFoundException, ClassNotFoundException, IOException {
		return isCheckLogin(email, password);
	}

	public boolean isCheckMailExists(String email)
			throws FileNotFoundException, ClassNotFoundException, SQLException, IOException {
		return service.isCheckMailExists(email);
	}

}
