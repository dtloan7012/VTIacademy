package backend.datalayer;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Utils.JdbcUtils;
import Utils.MessageProperties;
import entiny.Employee;
import entiny.Manager;
import frontend.main;

/**
 * This class is .
 * 
 * @Description: .
 * @author: ThuLoan
 * @version: 1.0
 */
public class UserRepository implements IUserRepository {

	private JdbcUtils jdbcUtils;
	private MessageProperties messageProperties;

	public UserRepository() throws IOException {
		jdbcUtils = new JdbcUtils();
		messageProperties = new MessageProperties();

	}

	public void createEmployee(String firstName, String lastName, String phone, String email, String password,
			String projectName, String proSkill)
			throws SQLException, FileNotFoundException, ClassNotFoundException, IOException {

		Connection connection = jdbcUtils.connect();
		//
		String sql = "INSERT INTO Employee( firstName , LastName , Phone , Email,`password`, projectName, proSkill   ) "
				+ "VALUES 			( ? , ? , ?  , ? , ? , ? , ? ) ";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);

//				 set parameter

		preparedStatement.setString(1, firstName);
		preparedStatement.setString(2, lastName);
		preparedStatement.setString(3, phone);
		preparedStatement.setString(4, email);
		preparedStatement.setString(5, password);
		preparedStatement.setString(6, projectName);
		preparedStatement.setString(7, proSkill);

		// Step 4: execute query

		int check = preparedStatement.executeUpdate();

		// Check create success or false
		System.out.println(check > 0 ? messageProperties.getProperty("employee.insert.complete")
				: messageProperties.getProperty("employee.insert.false"));

		// disconnect
		jdbcUtils.disconnect();
	}

	public boolean isCheckMailExists(String email)
			throws FileNotFoundException, ClassNotFoundException, IOException, SQLException {

		// get connection
		Connection connection = jdbcUtils.connect();
		// Create a statement object
		String sql = "SELECT 1 FROM employee WHERE email = ?";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		// set parameter
		preparedStatement.setString(1, email);
		// Step 4: execute query
		ResultSet resultSet = preparedStatement.executeQuery();

		// Step 5: handling result set
		if (resultSet.next()) {
			// disconnect
			jdbcUtils.disconnect();
			return true;

		} else {
			// disconnect
			jdbcUtils.disconnect();
			return false;
		}

	}

	public boolean isCheckLogin(Manager email, String password)
			throws SQLException, FileNotFoundException, ClassNotFoundException, IOException {
		// get connection
		Connection connection = jdbcUtils.connect();
		// Create a statement object
		String sql = "SELECT 1 FROM Manager WHERE email = ? AND `password` = ? ";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		// set parameter
		preparedStatement.setObject(1, email);
		preparedStatement.setObject(2, password);

		// Step 4: execute query
		ResultSet resultSet = preparedStatement.executeQuery();

		// Step 5: handling result set
		if (resultSet.next()) {
			// disconnect
			jdbcUtils.disconnect();
			return true;

		} else {
			// disconnect
			jdbcUtils.disconnect();
			return false;
		}

	}

	public boolean isCheckLogin(Employee email, String password)
			throws SQLException, FileNotFoundException, ClassNotFoundException, IOException {
		// get connection
		Connection connection = jdbcUtils.connect();
		// Create a statement object
		String sql = "SELECT 1 FROM employee WHERE email = ? AND `password` = ? ";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		// set parameter
		preparedStatement.setObject(1, email);
		preparedStatement.setObject(2, password);

		// Step 4: execute query
		ResultSet resultSet = preparedStatement.executeQuery();

		// Step 5: handling result set
		if (resultSet.next()) {
			// disconnect
			jdbcUtils.disconnect();
			return true;

		} else {
			// disconnect
			jdbcUtils.disconnect();
			return false;
		}

	}

	/**
	 *
	 */
	public void createManager(String firstName, String lastName, String phone, String email, String password,
			byte expInYear) throws SQLException, FileNotFoundException, ClassNotFoundException, IOException {

		Connection connection = jdbcUtils.connect();
		//
		String sql = "INSERT INTO manager( firstName , LastName , Phone , Email, `Password` , ExpInYear     ) "
				+ "VALUES 			( ? , ? , ?  , ? , ?  , ?  ) ";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);

//				 set parameter

		preparedStatement.setString(1, firstName);
		preparedStatement.setString(2, lastName);
		preparedStatement.setString(3, phone);
		preparedStatement.setString(4, email);
		preparedStatement.setString(5, password);
		preparedStatement.setByte(6, expInYear);

		// Step 4: execute query

		int check = preparedStatement.executeUpdate();

		// Check create success or false
		System.out.println(check > 0 ? messageProperties.getProperty("manager.insert.complete")
				: messageProperties.getProperty("manager.insert.false"));

		// disconnect
		jdbcUtils.disconnect();
	}

}
