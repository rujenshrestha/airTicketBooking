package user;

import java.sql.*;
import java.util.*;

import bank.Bank;
import dbconnection.DbConnection;

public class User {
 
		private Connection con=null;
		private PreparedStatement stmt =null;
		private ResultSet rs =null;
		private List result=null;
		private Map resultMap =null;
		private String sql="";
	    
		DbConnection dbcon = new DbConnection();
		
		
		public List getUserList(){
			try{
				
				con = dbcon.getDbConnection() ;
				sql ="select * from users";
				stmt = con.prepareStatement(sql);  
				rs = stmt.executeQuery();
				
				result  = new ArrayList();	
				while ( rs.next() ) {
					resultMap = new HashMap();
					
					resultMap.put("usrId",rs.getString("usr_id"));
					resultMap.put("firstName",rs.getString("first_name"));
					resultMap.put("middleName",rs.getString("middle_name"));
					resultMap.put("lastName",rs.getString("last_name"));

					result.add(resultMap);
				}
			} catch (SQLException errSql){
				System.out.println("SQL Exception in getUserList:"+errSql);			
			} catch (Exception err){
				System.out.println("Exception in getUserList:"+err);
			} finally {
				try { 
					if (rs != null) rs.close();
					if (stmt != null) stmt.close();
					if (con != null) con.close();
				} catch (SQLException errSql){}
			}
			
			return result;
			      
		}


		public List getUserDetail(String usrId){
			try{
				
				con = dbcon.getDbConnection() ;
				sql ="select * from users where usr_id = ?";
				stmt = con.prepareStatement(sql); 
				stmt.setInt(1,Integer.parseInt(usrId));
				rs = stmt.executeQuery();

				
				result  = new ArrayList();	
				if ( rs.next() ) {
					resultMap = new HashMap();
					
					resultMap.put("firstName",rs.getString("first_name"));
					resultMap.put("middleName",rs.getString("middle_name"));
					resultMap.put("lastName",rs.getString("last_name"));
					resultMap.put("address",rs.getString("address"));
					resultMap.put("phone",rs.getString("phone"));
					resultMap.put("mobileNo",rs.getString("mobile_no"));
					resultMap.put("emailId",rs.getString("email_id"));
					resultMap.put("bankId",rs.getString("bank_id"));
					resultMap.put("accountNo",rs.getString("account_no"));
					
					sql="select * from authentication where id = ? and role_cd ='U'";
					stmt = con.prepareStatement(sql);
					stmt.setInt(1,Integer.parseInt(usrId));
					rs = stmt.executeQuery();
					if(rs.next()){
						resultMap.put("username", rs.getString("username"));
						resultMap.put("pwd", rs.getString("pwd"));
						resultMap.put("statusCd", rs.getString("status_cd"));
					}
					
					result.add(resultMap);
				}
			} catch (SQLException errSql){
				System.out.println("SQL Exception in getUserDetail:"+errSql);			
			} catch (Exception err){
				System.out.println("Exception in getUserDetail:"+err);
			} finally {
				try { 
					if (rs != null) rs.close();
					if (stmt != null) stmt.close();
					if (con != null) con.close();
				} catch (SQLException errSql){}
			}
			
			return result;
			      
		}
		
		public void updateUserDetail(String usrId,String firstName,String middleName,String lastName,
									  String address,String phone,String bankId,String accountNo,
									  String mobileNo,String emailId){
			try{
				
				con = dbcon.getDbConnection() ;
				sql ="update users set first_name=?,middle_name=?,last_name=?,address=?,phone=?,"
						+ "mobile_no=?,email_id=?,account_no=?,bank_id=?"
						+" where usr_id=?";
				stmt = con.prepareStatement(sql); 
				
				stmt.setString(1,firstName);
				stmt.setString(2,middleName);
				stmt.setString(3,lastName);
				stmt.setString(4,address);
				stmt.setInt(5,Integer.parseInt(phone));
				stmt.setInt(6,Integer.parseInt(mobileNo));
				stmt.setString(7,emailId);
				stmt.setString(8,accountNo);
				stmt.setInt(9,Integer.parseInt(bankId));
				stmt.setInt(10, Integer.parseInt(usrId));
				stmt.executeUpdate();
				
			} catch (SQLException errSql){
				System.out.println("SQL Exception in updateUserDetail:"+errSql);			
			} catch (Exception err){
				System.out.println("Exception in updateUserDetail:"+err);
			} finally {
				try { 
					if (rs != null) rs.close();
					if (stmt != null) stmt.close();
					if (con != null) con.close();
				} catch (SQLException errSql){}
			}
			
			      
		}
		
		
		public void addUser(String firstName,String middleName,String lastName,String address,
						    String phone,String mobileNo,String emailId,String bankId,
						    String accountNo,String username,String password){
			try{
			
				con = dbcon.getDbConnection() ;
				sql ="insert into users(first_name,middle_name,last_name,address,phone,mobile_no,"
						+ "email_id,bank_id,account_no) "
					+ "values(?,?,?,?,?,?,?,?,?)";
				stmt = con.prepareStatement(sql); 
				
				stmt.setString(1,firstName);
				stmt.setString(2,middleName);
				stmt.setString(3,lastName);
				stmt.setString(4,address);
				stmt.setInt(5,Integer.parseInt(phone));
				stmt.setLong(6,Long.parseLong(mobileNo));
				stmt.setString(7,emailId);
				stmt.setInt(8,Integer.parseInt(bankId));
				stmt.setString(9,accountNo);

				stmt.executeUpdate();
				
				sql="select usr_id from users where first_name=? and last_name=? and mobile_no=?";
				stmt = con.prepareStatement(sql);
				stmt.setString(1,firstName);
				stmt.setString(2,lastName);
				stmt.setLong(3,Long.parseLong(mobileNo));
				rs = stmt.executeQuery();
				
				if(rs.next()){
					String usrId = rs.getString("usr_id");
					sql="insert into authentication(username,pwd,role_cd,status_cd,id) "
						+ "values(?,?,'U','E',?)";
					stmt = con.prepareStatement(sql);
					stmt.setString(1,username);
					stmt.setString(2,password);
					stmt.setInt(3,Integer.parseInt(usrId));
					stmt.executeUpdate();
				}
			
			} catch (SQLException errSql){
				System.out.println("SQL Exception in addUser:"+errSql);			
			} catch (Exception err){
				System.out.println("Exception in addUser:"+err);
			} finally {
				try { 
						if (rs != null) rs.close();
						if (stmt != null) stmt.close();
						if (con != null) con.close();
				} catch (SQLException errSql){}
			}
			
			
			}
		
		
		public void deleteUser(String usrId){
			try{
				
				con = dbcon.getDbConnection() ;
				sql ="delete from users where usr_id = ?";
				stmt = con.prepareStatement(sql); 
				
				stmt.setInt(1, Integer.parseInt(usrId));
				stmt.executeUpdate();
			
			} catch (SQLException errSql){
				System.out.println("SQL Exception in deleteUser:"+errSql);			
			} catch (Exception err){
				System.out.println("Exception in deleteUser:"+err);
			} finally {
				try { 
						if (rs != null) rs.close();
						if (stmt != null) stmt.close();
						if (con != null) con.close();
				} catch (SQLException errSql){}
			}
			
		}
	 }


		




