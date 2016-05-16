package il.ac.hit.finalproject;

import javax.persistence.*;

@Entity
@Table(name = "Users")
public class User {

	
	private int id;
	
	
	private String Username;
	
	
	private String Password;
	
	
	private String Email;
	
	
	private boolean IsAdmin;

	public User(int id, String username, String password, String email, boolean isAdmin) {
		super();
		this.id = id;
		Username = username;
		Password = password;
		Email = email;
		IsAdmin = isAdmin;
	}

	public User() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public boolean isIsAdmin() {
		return IsAdmin;
	}

	public void setIsAdmin(boolean isAdmin) {
		IsAdmin = isAdmin;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", Username=" + Username + ", Password=" + Password + ", Email=" + Email
				+ ", IsAdmin=" + IsAdmin + "]";
	}
	
	
	
	
	
	
}
