package vo;

public class movieVO {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	
	
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public String getPhone() {
		return phone;
	}
	public movieVO(String id, String pw, String name, String email, String phone) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone = phone;
	}
	
	
}
