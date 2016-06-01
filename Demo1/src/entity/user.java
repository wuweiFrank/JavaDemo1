package entity;

public class user {
	private int m_id;
	private String m_name;
	private String m_password;
	
	public void setId(int id){
		m_id=id;
	}
	public void setName(String name){
		m_name=name;
	}
	public void setPassword(String password){
		m_password=password;
	}

	public String getName(){
		return m_name;
	}
	public String getPassword(){
		return m_password;
	}
	public int getId(){
		return m_id;
	}
}
