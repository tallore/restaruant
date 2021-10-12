<%@page import="meminfoVO.MenuVO"%>
<%@page import="meminfoDAO.ReserveDAO"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약</title>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css'>
<link rel="stylesheet" type="text/css" href="../css/style.css">

<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- timepicker -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<!-- 예약관련 스크립트  -->
<script src="reserve.js" charset="utf-8"></script>
</head> 
<body>
<div id = "wrap"> <!-- 헤더부분 -->
<div class="aa">
	<!-- 메뉴바 -->
	<div class="intro"> <!-- 메인에서는 몰라도 메뉴에서는 사진 사이즈나 나오는 사진이 다르게 하기위해 이름변경 -->
		
		<!-- 홈/회원가입/내정보 -->
		<ul class = "nav2">
      <%if(session.getAttribute("stv")==null){ %>
      <script>alert('로그인을 해주세요.');
      location.href="../login.jsp";</script>
               <%}else{ %>
         <li><a href="../index.jsp">홈</a></li>
         <li><a href="../logout.jsp">로그아웃</a></li>
         <li><a href="reslookup.jsp">내 예약</a></li>
         <% String id = (String) session.getAttribute("mname"); %>
         <% if(id.equals("manager")){ %>
            <li><a href="../menu/menulist.jsp">메뉴 관리하기</a></li>
            <li><a href="reservationlist.jsp">예약 리스트</a></li>
         <%} %>
         <%} %>
      </ul>
		<!-- 홈/회원가입/내정보 - end-->
			
		
		<div class="header">
			
			<div class="title"><a href = "../index.jsp"><h1>The_Diner</h1></a></div> <!-- 타이틀 -->
			
			<div class = "nav">
				
				<ul class="list">
					<li class ="menu1" id="bigmenu1" onclick="kaja(document.getElementById('somenu1'))"><h3>The_Diner story</h3>
						<ul class="menu2" id="somenu1" style="display:none">
							<li><a href = "../story/in.jsp" >인삿말</a></li>
							<li><a href = "../story/chf.jsp" >셰프소개</a></li>
							<li><a href = "../story/one.jsp" >원산지</a></li>
							<li><a href = "../story/oh.jsp" >오시는길</a></li>
						</ul>
					</li>			
					<li class ="menu1" id="bigmenu2" onclick="kaja(document.getElementById('somenu2'))"><h3>Menus</h3>
						<ul class="menu2" id="somenu2" style="display:none">
						 <li><a href = "../menu/set.jsp" >세트메뉴</a></li>
						 <li><a href = "../menu/steak.jsp" >스테이크</a></li>
						 <li><a href = "../menu/pasta.jsp" >파스타</a></li>
						 <li><a href = "../menu/salad.jsp" >샐러드</a></li>
						 <li><a href = "../menu/drink.jsp" >음료</a></li>
						</ul>
					</li>
					<li class ="menu1" id="bigmenu3" onclick="kaja(document.getElementById('somenu3'))"><h3>예약</h3>
						<ul class="menu2" id="somenu3" style="display:none">
							<li><a href = "res.jsp" >예약 하기</a></li>
						</ul>
					</li>
					<li class ="menu1" id="bigmenu4" onclick="kaja(document.getElementById('somenu4'))"><h3>Event</h3>
						<ul class="menu2" id="somenu4" style="display:none">
							<li><a href = "../event/event.jsp" >이벤트안내</a></li>
					
						</ul>
					</li>
					<li class ="menu1" id="bigmenu5" onclick="kaja(document.getElementById('somenu5'))"><h3>고객센터</h3>
						<ul class="menu2" id="somenu5" style="display:none">
							<li><a href = "../Notice_D/Notice_D_Listform.jsp" >공지사항</a></li>
							<li><a href = "../Review_D/Review_D_Listform.jsp" >리뷰</a></li>
							<li><a href = "../Question_D/Question_D_Listform.jsp" >고객의 소리</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<!-- 메뉴바 - end -->	
</div>
</div>

<!-- 	<div class="img-box">
		<img class="imgg">  나중에 사진넣을때 참고 -->	
<!-- 	<div style="background-image: url('../image/s8.png'')"></div> -->
</div> 
<!-- 헤더부분 - end -->

