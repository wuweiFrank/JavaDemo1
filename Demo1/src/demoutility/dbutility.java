package demoutility;

import java.sql.*;
import java.util.*;
import java.io.*;

public class dbutility {
	//关闭数据库链接
	public void closeConn(Connection conn){
		try{
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	//打开数据库连接
	public Connection openConnection(){
		//实例化Properties
		Properties prop = new Properties();
		
		String driver = null;	//驱动
		String url = null;		//url
		String username = null;	//用户名
		String password = null;	//密码
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
