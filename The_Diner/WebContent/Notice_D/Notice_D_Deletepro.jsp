<%@page import="meminfoVO.MemInfoVo"%>
<%@page import="meminfoDAO.Notice_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!--데이터를 한번에 받아오는 빈클래스를 사용하도록  -->
	<jsp:useBean id = "Notice_VO" class= "meminfoVO.Notice_VO">
		<jsp:setProperty name="Notice_VO" property = "*" />
	</jsp:useBean>
	
	<%
			//데이터 베이스 연결 
				Notice_DAO ndao = new Notice_DAO();
				
				MemInfoVo vo = new MemInfoVo();
				
				String id = (String) session.getAttribute("mname");
				int num = Integer.parseInt(request.getParameter("num").trim());
				String password = request.getParameter("password");
				
				//해당 게시글의 패스워드 값을 얻어옴
				String pass = ndao.getPass(id);
				
				//기존 패스워드 값과 delete form에서 작성한 패스워드를 비교 
				if(pass.equals(password)){	//패스워드가 둘다 같다면 
				//데이터 삭제하는 메소드 호출
				ndao.deleteBoard(num);
			
				response.sendRedirect("Notice_D_Listform.jsp");
			
				}else{
		%>
	<script>
		alert("패스워드가 일치하지 않습니다. 다시 확인후 삭제해 주세요.");
		history.go(-1);
	</script>	
	<% 
	}
	%>
</body>
</html>