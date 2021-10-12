<%@page import="meminfoVO.ReserveVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="meminfoDAO.ReserveDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta charset="utf-8">

<title>예약리스트 관리</title>
<%
request.setCharacterEncoding("UTF-8");////
ReserveDAO rdao = new ReserveDAO();
ArrayList<ReserveVO> rslist = rdao.reserveList();
%>

<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css'>
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
				<li class="first"><a href="res.jsp"><span>예약관리</span></a></li>
			</ul>
		</div>
	</div>	
	<!-- leftMenu end -->
	
	<!-- mainList-->
	<div class="menuMenu">
		<!-- 메뉴이동경로 표시 -->
		<div class="menuintro">
			<h3>예약</h3>
			<ul class="road">
				<li><span>예약</span></li>
				<li class="current"><span>예약리스트</span></li>
			</ul>
		</div>
		<!-- 메뉴이동경로 표시 - end -->
		
		<!-- 메뉴판 -->
		<div class="contents">
			<div class="pclist">
<script>
$(function(){
//전체 체크 클릭시 체크박스 전체 체크됨
$('#allCheck').click(function(){
   if($('#allCheck').prop('checked')){
      $('input[name=ckbox]').prop('checked',true);
   } else {
      $('input[name=ckbox]').prop('checked',false);
   }
});

//체크된 체크박스를 해제하면 [전체 선택] 체크박스도 해제되고 개별 체크박스를 전부 선택하면 [전체 선택] 체크박스도 선택되도록 처리
$('input[name=ckbox]').click(function(){
   if($('input[name=ckbox]:checked').length==$('input[name=ckbox]').length){
      $('#allCheck').prop('checked',true);
   } else {
      $('#allCheck').prop('checked',false);
   }
});

//체크 안하고 전송하거나 체크 하고 전송할 시
$('#frm').submit(function(){
	   if($('input[name=ckbox]:checked').length==0){
		   alert("최소 1개 이상 선택해주세요.");
		   return false;
	   }
	   var answer = confirm("정말 삭제하시겠습니까?");
	   if(answer==true){ //확인
		document.form.submit();
	   } else {
		   return false;
	   }
	});
	
});
</script>
<h1>예약 리스트</h1>
<form action="rsDelete.do" method="post" id="frm"> <!-- 리스트삭제 -->
<table border=1>
<tr>
   <td>예약 번호</td><td>예약 날짜</td><td>예약 시간</td><td>예약자 성함</td><td>예약자 전화번호</td><td>세트메뉴</td><td>인원 수</td><td>요청사항</td><td>가격</td><td>결제 방법</td><td>결제 여부</td>
   <td><input type="checkbox" id="allCheck"></td>
</tr>
   <%
   for(ReserveVO tmp:rslist) {%>
   <tr>
      <td> <%=tmp.getRnum() %></td>
      <td> <%=tmp.getRdate() %></td>
      <td> <%=tmp.getRtime() %></td>
      <td> <%=tmp.getRname() %></td>
      <td> <%=tmp.getRtel() %></td>
      <td> <%=tmp.getSetmenu() %></td>
      <td> <%=tmp.getPeople() %></td>
      <td> <%=tmp.getRequire() %></td>
      <td> <%=tmp.getTotalprice() %></td>
      <td> <%=tmp.getPayway() %></td>
      <td> <%=tmp.getPayyn() %></td>
      <td><input type="checkbox" name="ckbox" value="<%=tmp.getRnum()%>"></td>
      <%} %>
   </tr>
</table>
<input type="submit" value="삭제하기">
</form>
</div>
				</div>
			</div>
		</div>
		<!-- 메뉴판 - end -->

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