package entiny;

public class Manager extends User {
	private byte expInYear;

	public Manager(String firstName, String lastName, String phone, String email, String password, byte expInYear) {
		super(firstName, lastName, phone, email, password);
		this.expInYear = expInYear;
	}

	public byte getExpInYear() {
		return expInYear;
	}

	


}
