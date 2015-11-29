package login;

import dbconnection.DbConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Login {

		 
				private Connection con=null;
				private PreparedStatement stmt =null;
				private ResultSet rs =null;
				private List result=null;
				private Map resultMap =null;
				private String sql="";
			    
				DbConnection dbcon = new DbConnection();
				
				
				public List getLoginDetail(String username){
					try{
						
						con = dbcon.getDbConnection() ;
						sql ="select * from authentication where username = ?";
						stmt = con.prepareStatement(sql);  
						stmt.setString(1,username);
						
						rs = stmt.executeQuery();
						
						result  = new ArrayList();	
						while ( rs.next() ) {
							resultMap = new HashMap();
							
							resultMap.put("athId",rs.getString("ath_id"));
							resultMap.put("username",rs.getString("username"));
							resultMap.put("pwd",rs.getString("pwd"));
							resultMap.put("roleCd",rs.getString("role_cd"));
							resultMap.put("statusCd",rs.getString("status_cd"));
							resultMap.put("id",rs.getString("id"));
							
							
							result.add(resultMap);
						}
					} catch (SQLException errSql){
						System.out.println("SQL Exception in getLoginDetail:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in getLoginDetail:"+err);
					} finally {
						try { 
							if (rs != null) rs.close();
							if (stmt != null) stmt.close();
							if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
					return result;
					      
				}

}

