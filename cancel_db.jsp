<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>
<%
	String time=request.getParameter("time");
	Connection conn=null;
	Statement stmt=null;
	String sql=null;
	ResultSet rs=null;
	out.println(time);
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/wproject?serverTimezone=UTC";
		conn=DriverManager.getConnection(url,"root","0000");
		stmt=conn.createStatement();
		sql="delete from Reservation where time='"+time+"'";
		stmt.executeUpdate(sql);
	}catch(Exception e){
		out.println("페이지 오류입니다. :"+e.getMessage());
	}
	response.sendRedirect("cancel.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>