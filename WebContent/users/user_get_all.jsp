<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// DB에서 전체 회원 데이터를 들고 나옵니다.
	// 1. getAllUser()메서드를 dao를 이용해 호출합니다.
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>전체 회원 목록</h1>

	<table border="1">
		<thead>
			<tr>
				<th>회원 아이디</th>
				<th>회원 이름</th>
				<th>회원 이메일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>더미아이디</td>
				<td>더미이름</td>
				<td>더미이메일</td>
			</tr>
		</tbody>
	</table>
	
</body>
</html>