package dummybank;

import java.sql.*;
import java.util.*;

import dbconnection.DbConnection;

public class DummyBank {
		
					private Connection con=null;
					private PreparedStatement stmt =null;
					private ResultSet rs =null;
					private String sql="";
					private String balance="";
				    
					DbConnection dbcon = new DbConnection();
					
					
					public String getAccountBalance(String accountNo){
						try{
							
							con = dbcon.getDbConnection() ;
							sql ="select balance from dummy_bank where account_no =?";
							stmt = con.prepareStatement(sql); 
							stmt.setString(1, accountNo);
							rs = stmt.executeQuery();
								
							while ( rs.next() ) {
								balance= rs.getString("balance");
							}
						} catch (SQLException errSql){
							System.out.println("SQL Exception in getAccountBalance:"+errSql);			
						} catch (Exception err){
							System.out.println("Exception in getAccountBalance:"+err);
						} finally {
							try { 
								if (rs != null) rs.close();
								if (stmt != null) stmt.close();
								if (con != null) con.close();
							} catch (SQLException errSql){}
						}
						
						return balance;
						      
					}


}

