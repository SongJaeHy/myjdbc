<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 창</h1>
	<form action="user_login_ok.jsp" method="post">
	<input type="text" name="id" placeholder="ID"/><br/>
	<input type="password" name="pw" placeholder="PW"/><br/>
	<input type="submit" value="로그인"><br/>
	
	
	</form>
	<a href="users_join_form.jsp">회원가입 하러가기</a>
</body>
</html>