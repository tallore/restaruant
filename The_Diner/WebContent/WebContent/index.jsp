<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메인</title>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css'>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script> 
	
      function kaja(bada){
          var somenu1=document.getElementById('somenu1')
          somenu1.style.display="none"
          
          var somenu2=document.getElementById('somenu2')
          somenu2.style.display="none"
          
          var somenu3=document.getElementById('somenu3')
          somenu3.style.display="none"
          
          var somenu3=document.getElementById('somenu4')
          somenu3.style.display="none"
         
          var somenu3=document.getElementById('somenu5')
          somenu3.style.display="none"
          
          bada.style.display="block"
          
       }

</script>

</head>
<body>

<div id = "wrap"> <!-- 헤더부분 -->
<div class="aa">
	<!-- 메뉴바 -->
	<div class="intro"> <!-- 메인에서는 몰라도 메뉴에서는 사진 사이즈나 나오는 사진이 다르게 하기위해 이름변경 -->
		
	<!-- 홈/회원가입/내정보 -->
		<ul class = "nav2">
		<%if(session.getAttribute("stv")==null){ %>
		<li><a href="index.jsp">홈</a></li>
			<li><a href="signup.jsp">회원가입</a></li>
			<li><a href="login.jsp">로그인</a></li>
			<%}else{ %>
			<li><a href="index.jsp">홈</a></li>
			<li><a href="logout.jsp">로그아웃</a></li>
			<li><a href="reservation/reslookup.jsp">내 예약</a></li>
			<% String id = (String) session.getAttribute("mname"); %>
			<% if(id.equals("manager")){ %>
				<li><a href="menu/menulist.jsp">메뉴 관리하기</a></li>
				<li><a href="reservation/reservationlist.jsp">예약 리스트</a></li>
			<%} %>
			<%} %>
		</ul>
		<!-- 홈/회원가입/내정보 - end-->
			
		
		<div class="header">
			
			<div class="title"><a href = "index.jsp"><h1>The_Diner</h1></a></div> <!-- 타이틀 -->
			
			<div class = "nav">
				
				<ul class="list">
					<li class ="menu1" id="bigmenu1" onclick="kaja(document.getElementById('somenu1'))"><h3>The_Diner story</h3>
						<ul class="menu2" id="somenu1" style="display:none">
							<li><a href = "story/in.jsp" >인삿말</a></li>
							<li><a href = "story/chf.jsp" >셰프소개</a></li>
							<li><a href = "story/one.jsp" >원산지</a></li>
							<li><a href = "story/oh.jsp" >오시는길</a></li>
						</ul>
					</li>			
					<li class ="menu1" id="bigmenu2" onclick="kaja(document.getElementById('somenu2'))"><h3>Menus</h3>
						<ul class="menu2" id="somenu2" style="display:none">
						 <li><a href = "menu/set.jsp" >세트메뉴</a></li>
						 <li><a href = "menu/steak.jsp" >스테이크</a></li>
						 <li><a href = "menu/pasta.jsp" >파스타</a></li>
						 <li><a href = "menu/salad.jsp" >샐러드</a></li>
						 <li><a href = "menu/drink.jsp" >음료</a></li>
						</ul>
					</li>
					<li class ="menu1" id="bigmenu3" onclick="kaja(document.getElementById('somenu3'))"><h3>예약</h3>
						<ul class="menu2" id="somenu3" style="display:none">
							<li><a href = "reservation/res.jsp" >예약 하기</a></li>
						</ul>
					</li>
					<li class ="menu1" id="bigmenu4" onclick="kaja(document.getElementById('somenu4'))"><h3>Event</h3>
						<ul class="menu2" id="somenu4" style="display:none">
							<li><a href = "event/event.jsp" >이벤트안내</a></li>
						</ul>
					</li>
					<li class ="menu1" id="bigmenu5" onclick="kaja(document.getElementById('somenu5'))"><h3>고객센터</h3>
						<ul class="menu2" id="somenu5" style="display:none">
							<li><a href = "Notice_D/Notice_D_Listform.jsp" >공지사항</a></li>
							<li><a href = "Review_D/Review_D_Listform.jsp" >리뷰</a></li>
							<li><a href = "Question_D/Question_D_Listform.jsp" >고객의 소리</a></li>
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
	<br />
	<br />
	<br />
