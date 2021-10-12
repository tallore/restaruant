<%@page import="meminfoVO.Review_VO"%>
<%@page import="meminfoDAO.Review_DAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
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
							<li><a href = "../Notice_D/Notice_D_Listform.jsp" >공지사항</a></li>
							<li><a href = "Review_D_Listform.jsp" >리뷰</a></li>
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
				<li class="first"><a href="../Notice_D/Notice_D_Listform.jsp"><span>공지사항</span></a></li>
				<li><a href="Review_D_Listform.jsp"><span>리뷰</span></a></li>
				<li class="last"><a href="../Question_D/Question_D_Listform.jsp"><span>고객의 소리</span></a></li>
			</ul>
		</div>
	</div>	
	<!-- leftMenu end -->
	
	<!-- mainList-->
	<div class="menuMenu">
		<!-- 메뉴이동경로 표시 -->
		<div class="menuintro">
			<h3>리뷰</h3>
			<ul class="road">
				<li class="home"><span>Home &ensp; - </span></li>
				<li><span>고객센터 &ensp; - </span></li>
				<li class="current"><span>리뷰</span></li>
			</ul>
		</div>
		<!-- 메뉴이동경로 표시 - end -->
		
		<!-- 메뉴판 -->
		<div class="contents">
			<div class="pclist">
			<form action="" method="post">
	<!--게시글 보기에 카운터링을 설정하기 위한 변수들을 선언-->
	<% 
		//화면에 보여질 게시글의 개수를 지정 
		int pageSize=10;
		
		//현재 카운터를 클릭한 번호 값을 읽어 옴 
		String pageNum = request.getParameter("num");
		
		//만약 처음  boardlist.jsp를 클릭하거나 수정 삭제 등 다른 게시글에서 이 페이지로 넘어오면 pageNum값이 없기에 null값 처리 
		if(pageNum==null){
			pageNum="1";
		}
		
		int count = 0; // 전체 글의 갯수를 저장하는 변수 
		int number = 0;//페이지 넘버링 변수
		
		//현재 보고자 하는 페이지 숫자를 지정
		int currentPage = Integer.parseInt(pageNum);
		
		//전체 게시글의 내용을 jsp쪽으로 가져와야함
		Review_DAO Ndao = new Review_DAO();
		
		//전체 게시글의 갯수를 읽어드린 메소드 호출 
		count = Ndao.getAllCount();
		
		//현재 페이지에 보여줄 시작 번호를 설정 =데이터 베이스에서 불러올 시작 번호 
		int startRow = (currentPage-1)*pageSize + 1;
		int endRow = currentPage * pageSize;
		
		//최신글 10개를 기준으로  게시글을 리턴 받아주는 메소드 호출
		ArrayList<Review_VO> narray = Ndao.getAllBoard(startRow, endRow);
		
		//테이블에 표시할 번호 지정
		number = count  - (currentPage-1)*pageSize;
	%>	
		
				<table style="width: 100%; table-layout: fixed"  > 
				<colgroup> 
				 <col width="70px" style="border-right: 2px solid #ddd; " />
				 <col width="330px" style="border-right: 2px solid #ddd; " />
				 <col width="135px" style="border-right: 2px solid #ddd; " />
				 <col width="155px" style="border-right: 2px solid #ddd; " />
				 <col width="70px" style="border-right: 2px solid #ddd; " />
				 <col width="70px" />
				</colgroup>
					<tr style="height: 40px; border-bottom: 1px solid #ddd;" >
						<td align ="right" colspan = "6" style="padding-right: 20px;">
							<input type="button" value="글쓰기" onclick="location.href='Review_D_Writeform.jsp'">
						</td>
					</tr>
	
					<tr style="height: 40px; border-bottom: 1px solid #ddd;"align="center">
						<td>No.</td>
						<td>제목</td>
						<td>작성자</td>
						<td>별점</td>
						<td>작성일</td>
						<td>조회수</td>
					</tr>
			<% 
			for(int i=0;i < narray.size();i++){
				Review_VO vo = narray.get(i);// 벡터에 저장되어있는 빈 클래스 하나씩 추출 
			%>
					<tr style="height: 30px; border-bottom: 1px solid #ddd;">
						<td><%=i+1%></td>
						<td style =" text-decoration:none; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; padding-left: 10px; padding-right: 10px;">
							<a href= "Review_D_Info.jsp?num=<%=number%>">
							<%=vo.getTitle()%>
							</a>
						</td>
						<td><%=vo.getId()%></td>
						<td><%=vo.getStar()%></td>
						<td><%=vo.getD()%></td>
					</tr>
				<%}%>
			
		</table>
		
		<p align="center" style="padding-top: 10px; padding-bottom: 10px; ">
	<!-- 페이지 카운터링 소스를   -->
		<% 
			if(count > 0){
				int pageCount = count /pageSize + (count%pageSize == 0 ? 0 : 1 );//카운터링 숫자를 얼마까지 보여줄껀지 결정 
				
				//시작 페이지 숫자를 설정 
				int startPage = 1;
				if(currentPage%10 !=0){
					startPage = ((int)(currentPage/10))*10+1;
				}else{
					startPage = ((int)(currentPage/10)-1)*10+1;	
				}
				
				int pageBlock=10;//카운터링 처리 숫자 
				int endPage = startPage+pageBlock-1;//화면에 보여질 페이지의 마지막 숫자 
				
				 if(endPage > pageCount) endPage = pageCount;
				
				//이전이라는 링크를 만들건지 파악 	 
				if(startPage > 10){
		%>				
					<a href="Review_D_Listform.jsp?pageNum=<%=startPage-10%>">[이전]</a>
		<%			
				}	 
				//페이징 처리 
				for(int i=startPage;i<=endPage;i++){
		%>			
					<a href="Review_D_Listform.jsp?pageNum=<%=i%>">[<%=i %>]</a>
		<% 			
				}
				//다음이라는 링크를 만들건지 파악
				if(endPage < pageCount){
		%>		
				<a href="Review_D_Listform.jsp?pageNum=<%=startPage+10%>">[다음]</a>	
		<% 
				}	
			}
		%>
		</p>
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