package schedule;
  
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import java.io.*;

import dbconnection.DbConnection;
import utilities.DateTime;


public class Schedule {

		 
				private Connection con=null;
				private PreparedStatement stmt =null;
				private ResultSet rs =null;
				private List result=null;
				private Map resultMap =null;
				private String sql="";
			    
				DbConnection dbcon = new DbConnection();
				DateTime dt = new DateTime();
				
				
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

				
				
				public List getSchedule(String fromLocId,String toLocId,String alnId,String date,String time){
					
					date = dt.changeDateFormat(date,"MM/dd/yyyy","yyyy-MM-dd") ;
					try{
						
						con = dbcon.getDbConnection() ;
						if(alnId.matches("A")){
							sql ="select * from flight_schedule where from_loc_id =? and to_loc_id=? "
								+"and flight_date=?";
						}else{
							sql ="select * from flight_schedule where from_loc_id =? and to_loc_id=? "
									+"and flight_date=? and aln_id="+alnId;
						}
						stmt = con.prepareStatement(sql);
						stmt.setInt(1,Integer.parseInt(fromLocId));
						stmt.setInt(2,Integer.parseInt(toLocId));
						stmt.setString(3,date);
						
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
						System.out.println("SQL Exception in getSchedule:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in getSchedule:"+err);
					} finally {
						try { 
							if (rs != null) rs.close();
							if (stmt != null) stmt.close();
							if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
					return result;
					      
				}

				
				
				public void updateSchedule(String schId,String alnId,String fromLocId,String toLocId,
						String price,String time,String date,String flightClass,
						String seatQnty){
					
					date  = dt.changeDateFormat(date,"MM/dd/yyyy", "yyyy-MM-dd");
					time = dt.changeTimeFormat(time);
					
					System.out.println("Changed date and time :: "+ date +"    "+time);
					try{
					
						con = dbcon.getDbConnection() ;
						sql ="update flight_schedule set aln_id=?,from_loc_id=?,to_loc_id=?,price=?,"
							+"flight_time=?,flight_date=?,class=?,seat_qnty=? where sch_id =?";
						stmt = con.prepareStatement(sql); 
						
						stmt.setInt(1,Integer.parseInt(alnId));
						stmt.setInt(2,Integer.parseInt(fromLocId));
						stmt.setInt(3,Integer.parseInt(toLocId));
						stmt.setDouble(4,Double.parseDouble(price));
						stmt.setString(5,time);
						stmt.setString(6,date);
						stmt.setString(7,flightClass);
						stmt.setInt(8,Integer.parseInt(seatQnty));;
						stmt.setInt(9,Integer.parseInt(schId));
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
					
					date  = dt.changeDateFormat(date,"MM/dd/yyyy", "yyyy-MM-dd");
					time = dt.changeTimeFormat(time);
					
					System.out.println("Changed date and time :: "+ date +"    "+time);
					try{
					
						con = dbcon.getDbConnection() ;
						sql ="insert into flight_schedule(aln_id,from_loc_id,to_loc_id,price,"
							+"flight_time,flight_date,class,seat_qnty) "
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
				
				public String getAirlineDescBySchedule(String schId){
					String airlineDesc="";
					try{
						
						con = dbcon.getDbConnection() ;
						sql ="SELECT airline_desc FROM airline a,flight_schedule b WHERE "
							+ "a.aln_id = b.aln_id AND b.sch_id = ?";
						stmt = con.prepareStatement(sql); 
						
						stmt.setInt(1, Integer.parseInt(schId));
						rs = stmt.executeQuery();
						while(rs.next()){
							airlineDesc = rs.getString("airline_desc");
						}
					
					} catch (SQLException errSql){
						System.out.println("SQL Exception in getAirlineDescBySchedule:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in getAirlineDescBySchedule:"+err);
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
