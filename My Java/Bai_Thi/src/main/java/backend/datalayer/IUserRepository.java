package backend.datalayer;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

import entiny.Employee;
import entiny.Manager;

/**
 * @author ThuLoan
 *
 */
public interface IUserRepository {

	void createEmployee(String firstName, String lastName, String phone, String email, String password,
			String projectName, String proSkill)
			throws SQLException, FileNotFoundException, ClassNotFoundException, IOException;

	void createManager(String firstName, String lastName, String phone, String email, String password, byte expInYear)
			throws SQLException, FileNotFoundException, ClassNotFoundException, IOException;

	boolean isCheckMailExists(String email) throws FileNotFoundException, ClassNotFoundException, IOException, SQLException;

	boolean isCheckLogin(Manager email, String password)
			throws SQLException, FileNotFoundException, ClassNotFoundException, IOException;

	boolean isCheckLogin(Employee email, String password)
			throws SQLException, FileNotFoundException, ClassNotFoundException, IOException;

}
