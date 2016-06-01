package demoutility;

import java.sql.*;
import java.util.*;
import java.io.*;

public class dbutility {
	//�ر����ݿ�����
	public void closeConn(Connection conn){
		try{
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	//�����ݿ�����
	public Connection openConnection(){
		//ʵ����Properties
		Properties prop = new Properties();
		
		String driver = null;	//����
		String url = null;		//url
		String username = null;	//�û���
		String password = null;	//����
		String properties="DBConfig.properties";
		try{
			//prop.load(this.getClass().getClassLoader().getResourceAsStream(properties));
			InputStream istream=this.getClass().getClassLoader().getResourceAsStream(properties);
			prop.load(istream);
			driver = prop.getProperty("driver");
			url	   = prop.getProperty("url");
			username=prop.getProperty("username");
			password=prop.getProperty("password");
			Class.forName(driver);
			return DriverManager.getConnection(url,username,password);
		}catch (Exception e){
			e.printStackTrace();
		}
		return null;		
	}
}