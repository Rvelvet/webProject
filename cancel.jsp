<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>
<%
	
	String title, theater, date, time, id;
	int no=1;
	Connection conn=null;
	Statement stmt=null;
	String sql=null;
	ResultSet rs=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/wproject?serverTimezone=UTC";
		conn=DriverManager.getConnection(url,"root","0000");
		stmt=conn.createStatement();
		sql="select movie.id, title, theater, date, start, time from movie, reservation where movie.id=reservation.id";
		rs=stmt.executeQuery(sql);
	}catch(Exception e){
		out.println("페이지 오류입니다. :"+e.getMessage());
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예매 내역 조회 및 취소</title>
<link rel="stylesheet" type="text/css" href="css/dgubox-style.css" />
</head>
<body>
	<header id="header">
		<div class="logo">
			<a href="main_db.jsp" title="메인으로 가기">
				<img src="./img/logo.png" alt="DGUBOX">
			</a>
		</div>
		<div class="check_cancel">
			<a href="cancel.jsp" title="예매 내역 조회/취소">
				<img src="./img/check_cancel.png" alt="조회/취소">
			</a>
		</div>
	</header>
	<div class="table">
		<center>
		<table align="center">
		<tr>
			<td align="center" class="table_tit" width="50">NO</td>
			<td align="center" class="table_tit" width="340">영화명</td>
			<td align="center" class="table_tit" width="140">영화관</td>
			<td align="center" class="table_tit" width="170">상영일시</td>
			<td align="center" class="table_tit" width="170">예매일시</td>
			<td align="center" class="table_tit" width="130">예매취소</td>
		</tr>
		<%
			while(rs.next()){
				id=rs.getString("id");
				title=rs.getString("title");
				theater=rs.getString("theater");
				date=rs.getString("date")+"<br>"+rs.getString("start");
				time=rs.getString("time");
				id=rs.getString("id");
				
		%>
				<tr>
			<td align="center" class="reserved_list" width="50"><%=no %></td>
			<td align="center" class="reserved_list" width="340"><%=title %></td>
			<td align="center" class="reserved_list" width="140"><%=theater %></td>
			<td align="center" class="reserved_list" width="170"><%=date %></td>
			<td align="center" class="reserved_list" width="170"><%=time %></td>
			<td align="center" class="reserved_list" width="130"><a href="cancel_db.jsp?time=<%=time%>" class="btn">취소</a></td>
		</tr>
		<%
		no++;
			}
		%>
		</table>
	</div>
</body>
</html>