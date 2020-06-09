package backend.businesslayer;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

import backend.datalayer.IUserRepository;
import backend.datalayer.UserRepository;
import entiny.Employee;
import entiny.Manager;

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
public class UserService implements IUserService {
	private IUserRepository repository;

	public UserService() throws IOException {
		repository = new UserRepository();
	}

	public void createEmployee(String firstName, String lastName, String phone, String email, String password,
			String projectName, String proSkill)
			throws SQLException, FileNotFoundException, ClassNotFoundException, IOException {
		repository.createEmployee(firstName, lastName, phone, email, password, projectName, proSkill);

	}

	public void createManager(String firstName, String lastName, String phone, String email, String password,
			byte expInYear) throws SQLException, FileNotFoundException, ClassNotFoundException, IOException {
		repository.createManager(firstName, lastName, phone, email, password, expInYear);

	}

	public boolean isCheckMailExists(String email)
			throws SQLException, FileNotFoundException, ClassNotFoundException, IOException {

		return repository.isCheckMailExists(email);
	}

	public boolean isCheckLogin(Manager email, String password)
			throws SQLException, FileNotFoundException, ClassNotFoundException, IOException {
		return repository.isCheckLogin(email, password);
	}

	public boolean isCheckLogin(Employee email, String password)
			throws SQLException, FileNotFoundException, ClassNotFoundException, IOException {

		return repository.isCheckLogin(email, password);
	}

}