<div class = "index_main">
	<div class = "index_res">
	<table class = "index_table">
		<tr align ="center">
		<% String id = (String) session.getAttribute("mname");  %>
				<script type="text/javascript">
					function reschk(){
						<% if(id!=null){%>
						location.href="reservation/res.jsp";
						<%} else{%>
						alert("비회원은 예약이 불가능합니다.");
						<%}%>
					}
				</script>
			<td><a style="cursor:pointer" onclick="reschk()"><img  src="image/res.png"><p class = "index_p">예약하기</p></a></td>
			<td><a href ="Notice_D/Notice_D_Listform.jsp"><img  src="image/notice.png"><p class = "index_p">공지사항</p></a></td>
		</tr>
	</table>
	</div>
		<br />
	<br />
	<br />
	<div class = "index_menu">
	<h1>Menus</h1>
	</div>
	<table border="0" class = "index_mtable">

		<tr align ="center">	
			<td><a href ="menu/steak.jsp">Steak</a></td>
			<td><a href ="menu/pasta.jsp">Pasta</a></td>
			<td><a href ="menu/salad.jsp">Salad</a></td>
			<td><a href ="menu/drink.jsp">Drink</a></td>
		</tr>
	</table>
	<br />
	<br />
	<br />
	<br />
<div class="slide_wrapper ">
  <ul class="slides flex">
    <li><a href = "menu/steak.jsp"><img src="image/s1.png" alt=""></a></li>
    <li><a href = "menu/steak.jsp"><img src="image/s2.png" alt=""></a></li>
    <li><a href = "menu/steak.jsp"><img src="image/s3.jpg" alt=""></a></li>
    <li><a href = "menu/steak.jsp"><img src="image/s4.png" alt=""></a></li>
    <li><a href = "menu/steak.jsp"><img src="image/s5.jpg" alt=""></a></li>
    <li><a href = "menu/pasta.jsp"><img src="image/p1.jpg" alt=""></a></li>
    <li><a href = "menu/pasta.jsp"><img src="image/p2.jpg" alt=""></a></li>
    <li><a href = "menu/pasta.jsp"><img src="image/p3.jpg" alt=""></a></li>
    <li><a href = "menu/pasta.jsp"><img src="image/p4.jpg" alt=""></a></li>
    <li><a href = "menu/pasta.jsp"><img src="image/p5.png" alt=""></a></li>
    <li><a href = "menu/salad.jsp"><img src="image/sd1.jpg" alt=""></a></li>
    <li><a href = "menu/salad.jsp"><img src="image/sd2.jpg" alt=""></a></li>
    <li><a href = "menu/salad.jsp"><img src="image/sd3.jpg" alt=""></a></li>
    <li><a href = "menu/salad.jsp"><img src="image/sd4.jpg" alt=""></a></li>
    <li><a href = "menu/salad.jsp"><img src="image/sd5.jpg" alt=""></a></li>
    <li><a href = "menu/drink.jsp"><img src="image/d1.png" alt=""></a></li>
    <li><a href = "menu/drink.jsp"><img src="image/d2.png" alt=""></a></li>
    <li><a href = "menu/drink.jsp"><img src="image/d3.png" alt=""></a></li>
    <li><a href = "menu/drink.jsp"><img src="image/d4.jpg" alt=""></a></li>
    <li><a href = "menu/drink.jsp"><img src="image/d5.jpg" alt=""></a></li>
    <li><a href = "menu/drink.jsp"><img src="image/d6.jpg" alt=""></a></li>
  </ul>
  <p class="controls">
    <span class="prev"><i class="fas fa-chevron-left"></i></span>
    <span class="next"><i class="fas fa-chevron-right"></i></span>
  </p>
</div>
</div>
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