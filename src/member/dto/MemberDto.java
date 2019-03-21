package member.dto;

import java.io.Serializable;

public class MemberDto implements Serializable {
	private String id;
	private String name;
	private String pwd;
	private String email;
	private String phone;
	private String address;
	private int auth;
	
	public MemberDto() {
		
	}

	public MemberDto(String id, String name, String pwd, String email, String phone, String address, int auth) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.auth = auth;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", name=" + name + ", pwd=" + pwd + ", email=" + email + ", phone=" + phone
				+ ", address=" + address + ", auth=" + auth + "]";
	}
}
