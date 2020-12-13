<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 예매</title>
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
	<div class="movie-list">
		<ol class="list" id="movieList">
		<%
		Connection conn=null;
		Statement stmt=null;
		String sql=null;
		ResultSet rs=null;
		int id;
		String title, opening_date,rate,src;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/wproject?serverTimezone=UTC";
			conn=DriverManager.getConnection(url,"root","0000");
			stmt=conn.createStatement();
			sql="select * from movie";
			rs=stmt.executeQuery(sql);
		}catch(Exception e){
			out.println("페이지 오류입니다. :"+e.getMessage());
		}
		while(rs.next()){
			id=Integer.parseInt(rs.getString("ID"));
			title=rs.getString("Title");
			opening_date=rs.getString("Opening_date");
			rate=rs.getString("rate");
			if(id<10)
				src="./img/poster0"+id+".jpg";
			else
				src="./img/poster"+id+".jpg";
		%>
			<li>
				<div class="movie-list-info">
					<p class="rank"><%=id %></p>
					<a href="Info_db.jsp?id=<%= id %>" title="상세보기">
						<img src="<%=src %>" alt="<%=title%>">
					</a>
				</div>
				<div class="titleArea">
					<span class="grade age-<%=rate%>"></span>
					<span title="<%=title %>" class="title"><%=title %></span>
				</div>
				<div class="date">
					<span>&nbsp;개봉일 <%=opening_date %></span>
				</div>
				<div class="reserve">
					<a href="reserve.jsp?id=<%=id %>" class="reservbtn" title="예매하기">예 매</a>
				</div>
			</li>
		<%
		}
		%>
		</ol>
	</div>
</body>
</html>