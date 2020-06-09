package Utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

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

public class MessageProperties {

	private Properties properties;

	public MessageProperties() throws FileNotFoundException, IOException {
		properties = new Properties();
		properties.load(new FileInputStream(DatabaseProperties.RESOURCE_FOLDER_URL + "message.properties"));
	}

	public String getProperty(String key) {
		return properties.getProperty(key);
	}

}
