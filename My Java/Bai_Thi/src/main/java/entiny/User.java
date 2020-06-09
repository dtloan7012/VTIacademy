package entiny;

public class User {

	private String firstName;
	private String lastName;
	private String phone;
	private String email;
	private String password;

	


	public User(String firstName, String lastName, String phone, String email, String password) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.phone = phone;
		this.email = email;
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [firstName=" + firstName + ", lastName=" + lastName + ", phone=" + phone + ", email=" + email
				+ "]";
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	
}
