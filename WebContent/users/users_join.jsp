<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	Connection con = null;
 
 	try{
 		Class.forName("com.mysql.cj.jdbc.Driver");
 		
 		String url = "jdbc:mysql://localhost/employees";
 		
 		con = DriverManager.getConnection(url, "root", "mysql");
 	}catch(ClassNotFoundException e){
 		System.out.println("드라이버 로딩 실패");
 	}catch(SQLException e){
 		System.out.println("에러 : " + e);
 	}finally{
 		try{
 			if(con!=null && !con.isClosed()){
 				con.close();
 			}
 		}catch(SQLException e){
 			e.printStackTrace();
 		}
 	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
</head>
<body>

</body>
</html>