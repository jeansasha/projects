# project
### 목차
 1. 프로젝트 소개<br>
  1-1. 기능<br>
  1-2. 개발환경<br>
 
 2. 구성<br>
  2-1. Database<br>
  2-2. Model<br>
  2-3. View<br>
  2-4. Controller<br>

3. 마치며   
 <hr/>

 
### 1. 프로젝트 소개<br>
 1-1. 기능<br>
  * 데이터 수집
    - Python으로 크롤링 및 스크래핑하여 데이터를 DB에 적재
  * 메인
    - 디저트 및 레시피 추천 사이트
    - 상황에 따른 디저트 메뉴 랜덤으로 출력
  * 회원관리
    - 회원가입, 로그인, 정보수정, 탈퇴 기능 제공
  * 게시판     
    - 글 작성, 읽기, 수정, 삭제 기능 제공
  
 1-2. 개발환경<br>
  - IDE : Eclipse, Pycharm   
  - 언어 : Java, Python, html, css, Javascript, JQuery, Jstl, JSP   
  - DB : Oracle   
  - WAS : Tomcat   

### 2. 구성  
 2-1. Database<br>
 <img src="https://user-images.githubusercontent.com/75660501/111900337-5bbf4300-8a75-11eb-842e-5c9a1fb37196.png" width="50%"/><br>
 ** Dessert 테이블에 추천 대상 디저트들의 기본정보를 저장   
 ** Kinds 테이블의 종류별코드를 이용하여 랜덤 레시피 추출      
 ** Kinds 테이블에서 디저트 종류 관리, Dessert 테이블에서 Kinds테이블의 종류별코드를 외래키로 사용   
 ** D_Member 테이블에서 회원 목록 관리하고 Board 테이블의 회원번호키를 외래키로 사용하여 회원별 게시판 정보 저장    
 
 2-2. 컴포넌트 구성<br>
  <img src="https://user-images.githubusercontent.com/75660501/112126290-a4a70100-8c07-11eb-9b07-4b6507150858.png" width="250px"/>
  <img src="https://user-images.githubusercontent.com/75660501/112126344-b5f00d80-8c07-11eb-9695-a1b00e96dd28.png" width="250px"/>
  <img src="https://user-images.githubusercontent.com/75660501/112126421-c86a4700-8c07-11eb-96c2-5f618a2e77c6.png" width="250px"/>
 
 2-3. 라이브러리    

```
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/recs.css" type="text/css">
  <!-- ##### All Javascript Script ##### -->
  <!-- jQuery-2.2.4 js -->
  <script src="js/jquery/jquery-2.2.4.min.js"></script>
  <!-- Popper js -->
  <script src="js/bootstrap/popper.min.js"></script>
  <!-- Bootstrap js -->
  <script src="js/bootstrap/bootstrap.min.js"></script>
  <!-- All Plugins js -->
  <script src="js/plugins/plugins.js"></script>
  <!-- Active js -->
  <script src="js/active.js"></script>
  ```

* header 와 footer import<br>

```
<c:import url="/WEB-INF/header.jsp"></c:import>
<c:import url="/WEB-INF/footer.jsp"></c:import>
```

 2-4. Model<br>
 * MemberDAO.java(회원가입)
