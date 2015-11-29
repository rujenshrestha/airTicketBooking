package transaction;
import dbconnection.DbConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Transaction {

		 
				private Connection con=null;
				private PreparedStatement stmt =null;
				private ResultSet rs =null;
				private List result=null;
				private Map resultMap =null;
				private String sql="";
			    
				DbConnection dbcon = new DbConnection();
				
				
				public List getAllTransaction(){
					try{
						
						con = dbcon.getDbConnection() ;
						sql ="select * from transaction_history";
						stmt = con.prepareStatement(sql);  
						rs = stmt.executeQuery();
						
						result  = new ArrayList();	
						while ( rs.next() ) {
							resultMap = new HashMap();
							
							resultMap.put("txnId",rs.getString("txn_id"));
							resultMap.put("usrId",rs.getString("usr_id"));
							resultMap.put("schId",rs.getString("sch_id"));
							resultMap.put("seatQnty",rs.getString("seat_qnty"));
							
							result.add(resultMap);
						}
					} catch (SQLException errSql){
						System.out.println("SQL Exception in getAllTransaction:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in getAllTransaction:"+err);
					} finally {
						try { 
							if (rs != null) rs.close();
							if (stmt != null) stmt.close();
							if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
					return result;
					      
				}
				

				public List getTransactionByUser(String usrId){
					try{
						
						con = dbcon.getDbConnection() ;
						sql ="select * from transaction_history where usr_id = ?";
						stmt = con.prepareStatement(sql);
						stmt.setInt(1,Integer.parseInt(usrId));
						rs = stmt.executeQuery();
						
						result  = new ArrayList();	
						while ( rs.next() ) {
							resultMap = new HashMap();
							
							resultMap.put("txnId",rs.getString("txn_id"));
							resultMap.put("schId",rs.getString("sch_id"));
							resultMap.put("seatQnty",rs.getString("seat_qnty"));
							
							result.add(resultMap);
						}
					} catch (SQLException errSql){
						System.out.println("SQL Exception in getTransactionByUser:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in getTransactionByUser:"+err);
					} finally {
						try { 
							if (rs != null) rs.close();
							if (stmt != null) stmt.close();
							if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
					return result;
					      
				}

				public List getTransactionBySchedule(String schId){
					try{
						
						con = dbcon.getDbConnection() ;
						sql ="select * from transaction_history where sch_id = ?";
						stmt = con.prepareStatement(sql);
						stmt.setInt(1,Integer.parseInt(schId));
						rs = stmt.executeQuery();
						
						result  = new ArrayList();	
						while ( rs.next() ) {
							resultMap = new HashMap();
							
							resultMap.put("txnId",rs.getString("txn_id"));
							resultMap.put("usrId",rs.getString("usr_id"));
							resultMap.put("seatQnty",rs.getString("seat_qnty"));
							
							result.add(resultMap);
						}
					} catch (SQLException errSql){
						System.out.println("SQL Exception in getTransactionBySchedule:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in getTransactionBySchedule:"+err);
					} finally {
						try { 
							if (rs != null) rs.close();
							if (stmt != null) stmt.close();
							if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
					return result;
					      
				}

				
				public List getTransactionByUserSchedule(String schId,String usrId){
					try{
						
						con = dbcon.getDbConnection() ;
						sql ="select * from transaction_history where sch_id = ? and usr_id=?";
						stmt = con.prepareStatement(sql);
						stmt.setInt(1,Integer.parseInt(schId));
						stmt.setInt(2,Integer.parseInt(usrId));
						rs = stmt.executeQuery();
						
						result  = new ArrayList();	
						while ( rs.next() ) {
							resultMap = new HashMap();
							
							resultMap.put("txnId",rs.getString("txn_id"));
							resultMap.put("seatQnty",rs.getString("seat_qnty"));
							
							result.add(resultMap);
						}
					} catch (SQLException errSql){
						System.out.println("SQL Exception in getTransactionByUserSchedule:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in getTransactionByUserSchedule:"+err);
					} finally {
						try { 
							if (rs != null) rs.close();
							if (stmt != null) stmt.close();
							if (con != null) con.close();
						} catch (SQLException errSql){}
					}
					
					return result;
					      
				}
				
				
				public List addTransaction(String schId,String usrId,String seatQnty){
					try{
						
						con = dbcon.getDbConnection() ;
						sql ="insert into transaction_history(usr_id,sch_id,seat_qnty) "
								+ "values(?,?,?)";
						stmt = con.prepareStatement(sql);
						stmt.setInt(1,Integer.parseInt(usrId));
						stmt.setInt(2,Integer.parseInt(schId));
						stmt.setInt(3,Integer.parseInt(seatQnty));
						
						stmt.executeUpdate();
						
						
					} catch (SQLException errSql){
						System.out.println("SQL Exception in addTransaction:"+errSql);			
					} catch (Exception err){
						System.out.println("Exception in addTransaction:"+err);
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
