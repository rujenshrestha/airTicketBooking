package location;

import java.sql.*;
import java.util.*;

import dbconnection.DbConnection;

public class Location {
	
				private Connection con=null;
				private PreparedStatement stmt =null;
				private ResultSet rs =null;
				private List result=null;
				private Map resultMap =null;
				private String sql="";
			    
				DbConnection dbcon = new DbConnection();
				
				
				public List getlocationList(){
					try{
						
						con = dbcon.getDbConnection() ;
						sql ="select * from location";
						stmt = con.prepareStatement(sql);  
						rs = stmt.executeQuery();
						
						result  = new ArrayList();	
						while ( rs.next() ) {
							resultMap = new HashMap();
							
							resultMap.put("locId",rs.getString("loc_id"));
							resultMap.put("locDesc",rs.getString("loc_desc"));
							
							result.add(resultMap);
						}
					} catch (SQLException errSql){
						System.out.println("SQL Exception in getlocationList:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in getlocationList:"+err);
					} finally {
						try { 
							if (rs != null) rs.close();
							if (stmt != null) stmt.close();
							if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
					return result;
					      
				}



				
				public void updatelocationDetail(String locId,String locDesc){
					try{
						
						con = dbcon.getDbConnection() ;
						sql ="update location set loc_desc=? where loc_id=?";
						stmt = con.prepareStatement(sql); 
						
						stmt.setString(1,locDesc);
						stmt.setInt(2, Integer.parseInt(locId));
						stmt.executeUpdate();
						
					} catch (SQLException errSql){
						System.out.println("SQL Exception in updatelocationDetail:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in updatelocationDetail:"+err);
					} finally {
						try { 
							if (rs != null) rs.close();
							if (stmt != null) stmt.close();
							if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
					      
				}
				
				
				public void addlocation(String locDesc){
					try{
					
						con = dbcon.getDbConnection() ;
						sql ="insert into location(loc_desc) values(?)";
						stmt = con.prepareStatement(sql); 
						
						stmt.setString(1,locDesc);
						stmt.executeUpdate();
					
					} catch (SQLException errSql){
						System.out.println("SQL Exception in addlocation:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in addlocation:"+err);
					} finally {
						try { 
								if (rs != null) rs.close();
								if (stmt != null) stmt.close();
								if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
					
					}
				
				
				public void deletelocation(String locId){
					try{
						
						con = dbcon.getDbConnection() ;
						sql ="delete from location where loc_id = ?";
						stmt = con.prepareStatement(sql); 
						
						stmt.setInt(1, Integer.parseInt(locId));
						stmt.executeUpdate();
					
					} catch (SQLException errSql){
						System.out.println("SQL Exception in deletelocation:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in deletelocation:"+err);
					} finally {
						try { 
								if (rs != null) rs.close();
								if (stmt != null) stmt.close();
								if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
				}
			 }

