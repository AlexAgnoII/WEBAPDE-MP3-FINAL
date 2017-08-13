package bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "users")
public class Users {
	@Id
	@Column
	private String users_username;
	@Column
	private String users_password;
	@Column
	private String users_shortdescription;
	
	@Override
	public String toString() {
		return "User [users_username=" + users_username + ", users_password=" + users_password + ", users_description="
				+ users_shortdescription + "]";
	}
	public String getUsers_username() {
		return users_username;
	}
	public void setUsers_username(String users_username) {
		this.users_username = users_username;
	}
	public String getUsers_password() {
		return users_password;
	}
	public void setUsers_password(String users_password) {
		this.users_password = users_password;
	}
	public String getUsers_description() {
		return users_shortdescription;
	}
	public void setUsers_description(String users_description) {
		this.users_shortdescription = users_description;
	}
	
}
