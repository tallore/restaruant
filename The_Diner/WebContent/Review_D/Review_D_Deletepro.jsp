<%@page import="meminfoVO.Review_VO"%>
<%@page import="meminfoVO.MemInfoVo"%>
<%@page import="meminfoDAO.Review_DAO"%>
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
	<jsp:useBean id = "Review_VO" class= "meminfoVO.Review_VO">
		<jsp:setProperty name="Review_VO" property = "*" />
	</jsp:useBean>
	
	<% 
		//데이터 베이스 연결 
		Review_DAO rdao = new Review_DAO();
	
		MemInfoVo vo = new MemInfoVo();
	
		String id = (String) session.getAttribute("mname");
		int num = Integer.parseInt(request.getParameter("num").trim());
		String password = request.getParameter("password");
	
		String pass = rdao.getPass(id);
		
		//기존 패스워드 값과 delete form에서 작성한 패스워드를 비교 
		if(pass.equals(password)){
			
			//패스워드가 둘다 같다면 
			rdao.deleteBoard(num);
			
			response.sendRedirect("Review_D_Listform.jsp");
	
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