package bank;

import java.sql.*;
import java.util.*;

import dbconnection.DbConnection;


public class Bank {
	 
			private Connection con=null;
			private PreparedStatement stmt =null;
			private ResultSet rs =null;
			private List result=null;
			private Map resultMap =null;
			private String sql="";
		    
			DbConnection dbcon = new DbConnection();
			
			
			public List getBankList(){
				try{
					
					con = dbcon.getDbConnection() ;
					sql ="select * from bank";
					stmt = con.prepareStatement(sql);  
					rs = stmt.executeQuery();
					
					result  = new ArrayList();	
					while ( rs.next() ) {
						resultMap = new HashMap();
						
						resultMap.put("bnkId",rs.getString("bnk_id"));
						resultMap.put("bankDesc",rs.getString("bank_desc"));
						
						result.add(resultMap);
					}
				} catch (SQLException errSql){
					System.out.println("SQL Exception in getBankList:"+errSql);			
				} catch (Exception err){
					System.out.println("Exception in getBankList:"+err);
				} finally {
					try { 
						if (rs != null) rs.close();
						if (stmt != null) stmt.close();
						if (con != null) con.close();
					} catch (SQLException errSql){}
				}
				
				return result;
				      
			}



			
			public void updateBankDetail(String bnkId,String bankDesc){
				try{
					
					con = dbcon.getDbConnection() ;
					sql ="update bank set bank_desc=? where bnk_id=?";
					stmt = con.prepareStatement(sql); 
					
					stmt.setString(1,bankDesc);
					stmt.setInt(2, Integer.parseInt(bnkId));
					stmt.executeUpdate();
					
				} catch (SQLException errSql){
					System.out.println("SQL Exception in updateBankDetail:"+errSql);			
				} catch (Exception err){
					System.out.println("Exception in updateBankDetail:"+err);
				} finally {
					try { 
						if (rs != null) rs.close();
						if (stmt != null) stmt.close();
						if (con != null) con.close();
					} catch (SQLException errSql){}
				}
				
				      
			}
			
			
			public void addBank(String bankDesc){
				try{
				
					con = dbcon.getDbConnection() ;
					sql ="insert into bank(bank_desc) values(?)";
					stmt = con.prepareStatement(sql); 
					
					stmt.setString(1,bankDesc);
					stmt.executeUpdate();
				
				} catch (SQLException errSql){
					System.out.println("SQL Exception in addBank:"+errSql);			
				} catch (Exception err){
					System.out.println("Exception in addBank:"+err);
				} finally {
					try { 
							if (rs != null) rs.close();
							if (stmt != null) stmt.close();
							if (con != null) con.close();
					} catch (SQLException errSql){}
				}
				
				
				}
			
			
			public void deleteBank(String bnkId){
				try{
					
					con = dbcon.getDbConnection() ;
					sql ="delete from bank where bnk_id = ?";
					stmt = con.prepareStatement(sql); 
					
					stmt.setInt(1, Integer.parseInt(bnkId));
					stmt.executeUpdate();
				
				} catch (SQLException errSql){
					System.out.println("SQL Exception in deleteBank:"+errSql);			
				} catch (Exception err){
					System.out.println("Exception in deleteBank:"+err);
				} finally {
					try { 
							if (rs != null) rs.close();
							if (stmt != null) stmt.close();
							if (con != null) con.close();
					} catch (SQLException errSql){}
				}
				
			}
			
			
			public String getBankDesc(String bnkId){
				String bankName="";
				try{
					
					con = dbcon.getDbConnection() ;
					sql ="select bank_desc from bank where bnk_id = ?";
					stmt = con.prepareStatement(sql); 
					
					stmt.setInt(1, Integer.parseInt(bnkId));
					rs = stmt.executeQuery();
					if(rs.next()){
						bankName = rs.getString("bank_desc");
					}
				
				} catch (SQLException errSql){
					System.out.println("SQL Exception in getBankDesc:"+errSql);			
				} catch (Exception err){
					System.out.println("Exception in getBankDesc:"+err);
				} finally {
					try { 
							if (rs != null) rs.close();
							if (stmt != null) stmt.close();
							if (con != null) con.close();
					} catch (SQLException errSql){}
				}
				
				return bankName;
				
			}
		 }


			