<!-- 중앙 -->
<div id="middle">	

	<!-- leftMenu -->
	<div class="leftMenu">
		<h2>예약<span>reservation</span></h2>
		<div class="lm">
			<ul class="list">
				<li class="first"><a href="res.jsp"><span>예약하기</span></a></li>
			</ul>
		</div>
	</div>	
	<!-- leftMenu end -->
	
	<!-- mainList-->
	<div class="menuMenu">
		<!-- 메뉴이동경로 표시 -->
		<div class="menuintro">
			<h3>예약하기</h3>
			<ul class="road">
				<li class="home"><span>Home</span></li>
				<li><span>예약</span></li>
				<li class="current"><span>예약하기</span></li>
			</ul>
		</div>
		<!-- 메뉴이동경로 표시 - end -->
		
		<!-- 메뉴판 -->

		<div class="contents">
			<div class="pclist">
			<form action="reserve.do" method="post" id="frmres">
				<table class ="table">
					<tr>	
						<td class="first"><h3>예약 날짜</h3></td>
						<td><input type = "text" name ="rdate" id="datepicker" required></td>
					</tr>
					<tr>	
						<td class="first"><h3>예약 시간</h3></td>
						<td><input type="text" name ="rtime" id="timepicker"  required></td>
					</tr>
					<tr>	
						<td class="first"><h3>인원수</h3></td>
						<td><input type = "number" name ="people"  min="0" max="10" required> 명</td>
					</tr>
					<tr>	
						<td class="first"><h3>세트메뉴</h3><br><span>예약예약은 세트메뉴만 가능하고  <br>
   							예약금 5천원은 따로 결제됩니다.</span></td>
						<td>
						<table>						
							<tr>			
 <%
request.setCharacterEncoding("UTF-8");
ReserveDAO rsdao = new ReserveDAO();
ArrayList<MenuVO> marr = rsdao.menuVal();
/* 내림차순 정렬 */
Collections.sort(marr, new Comparator<MenuVO>(){
	public int compare(MenuVO o1, MenuVO o2) {
        if(o1.getMnum()>o2.getMnum()) {
            return 1;
        }else if(o1.getMnum()<o2.getMnum()) {
            return -1;
        }else {
            return 0;
        }
    }
});
request.setAttribute("marr", marr);
%>	
								<td>${marr[0].menu} (${marr[0].price}원)</td>								
								<td>${marr[1].menu} (${marr[1].price}원)</td>								
								<td>${marr[2].menu} (${marr[2].price}원)</td>		
							</tr>
							<tr style="display:none">
								<td><input type="hidden"  id="APrice" value="${marr[0].price }"></td>
								<td><input type="hidden"  id="BPrice" value="${marr[1].price }"></td>
								<td><input type="hidden"  id="CPrice" value="${marr[2].price }"></td>
							</tr>
							<tr>
								<td>${marr[0].menudetail}</td>
								<td>${marr[1].menudetail}</td>
								<td>${marr[2].menudetail}</td>
							</tr>
							<tr>
								<td><input type = "number" class="setmenu" name ="Aset" id="setmenu1" min="0" max="10" value="0" required></td>
								<td><input type = "number" class="setmenu" name ="Bset" id="setmenu2" min="0" max="10" value="0" required></td>
								<td><input type = "number" class="setmenu" name ="Cset" id="setmenu3" min="0" max="10" value="0" required></td>
							</tr>
							선택안함 <input type="checkbox" name="noset" id="ck_no">
						</table>
						</td>
					</tr>
					<tr>
						<td class="first"><h3>가격</h3></td>
						<td><input type="text" name="price" id="totPrice" placeholder="예약금 5000원" readonly></td>
						<td><input type="hidden" id="deposit" value="5000"></td>
					</tr>
					<tr>	
						<td class="first"><h3>예약자 이름</h3></td>
						<td><input type = "text" name = "rname" required></td>
					</tr>
					<tr>	
						<td class="first"><h3>예약자 전화번호</h3></td>
						<td><input type = "text" name = "rtel" required placeholder = '010-1234-5678'></td>
					</tr>
					<tr>	
						<td class="first"><h3>요청사항</h3></td>
						<td><input type = "text" name = "require"></td>
					</tr>

				</table>
				<input class="bt" type = "submit" value="예약하기">
				</form>
				</div>
			</div>
		</div>
		<!-- 메뉴판 - end -->
	</div>
	<!-- mainList - end-->
<!-- 중앙 - end -->

<!-- footer -->
<div id="footer">
	<div class="info">
		<h1>The_Diner</h1>
		<ul class="list">
			<li class="first">주소 : 서울특별시 종로구 돈화문로 26 단성사 3층</li>
			<li>(주)The_Diner</li>
			<li>TEL : (02) 3672-9100 (내선 3번)</li>
			<li class="last">FAX : 보내지마</li>
		</ul>
		
		<ul class="list">
			<li class="first">법인명(상호명) : (주)3조</li>
			<li>대표자 : 배경은</li>
			<li class="last">사업자등록번호 : 000-00-00000</li>
		</ul>
	</div>
</div>
<!-- footer end-->
</body>
</html>