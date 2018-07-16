package daoImp;



import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import dao.ajaxD;
import user.user;

public class ajaxDimp implements ajaxD {
	@Override
	public String save(user u) {
		// TODO Auto-generated method stub
		//user use = new user();
		String username = u.getUsername();
		String password = u.getPassword();
		String mobliephone = u.getMobliephone();
		String url = "jdbc:mysql://127.0.0.1:3306/ajax?useUnicode=true&amp;characterEncoding=utf-8";
		String sql = "insert into user(username,password,mobliephone)values( '"+ username +"','"+ password +"','"+mobliephone+"')";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("驱动加载成功");
			Connection conn=(Connection) DriverManager.getConnection(url, "root", "123456");
			System.out.println("链接数据库成功");
			System.out.println(username + password + mobliephone );
			Statement st = (Statement) conn.createStatement();
			st.execute(sql);
			st.close();
	        conn.close();
			}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
			}
		
		return null;
	}

	@Override
	public String query(user u) {
		// TODO Auto-generated method stub
		String username = u.getUsername();
		String url = "jdbc:mysql://127.0.0.1:3306/ajax?useUnicode=true&amp;characterEncoding=utf-8";
		String sql = "select username from user where username ='"+ username +"'";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("驱动加载成功");
			Connection conn=(Connection) DriverManager.getConnection(url, "root", "123456");
			System.out.println("链接数据库成功");
			System.out.println(username);
			Statement st = (Statement) conn.createStatement();
			ResultSet rs =  st.executeQuery(sql);
			if( rs.next() ) {
				return username;
			}
			st.close();
	        conn.close();
			}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
			}
		return null;
	}

}
