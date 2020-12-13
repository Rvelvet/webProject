<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn=null;
	Statement stmt=null;
	String sql=null;
	ResultSet rs=null;
	int id = Integer.parseInt(request.getParameter("id"));;
	String name, dir, gen, exp, date, act, str="", temp, src, line;
	String txtPath1="/Info/ShortInfo_",txtPath2="/Info/Info_", info="",short_info="";
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/wproject?serverTimezone=UTC";
		conn=DriverManager.getConnection(url,"root","0000");
		stmt=conn.createStatement();
		sql="select title, director, genre, nation, running_time, rate, opening_date, actor from movie, movieinfo where movie.id="+id+" and movie.id=movieinfo.id";
		rs=stmt.executeQuery(sql);
	}catch(Exception e){
		out.println("페이지 오류입니다. :"+e.getMessage());
	}
	rs.next();
	if(id<10){
		src="./img/poster0"+id+".jpg";
		txtPath1+=("0"+id+".txt");
		txtPath2+=("0"+id+".txt");
		}
	else{
		src="./img/poster"+id+".jpg";
		txtPath1+=(id+".txt");
		txtPath2+=(id+".txt");
		}
	txtPath1=getServletConfig().getServletContext().getRealPath(txtPath1);
	txtPath2=getServletConfig().getServletContext().getRealPath(txtPath2);
	name=rs.getString("title"); 
	if(id == 22) name = "<small><small>"+name+"</small></small>";
	dir=rs.getString("director");
	gen=rs.getString("genre");
	exp="한국 / 128분 / 15세이상관람가";
	exp=rs.getString("nation")+" / "+rs.getString("running_time")+" / ";
	temp=rs.getString("rate");
	if(temp.equals("All"))
		exp+="전체이용관람가";
	else
		exp+=(temp+"세이용관람가");
	date=rs.getString("opening_date");
	act=rs.getString("actor");
	FileInputStream input=new FileInputStream(txtPath1);
	InputStreamReader reader=new InputStreamReader(input,"UTF-8");
	BufferedReader br= new BufferedReader(reader);
	
	
	short_info+="<b><big>";
	while((line=br.readLine())!=null){
		short_info+=(line+"<br>");
	}
	short_info+="</big></b><br><br>";
	FileInputStream input2=new FileInputStream(txtPath2);
	InputStreamReader reader2=new InputStreamReader(input2,"UTF-8");
	BufferedReader br2= new BufferedReader(reader2);
	while((line=br2.readLine())!=null){
		info+=(line+"<br>");
	}
	info+="<br><br>";
	str+=(short_info+info);
	br.close();br2.close();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 정보 조회</title>
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
		<div class="info">
			<div class="main_info">
				<div class="name">
					<%= name %>
				</div>
				<a href="reserve.jsp?id=<%=request.getParameter("id") %>" class="btn" title="예매하기">예 매</a>
				<div class="detail">
					<b>감독</b>&emsp;&emsp;&emsp;| <%= dir %><br>
					<b>장르</b>&emsp;&emsp;&emsp;| <%= gen %><br>
					<b>기본</b>&emsp;&emsp;&emsp;| <%= exp %><br>
					<b>개봉일</b>&emsp;&emsp;| <%= date %><br>
					<b>출연진</b>&emsp;&emsp;| <%= act %>
				</div>
			</div>
			<div class="poster">
				<a href="poster.jsp?img=<%= src %>" title="새 창으로 원본 보기" target="_balnk">
					<img src="<%= src %>">
				</a>
			</div>
		</div>
		<div class="story">
			<%= str %>
		</div>
	</div>
</body>
</html>
