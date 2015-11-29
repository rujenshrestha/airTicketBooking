package schedule;

import java.sql.*;
import java.util.*;

import dbconnection.DbConnection;


public class Schedule {

		 
				private Connection con=null;
				private PreparedStatement stmt =null;
				private ResultSet rs =null;
				private List result=null;
				private Map resultMap =null;
				private String sql="";
			    
				DbConnection dbcon = new DbConnection();
				
				
				public List getScheduleList(){
					try{
						
						con = dbcon.getDbConnection() ;
						sql ="select * from flight_schedule";
						stmt = con.prepareStatement(sql);  
						rs = stmt.executeQuery();
						
						result  = new ArrayList();	
						while ( rs.next() ) {
							resultMap = new HashMap();
							
							resultMap.put("schId",rs.getString("sch_id"));
							resultMap.put("alnId",rs.getString("aln_id"));
							resultMap.put("fromLocId",rs.getString("from_loc_id"));
							resultMap.put("toLocId",rs.getString("to_loc_id"));
							resultMap.put("price",rs.getString("price"));
							resultMap.put("flightTime",rs.getString("flight_time"));
							resultMap.put("flightDate",rs.getString("flight_date"));
							resultMap.put("class",rs.getString("class"));
							resultMap.put("seatQnty",rs.getString("seat_qnty"));
												
							result.add(resultMap);
						}
					} catch (SQLException errSql){
						System.out.println("SQL Exception in getScheduleList:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in getScheduleList:"+err);
					} finally {
						try { 
							if (rs != null) rs.close();
							if (stmt != null) stmt.close();
							if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
					return result;
					      
				}



				
				public void updateSchedule(String alnId,String fromLocId,String toLocId,
						String price,String time,String date,String flightClass,
						String seatQnty){
					try{
					
						con = dbcon.getDbConnection() ;
						sql ="update flight_schedule set aln_id=?,from_loc_id=?,to_loc_id=?,price=?,"
							+"fligt_time=?,flight_date=?,class=?,seat_qnty=?)";
						stmt = con.prepareStatement(sql); 
						
						stmt.setInt(1,Integer.parseInt(alnId));
						stmt.setInt(2,Integer.parseInt(fromLocId));
						stmt.setInt(3,Integer.parseInt(toLocId));
						stmt.setDouble(4,Double.parseDouble(price));
						stmt.setString(5,time);
						stmt.setString(6,date);
						stmt.setString(7,flightClass);
						stmt.setInt(8,Integer.parseInt(seatQnty));;
						stmt.executeUpdate();
					
					} catch (SQLException errSql){
						System.out.println("SQL Exception in updateSchedule:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in updateSchedule:"+err);
					} finally {
						try { 
								if (rs != null) rs.close();
								if (stmt != null) stmt.close();
								if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
					
				}
				
				
				public void addSchedule(String alnId,String fromLocId,String toLocId,
										String price,String time,String date,String flightClass,
										String seatQnty){
					try{
					
						con = dbcon.getDbConnection() ;
						sql ="insert into flight_schedule(aln_id,from_loc_id,to_loc_id,price,"
							+"fligt_time,flight_date,class,seat_qnty) "
							+"values(?,?,?,?,?,?,?,?)";
						stmt = con.prepareStatement(sql); 
						
						stmt.setInt(1,Integer.parseInt(alnId));
						stmt.setInt(2,Integer.parseInt(fromLocId));
						stmt.setInt(3,Integer.parseInt(toLocId));
						stmt.setDouble(4,Double.parseDouble(price));
						stmt.setString(5,time);
						stmt.setString(6,date);
						stmt.setString(7,flightClass);
						stmt.setInt(8,Integer.parseInt(seatQnty));;
						stmt.executeUpdate();
					
					} catch (SQLException errSql){
						System.out.println("SQL Exception in addSchedule:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in addSchedule:"+err);
					} finally {
						try { 
								if (rs != null) rs.close();
								if (stmt != null) stmt.close();
								if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
					
					}
				
				
				public List getScheduleDetail(String schId){
					try{
						
						con = dbcon.getDbConnection() ;
						sql ="select * from flight_schedule where sch_id =?";
						stmt = con.prepareStatement(sql);  
						stmt.setInt(1,Integer.parseInt(schId));
						rs = stmt.executeQuery();
						
						result  = new ArrayList();	
						while ( rs.next() ) {
							resultMap = new HashMap();
							
							resultMap.put("schId",rs.getString("sch_id"));
							resultMap.put("alnId",rs.getString("aln_id"));
							resultMap.put("fromLocId",rs.getString("from_loc_id"));
							resultMap.put("toLocId",rs.getString("to_loc_id"));
							resultMap.put("price",rs.getString("price"));
							resultMap.put("flightTime",rs.getString("flight_time"));
							resultMap.put("flightDate",rs.getString("flight_date"));
							resultMap.put("class",rs.getString("class"));
							resultMap.put("seatQnty",rs.getString("seat_qnty"));
												
							result.add(resultMap);
						}
					} catch (SQLException errSql){
						System.out.println("SQL Exception in getScheduleDetail:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in getScheduleDetail:"+err);
					} finally {
						try { 
							if (rs != null) rs.close();
							if (stmt != null) stmt.close();
							if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
					return result;
					      
				}
				
				
				public void deleteSchedule(String schId){
					try{
						
						con = dbcon.getDbConnection() ;
						sql ="delete from flight_schedule where sch_id = ?";
						stmt = con.prepareStatement(sql); 
						
						stmt.setInt(1, Integer.parseInt(schId));
						stmt.executeUpdate();
					
					} catch (SQLException errSql){
						System.out.println("SQL Exception in deleteSchedule:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in deleteSchedule:"+err);
					} finally {
						try { 
								if (rs != null) rs.close();
								if (stmt != null) stmt.close();
								if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
				}
				
				
				
			 }
