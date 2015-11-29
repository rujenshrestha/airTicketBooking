package utilities;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTime {
	
	public String changeDateFormat(String date,String fromFormat,String toFormat){
		String changedDate="";
		SimpleDateFormat sdf=new SimpleDateFormat(fromFormat);
		Date dt;
		
		try {
			System.out.println(date);
			dt = sdf.parse(date);
			sdf=new SimpleDateFormat(toFormat);
			
			changedDate = sdf.format(dt);
			System.out.println("Final date: "+changedDate);
			
		} catch (ParseException e) {
			System.out.println("ParseException"+e);
		}
		
		return changedDate;
		
	}
	
	
	public String changeTimeFormat(String time){
		String changedTime="";
		String hr="";
		Integer hour;
		Integer hour1;
		
		if(time.substring(time.length() - 2).matches("PM")){
			hr = time.substring(0,2);
			System.out.println("\n"+hr);
			try{
				hour = Integer.parseInt(hr);
				hour = hour +12;
				changedTime = hour+":"+time.substring(3,5)+":00";
				System.out.println("changedTime: "+changedTime);
				
				
			}catch(Exception e){
				System.out.println("Exception: "+e);
			}
		}else{
			 hr = time.substring(0,2);
			System.out.println("\n"+hr);
			try{
				hour1 = Integer.parseInt(hr);
				changedTime = hour1+":"+time.substring(3,5)+":00";
				System.out.println("changedTime: "+changedTime);
				
				
			}catch(Exception e){
				System.out.println("Exception: "+e);
			}
			
		}
		
		return changedTime;
	}

}
