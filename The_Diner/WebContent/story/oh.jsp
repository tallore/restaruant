<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>스테이크</title>
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
 <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b232ff69941161368b49535d332df511"></script>
      
      <script>
              window.onload=function() {
                      var joongang1 = new daum.maps.LatLng(37.570970, 126.992358);
                      var mapDesign1 = {
                                      zoom:15,
                                      center:joongang1,
                                      mapTypeId:daum.maps.MapTypeId.ROADMAP
                                      // mapTypeId:daum.maps.MapTypeId.HYBRID
                      };
                      var map = new daum.maps.Map(document.getElementById("jido1"), mapDesign1);
                    //  var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

                   // 마커가 표시될 위치입니다 
                   var markerPosition  = new kakao.maps.LatLng(37.570970, 126.992358); 

                   // 마커를 생성합니다
                   var marker = new kakao.maps.Marker({
                       position: markerPosition
              });
                   marker.setMap(map);
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
							<li><a href = "in.jsp" >인삿말</a></li>
							<li><a href = "chf.jsp" >셰프소개</a></li>
							<li><a href = "one.jsp" >원산지</a></li>
							<li><a href = "oh.jsp" >오시는길</a></li>
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
		<h2>매장소개<span>Store</span></h2>
		<div class="lm">
			<ul class="list">
				<li class="first"><a href="in.jsp"><span>인삿말</span></a></li>
				<li><a href="chf.jsp"><span>셰프 소개</span></a></li>		
				<li><a href="one.jsp"><span>원산지</span></a></li>
				<li class="last"><a href="oh.jsp"><span>오시는길</span></a></li>
			</ul>
		</div>
	</div>	
	<!-- leftMenu end -->
	
	<!-- mainList-->
	<div class="menuMenu">
		<!-- 메뉴이동경로 표시 -->
		<div class="menuintro">
			<h3>오시는길</h3>
			<ul class="road">
				<li class="home"><span>Home</span></li>
				<li><span>매장소개</span></li>
				<li class="current"><span>오시는길</span></li>
			</ul>
		</div>
		<!-- 메뉴이동경로 표시 - end -->
		
		<!-- 메뉴판 -->
		<div class="contents">
				
<div class="pclist">
<div class="jido" id="jido1" style="width:600px; height:300px">
          
              
        </div>
     <div class="jido"> 
       <br>
            오시는 길 : 1호선 9번출구 앞 <br>
         주소 : 서울특별시 종로구 돈화문로 26 단성사 3층<br>
     연락처 : (02) 3672-9100 (내선 3번) <br>
			</div>
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