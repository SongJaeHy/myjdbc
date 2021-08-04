<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
	// 세션쪽 아이디, 비밀번호, 그리고 사용자가 폼으로 보낸 비밀번호 얻기
	String spw = (String)session.getAttribute("p_s");
	String dpw =  request.getParameter("dpw");
	
	String sessionId = (String)session.getAttribute("i_s");
	
	System.out.println(sessionId);
	System.out.println(spw);
	System.out.println(dpw);
	Connection con = null;
	PreparedStatement pstmt = null;
	
	if(spw.equals(dpw)){
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost/ict03";
			
			con = DriverManager.getConnection(url,"root","mysql");
			
			String sql = "DELETE FROM users WHERE uid=?";
			
			// 2. 쿼리문의 ?자리에 적용할 변수를 집어넣습니다.
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sessionId);
			
			// 3. 쿼리문 실행
			pstmt.executeUpdate();
			
			// 세션 파기는 두 번 실행할 수 없으므로
			// 로직당 한 번만 실행되도록 배치한다.
			session.invalidate();
			
		}catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		}catch(SQLException e){
			System.out.println("에러 : " + e);
		}finally{
			try{
				if(con!=null && !con.isClosed()){
					con.close();
				}
				if(pstmt != null && !pstmt.isClosed()){
					pstmt.close();
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	} else {
		session.invalidate();
		// redirect 실행이 안 될 경우 편법적으로 활용할 수 있는 코드
		response.sendRedirect("user_login_form.jsp");
	}
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=sessionId %>계정 삭제가 완료되었습니다.</h1>
	<a href="user_login_form.jsp">삭제 확인 및 돌아가기</a>
</body>
</html>