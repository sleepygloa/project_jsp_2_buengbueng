package application.controller.login;

import java.io.IOException;
import java.net.InetAddress;
import java.net.URLEncoder;

import org.json.simple.JSONObject;

import application.ConnectServer;
import application.Main;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.layout.BorderPane;
import javafx.scene.text.Text;
import user.info.dto.UserInfo;

public class LoginController {
	@FXML private TextField id;
	@FXML private PasswordField pw;
	@FXML private Text alertTxt;
	
	@FXML
	public void initialize(){
		try{
			String param="key="+URLEncoder.encode(UserInfo.getInstance().getB_key(),"UTF-8");
			String urlInfo = "http://localhost:8080/buengbueng/fxUserStart.do";
			JSONObject jsonObj = ConnectServer.connect(param, urlInfo);
			UserInfo.getInstance().setFranchiseeName((String)jsonObj.get("franchiseeName"));
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void searchId(){
		try {
			BorderPane border = new BorderPane();
			Parent main =  FXMLLoader.load(getClass().getResource("/application/controller/login/SearchIDApp.fxml"));
			border.setCenter(main);
			Scene scene = new Scene(border);
			scene.getStylesheets().add(getClass().getResource("/application/css/application.css").toExternalForm());
			Main.getStage().setScene(scene);
			Main.getStage().setFullScreen(true);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void searchPw(){
		try {
			BorderPane border = new BorderPane();
			Parent main =  FXMLLoader.load(getClass().getResource("/application/controller/login/SearchPWApp.fxml"));
			border.setCenter(main);
			Scene scene = new Scene(border);
			scene.getStylesheets().add(getClass().getResource("/application/css/application.css").toExternalForm());
			Main.getStage().setScene(scene);
			Main.getStage().setFullScreen(true);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void sign(){
		try {
			BorderPane border = new BorderPane();
			Parent main =  FXMLLoader.load(getClass().getResource("/application/controller/login/SignApp.fxml"));
			border.setCenter(main);
			Scene scene = new Scene(border);
			scene.getStylesheets().add(getClass().getResource("/application/css/application.css").toExternalForm());
			Main.getStage().setScene(scene);
			Main.getStage().setFullScreen(true);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void login(){
		/* 사용자가 ID를 입력 안하면 알림 */
		if(id.getText().equals("")){
			alertTxt.setText("아이디를 입력하세요.");
		}
		/* 사용자가 PW를 입력 안하면 알림 */
		else if(pw.getText().equals("")){
			alertTxt.setText("비밀번호를 입력하세요.");
		}
		/* 사용자가 ID와 PW를 입력하면 실행 */
		else{
			try {
				// 입력받은 정보와 부합하는 사용자 정보가 있는지 확인
                InetAddress local = InetAddress.getLocalHost();
                String ip = local.getHostAddress();
                String param="id="+URLEncoder.encode(id.getText(),"UTF-8")+"&pw="+URLEncoder.encode(pw.getText(),"UTF-8")+"&ip="+
                        URLEncoder.encode(ip,"UTF-8")+"&key="+URLEncoder.encode(UserInfo.getInstance().getB_key(),"UTF-8");
				String urlInfo = "http://localhost:8080/buengbueng/fxLoginPro.do";
				JSONObject jsonObj = ConnectServer.connect(param, urlInfo);
				
				String id = (String)jsonObj.get("id");
				
				// 서버로부터 값을 전달 받았고, 그 값이 fail이 아니라면 = 로그인 성공
				if(!id.isEmpty() && !id.contains("fail")){
					// 사용자 정보 저장
					UserInfo.getInstance().setId(id);
					UserInfo.getInstance().setStartPoint(Double.parseDouble((String)jsonObj.get("point")));
					UserInfo.getInstance().setPoint(Double.parseDouble((String)jsonObj.get("point")));
					UserInfo.getInstance().setGrade(Integer.parseInt((String)jsonObj.get("grade")));
					UserInfo.getInstance().setLoginTime((String)jsonObj.get("loginTime"));
					UserInfo.getInstance().setBossIP((String)jsonObj.get("bossIP"));
					UserInfo.getInstance().setPcNum((String)jsonObj.get("pcNum"));
					UserInfo.getInstance().setHistoryNum((Integer.parseInt((String)jsonObj.get("historyNum"))));
					UserInfo.getInstance().setMoneyPolicy(Double.parseDouble((String)jsonObj.get("moneyPolicy")));
					Parent main =  FXMLLoader.load(getClass().getResource("/application/controller/login/MainApp.fxml"));
					// 메인화면 레이아웃을 화면에 등록
					Scene scene = new Scene(main);
					scene.getStylesheets().add(getClass().getResource("/application/css/application.css").toExternalForm());
					// Main.getStage() = Main.java에 있는 메인스테이지 사용(현재 launch된 애)
					Main.getStage().setFullScreen(false);
					Main.getStage().setWidth(600);	// 창 가로 크기
					Main.getStage().setHeight(350);	// 창 세로 크기
					Main.getStage().setScene(scene); // 창에 화면 넣기
				}
				// 서버로부터 값을 전달 받지 못했거나, 전달받은 값이 fail이라면 = 로그인 실패
				else{
					alertTxt.setText(id.substring(id.indexOf(",")+1, id.length()));
				}
			} catch (Exception e) {
				alertTxt.setText("로그인 실패");
			}
		}
	}
}
