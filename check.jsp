<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
    <%@ page import="java.sql.*" %>
<% 	int id=Integer.parseInt(request.getParameter("id"));
	String img;
	if(id<10)
		img="./img/poster0"+id+".jpg";
	else
		img="./img/poster"+id+".jpg";
	String theater=request.getParameter("theater");
	String time=request.getParameter("time");
	String start=time.substring(0, 5), end=time.substring(6, 11);
	String[] seats=request.getParameterValues("seat");
	String seat=seats[0];
	int num=seats.length;
	for(int i=1;i<seats.length;i++){
		seat+=(", "+seats[i]);
	}
	String date=request.getParameter("date");
	
	
	Connection conn=null;
	Statement stmt=null;
	String sql=null;
	ResultSet rs=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/wproject?serverTimezone=UTC";
		conn=DriverManager.getConnection(url,"root","0000");
		stmt=conn.createStatement();
		sql="insert into Reservation values("+id+",'"+start+"','"+end+"','"+seat+"','"+theater+"','"+date+"',default)";
		stmt.executeUpdate(sql);
		stmt=conn.createStatement();
		sql="select title, time from movie, reservation where movie.id="+request.getParameter("id")+" and movie.id=reservation.id and seat='"+seat+"' and date='"+date+"' and theater='"+theater+"'";
		rs=stmt.executeQuery(sql);
	}catch(Exception e){
		out.println("페이지 오류입니다. :"+e.getMessage());
	}
	rs.next();
	String title=rs.getString("title");
	String timestamp=rs.getString("time");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 예매 확인</title>
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
	<div class="container">
		<div class="check">예매 확인</div>
		<div class="reserved">
			<div class="poster"><img src="<%= img %>"></div>
			<div class="info">
				<div class="tit">
					<div class="tit_list">영화 정보</div>
					<div class="tit_list">상영 일시</div>
					<div class="tit_list">상영 영화관</div>
					<div class="tit_list">관람 인원</div>
					<div class="tit_list">좌석 정보</div>
					<div class="tit_list">결제일</div>
				</div>
				<div class="content">
					<div class="content_list"><%=title %></div>
					<div class="content_list"><%=date %> <%=start %>~<%=end %></div>
					<div class="content_list"><%=theater %> 1관</div>
					<div class="content_list"><%=num %>명</div>
					<div class="content_list"><%=seat %></div>
					<div class="content_list"><%=timestamp %></div>
				</div>
			</div>
		</div>
		<div class="check_btn">
			<a href="main_db.jsp" class="btn">메인 페이지로</a>
			<a href="cancel.jsp" class="btn">예매 내역 조회</a>
		</div>
	</div>
</body>
</html>