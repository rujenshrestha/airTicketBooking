package airline;

import java.sql.*;
import java.util.*;
import dbconnection.DbConnection;

public class Airline {

		 
				private Connection con=null;
				private PreparedStatement stmt =null;
				private ResultSet rs =null;
				private List result=null;
				private Map resultMap =null;
				private String sql="";
			    
				DbConnection dbcon = new DbConnection();
				
				
				public List getAirlineList(){
					try{
						
						con = dbcon.getDbConnection() ;
						sql ="select * from airline";
						stmt = con.prepareStatement(sql);  
						rs = stmt.executeQuery();
						
						result  = new ArrayList();	
						while ( rs.next() ) {
							resultMap = new HashMap();
							
							resultMap.put("alnId",rs.getString("aln_id"));
							resultMap.put("airlineDesc",rs.getString("airline_desc"));
							
							result.add(resultMap);
						}
					} catch (SQLException errSql){
						System.out.println("SQL Exception in getAirlineList:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in getAirlineList:"+err);
					} finally {
						try { 
							if (rs != null) rs.close();
							if (stmt != null) stmt.close();
							if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
					return result;
					      
				}



				
				public void updateAirlineDetail(String alnId,String airlineDesc){
					try{
						
						con = dbcon.getDbConnection() ;
						sql ="update airline set airline_desc=? where aln_id=?";
						stmt = con.prepareStatement(sql); 
						
						stmt.setString(1,airlineDesc);
						stmt.setInt(2, Integer.parseInt(alnId));
						stmt.executeUpdate();
						
					} catch (SQLException errSql){
						System.out.println("SQL Exception in updateAirlineDetail:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in updateAirlineDetail:"+err);
					} finally {
						try { 
							if (rs != null) rs.close();
							if (stmt != null) stmt.close();
							if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
					      
				}
				
				
				public void addAirline(String airlineDesc){
					try{
					
						con = dbcon.getDbConnection() ;
						sql ="insert into airline(airline_desc) values(?)";
						stmt = con.prepareStatement(sql); 
						
						stmt.setString(1,airlineDesc);
						stmt.executeUpdate();
					
					} catch (SQLException errSql){
						System.out.println("SQL Exception in addAirline:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in addAirline:"+err);
					} finally {
						try { 
								if (rs != null) rs.close();
								if (stmt != null) stmt.close();
								if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
					
					}
				
				
				public void deleteAirline(String alnId){
					try{
						
						con = dbcon.getDbConnection() ;
						sql ="delete from airline where aln_id = ?";
						stmt = con.prepareStatement(sql); 
						
						stmt.setInt(1, Integer.parseInt(alnId));
						stmt.executeUpdate();
					
					} catch (SQLException errSql){
						System.out.println("SQL Exception in deleteAirline:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in deleteAirline:"+err);
					} finally {
						try { 
								if (rs != null) rs.close();
								if (stmt != null) stmt.close();
								if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
				}
				
				public String getAirlineDesc(String alnId){
					String airlineDesc="";
					try{
						
						con = dbcon.getDbConnection() ;
						sql ="select airline_desc from airline where aln_id = ?";
						stmt = con.prepareStatement(sql); 
						
						stmt.setInt(1, Integer.parseInt(alnId));
						rs = stmt.executeQuery();
						if(rs.next()){
							airlineDesc= rs.getString("airline_desc");
						}
					
					} catch (SQLException errSql){
						System.out.println("SQL Exception in getAirlineDesc:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in getAirlineDesc:"+err);
					} finally {
						try { 
								if (rs != null) rs.close();
								if (stmt != null) stmt.close();
								if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
					return airlineDesc;
				}
			 }