```
public int signup(MemberVO vo) { 
Connection conn = null;
PreparedStatement pstmt = null;
int count = 0;

try {
  // DB 접속
  Class.forName("oracle.jdbc.driver.OracleDriver");

  String url = "jdbc:oracle:thin:@localhost:1521:xe";
  conn = DriverManager.getConnection(url, "desr", "desr");
  // 쿼리문 생성
  String query = "insert into d_member (Mem_code,Mem_name,Mem_id,Mem_pwd,Mem_num) values (seq_mem_code.nextval, ?, ?, ?, ?)";
  pstmt = conn.prepareStatement(query);
  // 파라미터 세팅
  pstmt.setString(1, vo.getMem_name());
  pstmt.setString(2, vo.getMem_id());
  pstmt.setString(3, vo.getMem_pwd());
  pstmt.setString(4, vo.getMem_num());

  count = pstmt.executeUpdate();

  System.out.println(count + "건 등록");


} catch (ClassNotFoundException e) {
  System.out.println("error: 드라이버 로딩 실패 - " + e);
} catch (SQLException e) {
  System.out.println("error:" + e);
} finally {
  try {
    if (pstmt != null)
      pstmt.close();
    if (conn != null)
      conn.close();
  } catch (SQLException e) {
    System.out.println("error:" + e);
  }
}
return count;
}
```

 
 2-5. View<br>
 * signUp.jsp(회원가입)
 ```
 <form action="signUp" method="post" >
  <div>
  <h5>회원가입</h5>
    <br><p style="color: steelblue">*  는 필수 입력칸입니다</p>
    <!-- 이름 -->
    *<input class="logincss" type="text" name="mem_name" id = "name" autofocus placeholder=" 이름을 입력하세요." required><br> 
     <div class="alert alert-danger" id = "name-danger">이름에 숫자, 특수문자, 공백은 포함될 수 없습니다</div>

    <!-- 아이디 -->
    *<input class="logincss" type="text" name="mem_id" id= "id" placeholder=" 아이디를 입력하세요." onkeydown="idCh" maxlength="10" required><br>
     <div class="alert alert-danger" id = "id-danger">4~10자리의 영문으로 입력가능하며 공백은 포함될 수 없습니다 </div>

    <!-- 비밀번호 -->
    *<input class="logincss" type="password" name="mem_pwd" id="pwd1" placeholder=" 비밀번호."  maxlength="12" required><br>
      <div class="alert alert-danger" id = "password-danger">8자리 ~ 12자리로 입력가능하며 공백은 포함될 수 없습니다</div>

    <!-- 비밀번호확인 -->
    *<input class="logincss" type="password" name="mem_pwd1" id="pwd2" placeholder=" 비밀번호확인." maxlength="12" required><br>
      <div class="alert alert-danger" id = "alert-danger">비밀번호가 일치하지 않습니다</div> 

    <!-- 전화번호 -->	
    <p>' - '를 포함해서 입력해주세요.</p>
    *<input class="logincss" type="text" name="mem_num" id="num" placeholder=" 전화번호." required><br>
      <div class="alert alert-danger" id = "num-danger">전화번호 형식에 맞지 않습니다 </div>

  </div>
  <div style="margin-top: 5%">
    <input class="loginbutton" type="submit" value="회원가입" onclick="return check()" id="signup" />
  </div>
</form>
```
  
 
* 정규표현식 사용하여 유효성 검사
```
//이름 공식
var reg1 = /^[가-힣a-zA-Z]{2,}$/;
//아이디 공식
var reg2 = /^[a-zA-Z0-9]{4,10}$/; 
//비밀번호 공식
var reg3 = /^[a-zA-Z0-9]{8,12}$/;
//전화번호 공식
var reg4 = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;

$(function(){
    $("#name-danger").hide();
    $("#id-danger").hide();
    $("#password-danger").hide();
    $("#alert-danger").hide();
    $("#num-danger").hide();

   //---- 이름 검사 ----//
   $("#name").keyup(function() {
      if(!reg1.test($("#name").val())){
         $("#name-danger").show();
      } else {
         $("#name-danger").hide();
      }
   });

   //---- 아이디 검사 ----//
   $("#id").keyup(function() {
      if(!reg2.test($("#id").val())){
         $("#id-danger").show();
      } else {
         $("#id-danger").hide();
      }
   });

   //---- 비밀번호 검사 ----//
   $("#pwd1").keyup(function() {
      if(!reg3.test($("#pwd1").val())){
         $("#password-danger").show()
      } else {
         $("#password-danger").hide()
      }
   });

   // 비밀번호 일치 확인
   $("#pwd2").keyup(function() {
   var pwd1 = $("#pwd1").val();
   var pwd2 = $("#pwd2").val(); 
      if(pwd1 != pwd2){
         $("#alert-danger").show();
      }else {
         $("#alert-danger").hide();
      }
   });

   //---- 전화번호 검사 ----//
   $("#num").keyup(function() {
      if(!reg4.test($("#num").val())){
         $("#num-danger").show();
      } else {
         $("#num-danger").hide();
      }
   });
});
```

  
 2-6. Controller<br>
 * SignupController.java회원가입)
 ```
@WebServlet("/signUp")
public class SignupController extends HttpServlet {

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    request.getRequestDispatcher("/WEB-INF/view/user/signUpForm.jsp").forward(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");
    String mem_name = request.getParameter("mem_name");
    String mem_id = request.getParameter("mem_id");
    String mem_pwd = request.getParameter("mem_pwd");
    String mem_num = request.getParameter("mem_num");

    MemberDAO dao = new MemberDAO();
    MemberVO vo = dao.idcheck(mem_id);

    if (vo == null) {
      System.out.println("사용가능한 아이디");

      vo = new MemberVO(mem_name, mem_id, mem_pwd, mem_num);
      dao.signup(vo);
      response.sendRedirect("/login");
    } else {
      request.setAttribute("vo1", vo);

      request.getRequestDispatcher("/WEB-INF/view/user/signUpForm.jsp").forward(request, response);
    }
  }
  ```

** 회원가입페이지로 이동 시에는 Get방식으로 signUpForm.jsp으로 이동     
** 회원가입 시 회원정보 입력 후 Post방식으로 회원정보를 전송   
** idcheck를 통해 중복된 아이디가 없을 경우 입력된 정보를 DB에 저장    
** 정상적으로 저장되면 로그인화면으로 넘어가서 새로 로그인하도록 함.   

### 2. 마치며   
 팀 프로젝트를 마치고, 추가적으로 미흡한 부분 수정
  - 페이징 오류
  - 게시판 글 수정 오류
  - 랜덤레시피 출력 오류
  - css 오류



