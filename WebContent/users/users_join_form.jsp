<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입 창입니다.</h1>
	<form action="users_join.jsp" method="post">
		<input type="text" name="uid" placeholder="ID"/><br/>
		<input type="password" name="upw"placeholder="PW"/><br/>
		<input type="text" name="uname"placeholder="Name"/><br/>
		<input type="email" name="email"placeholder="EMAIL"/><br/>
		<input type="submit" value="가입하기"/><br/>
	
	</form>
</body>
</html>