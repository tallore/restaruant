<%@page import="meminfoDAO.Notice_DAO"%>
<%@page import="meminfoVO.Notice_VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 보기</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
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
      <li><a href="../index.jsp">홈</a></li>
         <li><a href="../signup.jsp">회원가입</a></li>
         <li><a href="../login.jsp">로그인</a></li>
         <%}else{ %>
         <li><a href="../index.jsp">홈</a></li>
         <li><a href="../logout.jsp">로그아웃</a></li>
         <li><a href="../reservation/reslookup.jsp">내 예약</a></li>
         <% String id = (String) session.getAttribute("mname"); %>
         <% if(id.equals("manager")){ %>
            <li><a href="../menu/menulist.jsp">메뉴 관리하기</a></li>
            <li><a href="../reservation/reservationlist.jsp">예약 리스트</a></li>
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
							<li><a href = "../story/in.jsp" >인사말</a></li>
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
							<li><a href = "../reservation/res.jsp" >예약 하기</a></li>
						</ul>
					</li>
					<li class ="menu1" id="bigmenu4" onclick="kaja(document.getElementById('somenu4'))"><h3>Event</h3>
						<ul class="menu2" id="somenu4" style="display:none">
							<li><a href = "../event/event.jsp" >행사안내</a></li>
						</ul>
					</li>
					<li class ="menu1" id="bigmenu5" onclick="kaja(document.getElementById('somenu5'))"><h3>고객센터</h3>
						<ul class="menu2" id="somenu5" style="display:none">
							<li><a href = "Notice_D_Listform.jsp" >공지사항</a></li>
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
</div> 
<!-- 헤더부분 - end -->

<!-- 중앙 -->
<div id="middle">	

	<!-- leftMenu -->
	<div class="leftMenu">
		<h2>고객센터<span>customer center</span></h2>
		<div class="lm">
			<ul class="list">
				<li class="first"><a href="Notice_D_Listform.jsp"><span>공지사항</span></a></li>
				<li><a href="../Review_D/Review_D_Listform.jsp"><span>리뷰</span></a></li>
				<li class="last"><a href="../Question_D/Question_D_Listform.jsp"><span>고객의 소리</span></a></li>
			</ul>
		</div>
	</div>	
	<!-- leftMenu end -->
	
	<!-- mainList-->
	<div class="menuMenu">
		<!-- 메뉴이동경로 표시 -->
		<div class="menuintro">
			<h3>공지사항</h3>
			<ul class="road">
				<li class="home"><span>Home &ensp; -</span></li>
				<li><span>고객센터 &ensp; -</span></li>
				<li class="current"><span>공지사항</span></li>
			</ul>
		</div>
		<!-- 메뉴이동경로 표시 - end -->
		
		<!-- 메뉴판 -->
		<div class="contents">
			<div class="pclist">
	<%
		int num = Integer.parseInt(request.getParameter("num").trim());//공백 제거후 정수형으로 바뀜
		
		//데이터 베이스 접근
		Notice_DAO bdao = new Notice_DAO();
		
		//boardbean타입으로 하나의 게시글을 리턴
		Notice_VO vo = bdao.getOneBoard(num);
	%>
	
			<table width = "100%">
				<tr style="height: 40px; border-bottom: 1px solid #ddd;">
					<td width = "100" align ="center">글번호 </td>
					<td width = "180" align ="center" style="border-left: 1px solid #ddd;"><%=vo.getNum()%></td>
					<td width = "120" align ="center" style="border-left: 1px solid #ddd;">조회수 </td>
					<td width = "180" align ="center" style="border-left: 1px solid #ddd;"><%=vo.getCnt_ck1()%> </td>
				</tr>
				
				<tr style="height: 40px; border-bottom: 1px solid #ddd;">
					<td width = "100" align ="center">작성자 </td>
					<td width = "180" align ="center" style="border-left: 1px solid #ddd;"><%=vo.getId()%></td>
					<td width = "120" align ="center" style="border-left: 1px solid #ddd;">작성일 </td>
					<td width = "180" align ="center" style="border-left: 1px solid #ddd;"><%=vo.getD()%> </td>
				</tr>
		
				<tr style="height: 40px; border-bottom: 1px solid #ddd;">
					<td width = "120" align ="center">제목 </td>
					<td colspan = "3" align ="center" style="border-left: 1px solid #ddd;"><%=vo.getTitle()%></td>
				</tr>
				
				<tr style="min-height: 400px; border-bottom: 1px solid #ddd;">
					<td width = "120" align ="center">글 내용 </td>
					<td colspan = "3" align ="center" style=" padding-left: 50px; padding-right: 50px; border-left: 1px solid #ddd;"><textarea rows= "10" cols = "60" name = "content" style=" width: 100%; height: 320px; vertical-align: middle; " readonly="readonly"><%=vo.getContent1()%></textarea></td>
				</tr>
				
				<tr height = "40">
					<td align ="center" colspan = "4"> 
						<% if(vo.getId().equals(session.getAttribute("mname"))) { %>
						<input type="button" value="수정하기" onclick="location.href='Notice_D_Updateform.jsp?num=<%=vo.getNum()%>'"> 
						<% } else if(session.getAttribute("mname") == null){ 
							
						} else {%>
							<script type="text/javascript">
								alert("본인 게시글만 수정가능합니다.");
								history.go(-1);
							</script>
						<% } %>	
						<% if(vo.getId().equals(session.getAttribute("mname"))) { %>
						<input type="button" value="삭제하기" onclick="location.href='Notice_D_Deleteform.jsp?num=<%=vo.getNum()%>'"> 
						<% } else if(session.getAttribute("mname") == null){ 
							
						} else {%>
							<script type="text/javascript">
								alert("본인 게시글만 삭제가능합니다.");
								history.go(-1);
							</script>
						<% } %>	
						<input type="button" value="목록보기" onclick="location.href='Notice_D_Listform.jsp'">     
					</td>
				</tr>
		</table>

			</div>
		</div>
	</div>
</div>

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