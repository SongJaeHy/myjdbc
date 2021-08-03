<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
  	// 0. post방식 받아오기 처리
  	response.setCharacterEncoding("utf-8");
  
  	// 1. 아이디 비밀번호 받아오기
  	String id = request.getParameter("id");
  	String pw = request.getParameter("pw");
 %>
 
 <%
 	if(id.equals("id") && pw.equals("1234")){
 		session.setAttribute("u_id", id);
  		session.setAttribute("u_pw", pw);
 	}else{
 		response.sendRedirect("login_fail.jsp");
 	}
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>