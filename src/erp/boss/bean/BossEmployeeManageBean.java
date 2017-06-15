package erp.boss.bean;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import login.user.bean.UserInfoDataDTO;
import superclass.all.bean.MenuCategoryDivResponse;

@Controller
public class BossEmployeeManageBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	
	//사장님 알바생관리 메인 페이지
	@RequestMapping("bossErpMain.do")
	public String bossEmployeeInfoMain(Model model, HttpSession session){
		
		//////////////////////////////////////////
		//사이드메뉴 템플릿
		int sidemenuCheck = 1; //사이드메뉴 를 보여줄건지
		int sidemenu = 3; //사이드메뉴의 내용을 선택
		model.addAttribute("sidemenuCheck", sidemenuCheck);
		model.addAttribute("sidemenu", sidemenu);
		//변수들을 페이지로 전달
		
		//////////////////////////////////////////
		//세션 아이디를 페이지로전달
		String id = (String)session.getAttribute("loginId");
		model.addAttribute("id",id);
		
		
		return "/bossERP/erpMain";
	}
	
	//사장님 알바생 관리 페이지로이동
	@RequestMapping("manageEmployee.do")
	public String manageEmployee(Model model, HttpSession session){
		
		//////////////////////////////////////////
		//사이드메뉴 템플릿
		int sidemenuCheck = 1; //사이드메뉴 를 보여줄건지
		int sidemenu = 3; //사이드메뉴의 내용을 선택
		model.addAttribute("sidemenuCheck", sidemenuCheck);
		model.addAttribute("sidemenu", sidemenu);
		//변수들을 페이지로 전달
		
		//////////////////////////////////////////
		//세션 아이디를 페이지로전달
		String id = (String)session.getAttribute("loginId");
		model.addAttribute("id",id);
		
		//////////////////////////////////////////////
		///임시로 추가함
		List list = new ArrayList();
		list = (List)sqlMap.queryForList("erpEmp.getEmployeeAddLog",null);
		model.addAttribute("list",list);
		
		//////////////////////////////////////////////
		//알바생 아이디정보를 리스트로 불러옴, 파트 
		List list1 = new ArrayList();
		list1 = (List)sqlMap.queryForList("erpEmp.getEmployeeList", id);
		model.addAttribute("list1",list1);
		
		return "/bossERP/employeeManage/manageEmployee";
	}
	
	//알바생 아이디 신청폼 AJAX 
	@RequestMapping("employeeAddInfo.do")
	public String employeeAddInfo(Model model, HttpSession session, BossEmployeeManageDataDTO beDTO ){
			
		//////////////////////////////////////////
		//세션 아이디를 페이지로전달
		String b_id = (String)session.getAttribute("loginId");
		model.addAttribute("b_id",b_id);
		
		beDTO = (BossEmployeeManageDataDTO)sqlMap.queryForObject("erpEmp.getEmployeeAddLogLastNum", null);
		model.addAttribute("beDTO", beDTO);
				
		return "/bossERP/employeeManage/employeeAddInfo";
	}
	
	//알바생 아이디 추가 신청 처리, Log남김
	@RequestMapping("employeeAddPro.do")
	public String employeeAddPro(Model model, HttpSession session, BossEmployeeManageDataDTO beDTO){
		
		//////////////////////////////////////////
		//세션 아이디를 페이지로전달
		String b_id = (String)session.getAttribute("loginId");
		model.addAttribute("b_id",b_id);
		
		int check = 0;
		//로그인 하지 않았을때 그냥 폼은 보여주지만, 아무것도할수없다.
		//////////////////////////////////////////
		//비로그인접근, 잘못된 경로로 접근한사람 내쫓음
		if(b_id == null){check = 9; //비회원이 싸이트로 접속했을때.
			return "/bosspcuse/franchiseeAddPro";		}
		
		try{
			//입력된 정보를 로그에 남겨줍니다.
			//////////////////////////////////////
			//사장님이 알바생아이디를 (숫자)만큼 신청함. 
			sqlMap.insert("erpEmp.insertEmployeeAddLog", beDTO);
			check = 1;
			
		}catch(Exception e){
			check = 2;
		}
		model.addAttribute("check", check);
			return "/bossERP/employeeManage/employeePro";
	}	
	
	//알바생 아이디 추가신청에 대한 확인 및 아이디 발급
	@RequestMapping("employeeAddAdminConfirm.do")
	public String employeeAddAdminConfirm(Model model, HttpSession session, BossEmployeeManageDataDTO beDTO){
		
	
		int applyCount = beDTO.getApplyCount();
		String b_id = beDTO.getB_id();
		System.out.println(applyCount);
		System.out.println(b_id);
		
		BossEmployeeManageDataDTO beDTO2 = null;
		int check = 0;
		String checkId = "";
		int length = 0;
		int checkIdInt = 0;	
		String id = null;
		
		try{
			////////////////////////////////////////////////////////////////
			//알바생정보테이블에서 사장님이 가지고있는 알바생아이디가 있는지 찾는다.
			//없다면 없는 것이고, 있다면 있는 알바생아이디중 제일 큰 아이디의 마지막 번호만 가져온다.
			if(sqlMap.queryForObject("erpEmp.getEmployeeId", b_id) != null){
				beDTO2 = (BossEmployeeManageDataDTO)sqlMap.queryForObject("erpEmp.getEmployeeId", b_id);
				 checkId = (beDTO2.getE_id().substring(8)); //아이디 제일 마지막 숫자만 출력한다.
				 checkIdInt = Integer.parseInt(checkId); //숫자를 인트로 형변환한다.
			}
			System.out.println("checkIdInt :"+checkIdInt);
				
				//checkIdInt 가 겹치기 않게 +1을 한다.
					checkIdInt += 1;
				for(int i = 0; i < applyCount; i ++){
					System.out.println("for"+i);
						for(int j = 0; j < checkIdInt+1; j++){
							System.out.println("j: "+j);
							String e_id = null;
							e_id = "employee" + j;
							System.out.println(e_id);
							//J 1부터 검색하여 번호가 빈 알바아이디를 찾아냅니다. null일때, 그곳에 해당아이디를 넣어줍니다.
							if(sqlMap.queryForObject("erpEmp.findE_idNull", e_id) == null){
								System.out.println("하하");
								HashMap map = new HashMap();
								map.put("e_bossid", b_id);
								map.put("e_id", e_id);
								sqlMap.insert("erpEmp.insertEmployeeIdUserInfo", e_id);
								sqlMap.insert("erpEmp.insertEmployeeIdEmployeeInfo", map);
								
								id = e_id;		
								break;
							}else{
								System.out.println("호호");
								if(j == checkIdInt){
									j += 1;
									e_id = "employee" + j;
									System.out.println("최후의");
									HashMap map = new HashMap();
									map.put("e_bossid", b_id);
									map.put("e_id", e_id);
									sqlMap.insert("erpEmp.insertEmployeeIdUserInfo", e_id);
									sqlMap.insert("erpEmp.insertEmployeeIdEmployeeInfo", map);
									
									id = e_id;		
									break;
								}
							};
							
						}
					
				}
				sqlMap.update("erpEmp.updateEmployeeAddLog", id);	
				check = 1;
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e);
		}
		
		model.addAttribute("check", check);
		
		return "redirect:/manageEmployee.do";
	}
	
	//▲ 를 눌렀을때 AJAX 처리
	@RequestMapping("employeeIdUP.do")
	public String employeeIdUp(Model model, HttpSession session,int num){
		
		//////////////////////////////////////////
		//세션 아이디를 페이지로전달
		String b_id = (String)session.getAttribute("loginId");
		model.addAttribute("b_id",b_id);
		
		System.out.println(num);
		int indexNum = 0;
		int space = 9999; //해당 컬럼은 primary Key이다.
		
		List list = new ArrayList();
		try{
			list = (List)sqlMap.queryForList("erpEmp.getListNum",b_id);
			for(int i = 0 ; i < list.size(); i ++){
				if((Integer)list.get(i) == num){
					indexNum = i;
					
					int numa = (Integer)list.get(indexNum);
					if((Integer)list.get(indexNum-1) == null){break;}else{
						int numb = (Integer)list.get(indexNum-1);
						
						HashMap map = new HashMap();
						map.put("numa", numa); //선택된수
						map.put("numb", numb); //앞수, 교환될 수
						map.put("space", space);
						sqlMap.update("erpEmp.changeSpace", map);
						sqlMap.update("erpEmp.changeBefore", map);
						sqlMap.update("erpEmp.changeAfter", map);
						break;
					}
				}
			}
//			Collections.swap(list, indexNum-1, indexNum); arrayList 순서바꿔주는 클래스
			System.out.println(indexNum);
			
		}catch(Exception e){}
		
		return "redirect:/manageEmployee.do";
	}

	//▼ 를 눌렀을때 AJAX 처리
	@RequestMapping("employeeIdDOWN.do")
	public String employeeIdDOWN(Model model, HttpSession session,int num){
		
		//////////////////////////////////////////
		//세션 아이디를 페이지로전달
		String b_id = (String)session.getAttribute("loginId");
		model.addAttribute("b_id",b_id);
		
		System.out.println(num);
		int indexNum = 0;
		int space = 9999; //해당 컬럼은 primary Key이다.
		
		List list = new ArrayList();
		try{
			list = (List)sqlMap.queryForList("erpEmp.getListNum",b_id);
			for(int i = 0 ; i < list.size(); i ++){
				if((Integer)list.get(i) == num){
					indexNum = i;
					
					int numa = (Integer)list.get(indexNum);
					if((Integer)list.get(indexNum+1) == null){break;}else{
						int numb = (Integer)list.get(indexNum+1);
						
						System.out.println(numa);
						System.out.println(numb);
						HashMap map = new HashMap();//up 버튼과 매개변수 교차로 입력됨
						map.put("numb", numa); //선택된수
						map.put("numa", numb); //뒷수, 교환될 수
						map.put("space", space);
						sqlMap.update("erpEmp.changeSpace", map);
						sqlMap.update("erpEmp.changeBefore", map);
						sqlMap.update("erpEmp.changeAfter", map);
						break;
					}
				}
			}
//			Collections.swap(list, indexNum-1, indexNum); arrayList 순서바꿔주는 클래스
			System.out.println(indexNum);
			
		}catch(Exception e){}
		
		return "forward:/manageEmployee.do";
	}
	
	//알바생 정보 보기
	@RequestMapping("employeeInfo.do")
	public String bossEmployeeInfo(Model model, int num){
		System.out.println(num);
		//////////////////////////////////////////
		//사이드메뉴 템플릿
		int sidemenuCheck = 1; //사이드메뉴 를 보여줄건지
		int sidemenu = 3; //사이드메뉴의 내용을 선택
		model.addAttribute("sidemenuCheck", sidemenuCheck);
		model.addAttribute("sidemenu", sidemenu);
		//변수들을 페이지로 전달
		
		
		////////////////////////////////////////////////////////////////////////////////
		//알바생 리스트에서 클릭했을 때 정보를 불러온다.
		UserInfoDataDTO userDto = null;
		userDto = (UserInfoDataDTO)sqlMap.queryForObject("erpEmp.getEmployeeInfo", num);
		
		model.addAttribute("userDto", userDto);
		
		return "/bossERP/employeeManage/employeeInfo";
	}
	
