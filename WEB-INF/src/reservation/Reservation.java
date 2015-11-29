package reservation;

import dbconnection.DbConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Reservation {

				private Connection con=null;
				private PreparedStatement stmt =null;
				private ResultSet rs =null;
				private List result=null;
				private Map resultMap =null;
				private String sql="";
			    
				DbConnection dbcon = new DbConnection();
				
				
				public List getSeatStatus(String schId){
					try{
						
						con = dbcon.getDbConnection() ;
						sql ="select * from reservation where sch_id=?";
						stmt = con.prepareStatement(sql); 
						stmt.setInt(1,Integer.parseInt(schId));
						rs = stmt.executeQuery();
						
						result  = new ArrayList();	
						while ( rs.next() ) {
							resultMap = new HashMap();
							
							resultMap.put("seatNo",rs.getString("seat_no"));
							resultMap.put("seatStatus",rs.getString("seat_status"));
							
							result.add(resultMap);
						}
					} catch (SQLException errSql){
						System.out.println("SQL Exception in getSeatStatus:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in getSeatStatus:"+err);
					} finally {
						try { 
							if (rs != null) rs.close();
							if (stmt != null) stmt.close();
							if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
					return result;
					      
				}



				
				public void setReservation(String schId,String seatQnty){
					
					int totalSeat=0;
					try{
						totalSeat = Integer.parseInt(seatQnty);
					}catch(Exception e){
						System.out.println("Exception :"+e);
					}
					try{
						
						con = dbcon.getDbConnection() ;
						for(int i=1;i<=totalSeat;i++){
							
							sql ="insert into reservation(sch_id,seat_no,seat_status) "
								+ "values(?,?,'F')";
							stmt = con.prepareStatement(sql); 
							
							stmt.setInt(1, Integer.parseInt(schId));
							stmt.setInt(2,i);
							stmt.executeUpdate();
						}
						
					} catch (SQLException errSql){
						System.out.println("SQL Exception in setReservation:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in setReservation:"+err);
					} finally {
						try { 
							if (rs != null) rs.close();
							if (stmt != null) stmt.close();
							if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
					      
				}
				
				
		 }
