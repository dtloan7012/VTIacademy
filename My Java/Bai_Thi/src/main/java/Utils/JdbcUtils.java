package Utils;

/**
 * This class is .
 * 
 * @Description: .
 * @author: ThuLoan
 * @create_date: May 27, 2020
 * @version: 1.0
 * @modifer: ThuLoan
 * @modifer_date: May 29, 2020
 */

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcUtils {

	private Connection connection;

	private DatabaseProperties databaseproperties;

	public JdbcUtils() throws IOException {
		databaseproperties = new DatabaseProperties();
	}

	public void connectForTesting()
			throws FileNotFoundException, IOException, ClassNotFoundException, SQLException, SQLException {

		String url = databaseproperties.getProperty("url");
		String username = databaseproperties.getProperty("username");
		String password = databaseproperties.getProperty("password");

		// Step 1: register the driver class with DriverManager
		Class.forName(databaseproperties.getProperty("driver"));

		// Step 2: get a Database Connection
		connection = DriverManager.getConnection(url, username, password);

		System.out.println("Connect success!");
	}

	public Connection connect()
			throws FileNotFoundException, IOException, ClassNotFoundException, SQLException, SQLException {

		String url = databaseproperties.getProperty("url");
		String username = databaseproperties.getProperty("username");
		String password = databaseproperties.getProperty("password");

		// Step 1: register the driver class with DriverManager
		Class.forName(databaseproperties.getProperty("driver"));

		// Step 2: get a Database Connection
		connection = DriverManager.getConnection(url, username, password);

		return connection;
	}

	public void disconnect() throws SQLException {
		connection.close();
	}

}