//알바생 정보 수정하기
@RequestMapping("employeeUpdateInfo.do")
public String employeeUpdateInfo(Model model, String id){
	System.out.println("D : :"+id);
	//////////////////////////////////////////
	//사이드메뉴 템플릿
	int sidemenuCheck = 1; //사이드메뉴 를 보여줄건지
	int sidemenu = 3; //사이드메뉴의 내용을 선택
	model.addAttribute("sidemenuCheck", sidemenuCheck);
	model.addAttribute("sidemenu", sidemenu);
	//변수들을 페이지로 전달
	
	
	////////////////////////////////////////////////////////////////////////////////
	//알바생 리스트에서 클릭했을 때 정보를 불러온다.
	UserInfoDataDTO userDto = null;
	userDto = (UserInfoDataDTO)sqlMap.queryForObject("erpEmp.getEmployeeUpdateInfo", id);
	model.addAttribute("userDto", userDto);
	
	return "/bossERP/employeeManage/employeeUpdateInfo";
}
}	
	
	//알바생 정보 LIST




/*String e_id = "";
String checkId = "";
String findId = null;
BossEmployeeManageDataDTO beDTO2 = null;
UserInfoDataDTO userDTO = null;
int length = 0;
int checkIdInt = 0;	
try{
	////////////////////////////////////////////////////////////////
	//employeeInfo 테이블에서 알바생 아이디를 찾는다. 그런데 그냥 찾는 것이아니라
	//사장님이 고용한 알바생 총수와 알바생 넘버가 가장 큰 친구를 찾는다. 아이디형태 : employee2
	if(sqlMap.queryForObject("erpEmp.getEmployeeId", b_id) != null){
		beDTO2 = (BossEmployeeManageDataDTO)sqlMap.queryForObject("erpEmp.getEmployeeId", b_id);
		 checkId = (beDTO2.getE_id().substring(8)); //아이디 제일 마지막 숫자만 출력한다.
		 checkIdInt = Integer.parseInt(checkId); //숫자를 인트로 형변환한다.
	}
		
		/////////////////////////////////////////////////////////////////
		//사장님이 고용한 알바생수가 아에 없을때 null 이거나
		//신청한 수보다 알바생 수가 작을때
		if(beDTO2 == null || beDTO2.getCount() < beDTO.getApplyCount()){
			
			//알바생이 아에 없다면, 신청한 수만큼 알바아이디생성을 반복한다.
			if(beDTO2 == null){
				length = beDTO.getApplyCount();
			}else{
			//알바생이 있다면, 신청한 수 와 알바생수를 빼서, 뺀만큼만 반복 생성한다.
				length = beDTO.getApplyCount() - beDTO2.getCount();
			}
			
			//아까 찾은 제일 마지막으로 큰 숫자 가 2이라면, 3부터 시작할 수 있게 1을 더해준다. for문은 0부터 시작한다.
				checkIdInt += 1;
			for(int i = 0; i < length; i ++){
				checkIdInt += 1;
					//혹시라도 알바생아이디는 있지만, 사장님정보가 누락된 아이디가 있는지 확인한다. 있다면 그아이디를 findId에 넣어준다.
					if(sqlMap.queryForObject("erpEmp.findBossIdNull", null) != null){
						findId = (String)sqlMap.queryForObject("erpEmp.findBossIdNull", null);
					}
					
					//위의 IF에서 findId를 채우지 못햇다면, 알바생과 사장님 아이디가 매칭이되었다면
					if(findId == null){
					//+1 수를 employee수 로 붙여서 아이디를 만들고
						e_id = "employee" + checkIdInt;
					}else{
					//없다면 찾은 아이디를 생성한다.
						e_id = findId;
					}
				////////////////////////////
				//이렇게 만든아이디를 userInfo에 최초정보만 기입한다. 
				//알바생이 자신의 나머지정보를 입력할수있게한다. 이력서 작성하듯이.
				HashMap map = new HashMap();
				map.put("e_id", e_id);
				map.put("e_bossid", b_id);
				//회원 테이블에 새로운 아이디생성
				
				//새로 만든 알바생 아이디가 회원정보에 입력이 되어있따면?
				
				if(sqlMap.queryForObject("erpEmp.findEmployeeIdUserId", e_id) == null){
					sqlMap.insert("erpEmp.insertEmployeeIdUserInfo", e_id);//유저정보에 넣어준다.
					if(findId == null){
						
					}
					//보스아디를 알바정보에 넣어준다.
				}
				
				if(sqlMap.queryForObject("erpEmp.findEmployeeInfoNullBossId", b_id) != null){
					sqlMap.insert("erpEmp.connectEmployeeIdBossId", map);
				}else{
					sqlMap.update("erpEmp.updateEmployeeInfoNullBossId", e_id);
				}
				//알바생정보 테이블에 사장님아이디와 알바아이디를 새로 기입한다.
				
				//이 내용을 신청 수와 알바 생 수와 비교한 만큼 반복한다.
			}
			
		/////////////////////////////////////////////////////////////////	
		//매칭된 수와 요청한 수가 같을때, 메서드를 빠져나간다. JS alarm
		}else if(beDTO2.getCount() == beDTO.getApplyCount()){
			
			check = 5; //변동이없다는 메세지
			model.addAttribute("check", check);
			return "/bosserpmanage/bossEmployeeAddPro";
		
		/////////////////////////////////////////////////////////////////
		//신청한 수가 알바생보다 작을때는 알바생 아이디를 삭제 시킨다.
		//그러나 삭제를 할때는 꼭 알바생 비밀번호를 delete로 변경해야한다.
		}else{
			//알바생 수 - 신청 수 = 반복할 수
			length = beDTO2.getCount() - beDTO.getApplyCount();
			ArrayList findIdArray = null;
			String pw = null;
							
			for(int j = 0; j < beDTO2.getCount(); j++){
				//사장님의 알바생들의 아이디를 찾을 건데, 가장높은 순으로 정렬한다.
				findIdArray = (ArrayList)sqlMap.queryForList("erpEmp.findBossIdNotNull", b_id);
			}
			
			for(int i = 0; i < beDTO2.getCount(); i ++){
				int j = 0;
				e_id = (String)findIdArray.get(i);
				//가장 높은 수의 아이디부터 비밀번호를 찾아와서 비밀번호가 delete인지 비교한다.
				pw = (String)sqlMap.queryForObject("erpEmp.findDeleteId", e_id);
				if(pw.equals("delete")){
					try{
						//먼저, 알바생정보 테이블에서 아이디를 삭제하고, 회원테이블에서 아이디를 삭제시킨다. 
						sqlMap.delete("erpEmp.deleteEmployeeId", e_id);
						sqlMap.delete("erpEmp.deleteUserId", e_id);
						///////////////////////////////////////////////////////////////////
						//삭제가 성공했을때 count를 1씩올려주고 그 수가 삭제 해야하는 수와 같아지만 Query를 종료한다.
						j += 1;
						if(length == j){
							break;
						}
					}catch(Exception e){
						e.printStackTrace();
						check = 3; //삭제실패
					}
				}else{
				}
			}
		}
		
}catch(Exception e){
	e.printStackTrace();
}

model.addAttribute("check", check);*/