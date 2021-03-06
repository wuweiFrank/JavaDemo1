package impl;

import entity.user;
import java.sql.*;
import demoutility.dbutility;

public class UserDao {
	public user login(String username,String password){
		String sql = "select id, name,password from user where name=? and password=?";
		dbutility util = new dbutility();
		Connection conn = util.openConnection();
		
		try{
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, username);
			psmt.setString(2, password);
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()){
				int id =rs.getInt(1);
				user u=new user();
				u.setId(id);
				u.setName(username);
				u.setPassword(password);
				return u;
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			util.closeConn(conn);
		}
		return null;
	}
}
