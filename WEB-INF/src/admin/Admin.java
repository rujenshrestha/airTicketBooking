package admin;
 
import java.sql.*;
import java.util.*;

import dbconnection.DbConnection;


public class Admin{ 
	private Connection con=null;
	private PreparedStatement stmt =null;
	private ResultSet rs =null;
	private List result=null;
	private Map resultMap =null;
	private String sql="";
    
	DbConnection dbcon = new DbConnection();
	
	
	public List getAdminList(){
		try{
			
			con = dbcon.getDbConnection() ;
			sql ="select * from admin";
			stmt = con.prepareStatement(sql);  
			rs = stmt.executeQuery();
			
			result  = new ArrayList();	
			while ( rs.next() ) {
				resultMap = new HashMap();
				
				resultMap.put("admId",rs.getString("adm_id"));
				resultMap.put("fullName",rs.getString("fullname"));

				result.add(resultMap);
			}
		} catch (SQLException errSql){
			System.out.println("SQL Exception in getAdminList:"+errSql);			
		} catch (Exception err){
			System.out.println("Exception in getAdminList:"+err);
		} finally {
			try { 
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (SQLException errSql){}
		}
		
		return result;
		      
	}


	public List getAdminDetail(String admId){
		try{
			
			con = dbcon.getDbConnection() ;
			sql ="select * from admin where adm_id = ?";
			stmt = con.prepareStatement(sql); 
			stmt.setInt(1,Integer.parseInt(admId));
			rs = stmt.executeQuery();
			
			result  = new ArrayList();	
			if ( rs.next() ) {
				resultMap = new HashMap();
				
				resultMap.put("fullName",rs.getString("fullname"));
				resultMap.put("address",rs.getString("address"));
				resultMap.put("phone",rs.getString("phone"));
				resultMap.put("mobileNo",rs.getString("mobile_no"));
				resultMap.put("emailId",rs.getString("email_id"));
				
				sql="select * from authentication where id =? and role_cd= 'A'";
				stmt = con.prepareStatement(sql);
				stmt.setString(1,admId);
				rs = stmt.executeQuery();
				
				if(rs.next()){
					resultMap.put("username", rs.getString("username"));
					resultMap.put("pwd", rs.getString("pwd"));
				}
				result.add(resultMap);
			}
		} catch (SQLException errSql){
			System.out.println("SQL Exception in getAdminDetail:"+errSql);			
		} catch (Exception err){
			System.out.println("Exception in getAdminDetail:"+err);
		} finally {
			try { 
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (SQLException errSql){}
		}
		
		return result;
		      
	}
	
	public void updateAdminDetail(String admId,String fullName,String address,String phone,
								  String mobileNo,String emailId){
		try{
			
			con = dbcon.getDbConnection() ;
			sql ="update admin set fullname=?,address=?,phone=?,mobile_no=?,email_id=?"
				+" where adm_id=?";
			stmt = con.prepareStatement(sql); 
			
			stmt.setString(1,fullName);
			stmt.setString(2,address);
			stmt.setInt(3,Integer.parseInt(phone));
			stmt.setInt(4,Integer.parseInt(mobileNo));
			stmt.setString(5,emailId);
			stmt.setInt(6, Integer.parseInt(admId));
			stmt.executeUpdate();
			
		} catch (SQLException errSql){
			System.out.println("SQL Exception in updateAdminDetail:"+errSql);			
		} catch (Exception err){
			System.out.println("Exception in updateAdminDetail:"+err);
		} finally {
			try { 
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (SQLException errSql){}
		}
		
		      
	}
	
	
	public void addAdmin(String fullName,String address,String phone,
			  String mobileNo,String emailId,String username,String password){
		try{
		
			con = dbcon.getDbConnection() ;
			sql ="insert into admin(fullname,address,phone,mobile_no,email_id) "
				+ "values(?,?,?,?,?)";
			stmt = con.prepareStatement(sql); 
			
			stmt.setString(1,fullName);
			stmt.setString(2,address);
			stmt.setInt(3,Integer.parseInt(phone));
			stmt.setLong(4,Long.parseLong(mobileNo));
			stmt.setString(5,emailId);

			stmt.executeUpdate();
			
			sql="select adm_id from admin where fullname=? and mobile_no=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1,fullName);
			stmt.setLong(2,Long.parseLong(mobileNo));
			rs = stmt.executeQuery();
			
			if(rs.next()){
				String admId = rs.getString("adm_id");
				sql="insert into authentication(username,pwd,role_cd,status_cd,id) "
					+ "values(?,?,'A','E',?)";
				stmt = con.prepareStatement(sql);
				stmt.setString(1,username);
				stmt.setString(2,password);
				stmt.setInt(3,Integer.parseInt(admId));
				stmt.executeUpdate();
			}
			
		
		} catch (SQLException errSql){
			System.out.println("SQL Exception in addAdmin:"+errSql);			
		} catch (Exception err){
			System.out.println("Exception in addAdmin:"+err);
		} finally {
			try { 
					if (rs != null) rs.close();
					if (stmt != null) stmt.close();
					if (con != null) con.close();
			} catch (SQLException errSql){}
		}
		
		
		}
	
	
	public void deleteAdmin(String admId){
		try{
			
			con = dbcon.getDbConnection() ;
			sql ="delete from admin where adm_id = ?";
			stmt = con.prepareStatement(sql); 
			
			stmt.setInt(1,Integer.parseInt(admId));
			stmt.executeUpdate();
		
		} catch (SQLException errSql){
			System.out.println("SQL Exception in deleteAdmin:"+errSql);			
		} catch (Exception err){
			System.out.println("Exception in deleteAdmin:"+err);
		} finally {
			try { 
					if (rs != null) rs.close();
					if (stmt != null) stmt.close();
					if (con != null) con.close();
			} catch (SQLException errSql){}
		}
		
	}
 }


	

