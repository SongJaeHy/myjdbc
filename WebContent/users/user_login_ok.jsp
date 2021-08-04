<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
  	// 0. post방식 받아오기 처리
  	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");  	

  	// 1. 아이디 비밀번호 받아오기
 	String id = request.getParameter("uid");
  	String pw = request.getParameter("upw");
  	
  	Connection con = null;
  	PreparedStatement pstmt = null;
  	ResultSet rs = null;
  // if~else문으로 try~catch~finally를 감싸서
  // 세션이 존재할 때는 DB에서 데이터를 가져오는 로직을 생략해주세요.
  String idSession = (String)session.getAttribute("i_s");
  
 	
	
  	if(idSession != null){
		id = idSession;
  	}else{
  	
  	// DB연결로직을 집어넣어주세요.
  	try{
  		Class.forName("com.mysql.cj.jdbc.Driver");
  		
  		String url="jdbc:mysql://localhost/ict03";
  		
  		con = DriverManager.getConnection(url,"root","mysql");
  		
  		// 1. SELECT 쿼리문을 작성합니다.
  		// 입력받은 id가 실제로 DB에 존재하는지 조회하는 쿼리문을 작성해주세요.
  		String sql = "SELECT * FROM users WHERE uid=?";
  		
  		// 2 쿼리문의 ?자리에 적용할 변수를 집어넣습니다.
  		pstmt = con.prepareStatement(sql);
  		pstmt.setString(1, id);
  		
  		rs = pstmt.executeQuery();
  		
  		// rs.next()를 통해 데이터가 들어 왔는지 안 들어왔는지 확인
  		if(rs.next()){
  		
  		// 들어왔다면 DB쪽 데이터 받기
  		String dbId = rs.getString("uid");
  		String dbPw = rs.getString("upw");
  		
  		
  		// 폼에서 보낸 데이터와 DB쪽 데이터간 아이디 비밀번호 일치여부 비교해서
  		// 아이디와 비밀번호 모두 일치시 셋션 발급 및 body태그에 id 출력
  		if(id.equals(dbId) && pw.equals(dbPw)){
  			session.setAttribute("i_s", id);
  			session.setAttribute("p_s", pw);
  			
  		}else{
  			response.sendRedirect("user_login_fail.jsp");
  		}
  		// 비밀번호가 틀린 경우 역시 user_login_fail.jsp로 보내줌
  		
  		}else{
  			response.sendRedirect("user_login_fail.jsp");
  		}
  	// 얻어온 DB내 정보를 콘솔에 찍기
  		
  		
  	
  		
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
  			if(rs != null && !rs.isClosed()){
  				rs.close();
  			}
  		}
  		catch (SQLException e){
 		e.printStackTrace();
 	}
  }
 }
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%=id %>님 환영합니다.</h2>
	<h1>로그인이 완료되었습니다.</h1>
	<a href="user_logout.jsp">로그아웃하기</a><br/>
	<a href="user_delete_form.jsp">회원탈퇴하기</a>
</body>
</html>