package application.controller.etc;

import java.net.URLEncoder;
import java.sql.Timestamp;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import all.info.dto.UserInfo;
import application.ConnectServer;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

public class StringToJson {

	//url 연결해주는 메서드
	public String urlConntectToReturnString(String url){
		String param = "", urlInfo = "";
		try{
			param = "b_id="+URLEncoder.encode(UserInfo.getInstance().getId(),"UTF-8")+"&b_key="+URLEncoder.encode(UserInfo.getInstance().getB_key(),"UTF-8"); 
			urlInfo = "http://localhost:8080/buengbueng/"+url;
		}catch(Exception e){
			e.printStackTrace();
		}
		return ConnectServer.connectS(param, urlInfo);
	}
	
	//String 을 받아 JSONArray 로 변환 시키는 메서드
	public JSONArray stringToJsonArray(String jsonString){
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonEid = new JSONArray();
		
		try{
			jsonEid = (JSONArray)jsonParser.parse(jsonString);
		}catch(Exception e){
			e.printStackTrace();
		}
			
		return jsonEid;
	}

	//JSONArray를 받아JSONObject로 변환시키는 메서드
	public ObservableList jsonArrayToJsonObject(JSONArray jsonArray, String eDtoString){
		JSONObject jsonObj = new JSONObject();
		ObservableList data =FXCollections.observableArrayList();
		
		try{
			for (int i = 0 ; i < jsonArray.size(); i++){
				jsonObj = (JSONObject)jsonArray.get(i);
			}
			
			EmployeeList eDto1 = null;
			EmployeeTotalIdInfoList eDto2 = null;
			EmployeeWorkTimeList eDto3 = null;
			for(int i = 0;i<jsonArray.size(); i++){
				if(eDtoString.equals("EmployeeList")){ //좌상 아이디리스트
					eDto1 = new EmployeeList();
					jsonObj = (JSONObject)jsonArray.get(i);
					eDto1.setE_id((String)jsonObj.get("e_id"));
					data.add(eDto1);
				}else if(eDtoString.equals("EmployeeTotalIdInfoList")){ //좌하 알바 신상정보 리스트
					eDto2 = new EmployeeTotalIdInfoList();
					jsonObj = (JSONObject)jsonArray.get(i);
						eDto2.setTotalId((String)jsonObj.get("totalId"));
						eDto2.setTotalName((String)jsonObj.get("totalName"));
						eDto2.setTotalBirth((String)jsonObj.get("totalBirth"));
						eDto2.setTotalPhone((String)jsonObj.get("totalPhone"));
						eDto2.setTotalAddress((String)jsonObj.get("totalAddress"));
						eDto2.setTotalEmail((String)jsonObj.get("totalEmail"));
						eDto2.setTotalGoogleId((String)jsonObj.get("totalGoogleId"));
					data.add(eDto2);
				}else if(eDtoString.equals("EmployeeCommuteList")){ //우하 알바 근무일정 리스트
					eDto3 = new EmployeeWorkTimeList();
					jsonObj = (JSONObject)jsonArray.get(i);
						eDto3.setWtNum((Long)jsonObj.get("wtNum"));
						eDto3.setWtTodayDate((Long)jsonObj.get("wtTodayDate"));
						eDto3.setWtTitle((String)jsonObj.get("wtTitle"));
						eDto3.setWtStart((Long)jsonObj.get("wtStart"));
						eDto3.setWtEnd((Long)jsonObj.get("wtEnd"));
						eDto3.setWtCommuteTime((Long)jsonObj.get("wtCommuteTime"));
						eDto3.setWtOffWorkTime((Long)jsonObj.get("wtOffWorkTime"));
						eDto3.setWtResult((Long)jsonObj.get("wtResult"));
						eDto3.setWtColor((String)jsonObj.get("wtColor"));
						eDto3.setWtEx((Long)jsonObj.get("wtEx"));
					data.add(eDto3);
				}
				

			}
			
			
			
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
			
		return data;
	}
	
	
}
