package entiny;

public class Employee extends User {
	private String projectName;
	private String proSkill;
	public Employee(String firstName, String lastName, String phone, String email, String password, String projectName,
			String proSkill) {
		super(firstName, lastName, phone, email, password);
		this.projectName = projectName;
		this.proSkill = proSkill;
	}
	public String getProjectName() {
		return projectName;
	}
	public String getProSkill() {
		return proSkill;
	}

	
	

}
