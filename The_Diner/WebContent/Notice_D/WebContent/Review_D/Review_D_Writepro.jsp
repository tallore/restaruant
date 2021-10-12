<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="meminfoVO.Review_VO"%>
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
	
	<% request.setCharacterEncoding("UTF-8"); //한글처리
	
		//Insert
		Review_DAO rdao = new Review_DAO();
		Review_VO vo = new Review_VO();
		
		String id = (String) session.getAttribute("mname");
		String title = request.getParameter("title");
		String title1 = new String(title.getBytes("ISO-8859-1"), "UTF-8");
		String content = request.getParameter("content");
		String content1 = new String(content.getBytes("ISO-8859-1"), "UTF-8");
		int star = Integer.parseInt(request.getParameter("star"));
		
		boolean a = true;
		
		if(a) {
		vo.setId(id);
		vo.setTitle(title1);
		vo.setContent2(content1);
		vo.setStar(star);
			
		rdao.lnsert_Review_D(vo);
	
		response.sendRedirect("Review_D_Listform.jsp");
		
		}
	%>
</body>
</html>