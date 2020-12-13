<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String id=request.getParameter("id");
 	Calendar cal=Calendar.getInstance();
 	int year=cal.get(Calendar.YEAR);
 	int month = cal.get(Calendar.MONTH) + 1;
 	int day=cal.get(Calendar.DAY_OF_MONTH);
 	int day_of_month;
 	String[] weekDay = { "일", "월", "화", "수", "목", "금", "토" }; 
 	int num = cal.get(Calendar.DAY_OF_WEEK)-1; 
    String today = weekDay[num]; 
 	String str=year+"-"+month+"-"+day;
 	switch(month){
 	case 2:
 		day_of_month=28;
 		break;
 	case 1:
 	case 3:
 	case 5:
 	case 7:
 	case 8:
 	case 10:
 	case 12:
 		day_of_month=31;
 		break;
 	default:
 		day_of_month=30;
 	}
 %>
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
	<form action="check.jsp?id=<%=id %>" method="post">
	<div class="container">
		<div class="reserve_date">
			<label class="today">오늘</label>
			<label class="date_btn"><input type="radio" name="date" value="<%=str %>" checked="checked" /><span><%=day %><small>&nbsp;<%=today %></small></span></label>
		<%
			for(int i=0;i<12;i++){
			day++;
			if(day==(day_of_month+1)){
				month++;
				month%=12;
				}
			if(day<10)
				str=year+"-"+month+"-0"+day;
			else
				str=year+"-"+month+"-"+day;
		%>
			<label class="date_btn"><input type="radio" name="date" value="<%=str%>"><span><%=day %><small>&nbsp;<%=weekDay[((++num)%7)] %></small></span></label>
		<%
			}
		%>
		</div>
		<div class="select">
			<div class="title th">극장</div>
			<div class="theater">
				<label class="theater_btn"><input type="radio" name="theater" value="강남" checked="checked"/><span>강남</span></label>
				<label class="theater_btn"><input type="radio" name="theater" value="강남대로"><span>강남대로</span></label>
				<label class="theater_btn"><input type="radio" name="theater" value="강동"><span>강동</span></label>
				<label class="theater_btn"><input type="radio" name="theater" value="군자"><span>군자</span></label>
				<label class="theater_btn"><input type="radio" name="theater" value="동대문"><span>동대문</span></label>
				<label class="theater_btn"><input type="radio" name="theater" value="마곡"><span>마곡</span></label>
				<label class="theater_btn"><input type="radio" name="theater" value="목동"><span>목동</span></label>
				<label class="theater_btn"><input type="radio" name="theater" value="상봉"><span>상봉</span></label>
				<label class="theater_btn"><input type="radio" name="theater" value="상암월드컵경기장"><span>상암월드컵경기장</span></label>
				<label class="theater_btn"><input type="radio" name="theater" value="성수"><span>성수</span></label>
				<label class="theater_btn"><input type="radio" name="theater" value="센트럴"><span>센트럴</span></label>
				<label class="theater_btn"><input type="radio" name="theater" value="송파파크하비오"><span>송파파크하비오</span></label>
				<label class="theater_btn"><input type="radio" name="theater" value="신촌"><span>신촌</span></label>
				<label class="theater_btn"><input type="radio" name="theater" value="은평"><span>은평</span></label>
				<label class="theater_btn"><input type="radio" name="theater" value="이수"><span>이수</span></label>
				<label class="theater_btn"><input type="radio" name="theater" value="창동"><span>창동</span></label>
				<label class="theater_btn"><input type="radio" name="theater" value="코엑스"><span>코엑스</span></label>
				<label class="theater_btn"><input type="radio" name="theater" value="홍대"><span>홍대</span></label>
				<label class="theater_btn"><input type="radio" name="theater" value="화곡"><span>화곡</span></label>
			</div>
			<div class="title ti">시간</div>
			<div class="time">
				<label class="time_btn"><input type="radio" name="time" value="09:00,11:40" checked="checked"/><span><big><b>09:00</b></big>&nbsp;-&nbsp;11:40</span></label>
				<label class="time_btn"><input type="radio" name="time" value="11:40,14:20"><span><big><b>11:40</b></big>&nbsp;-&nbsp;14:20</span></label>
				<label class="time_btn"><input type="radio" name="time" value="12:05,14:45"><span><big><b>12:05</b></big>&nbsp;-&nbsp;14:45</span></label>
				<label class="time_btn"><input type="radio" name="time" value="14:20,17:00"><span><big><b>14:20</b></big>&nbsp;-&nbsp;17:00</span></label>
				<label class="time_btn"><input type="radio" name="time" value="14:45,17:25"><span><big><b>14:45</b></big>&nbsp;-&nbsp;17:25</span></label>
				<label class="time_btn"><input type="radio" name="time" value="15:10,17:50"><span><big><b>15:10</b></big>&nbsp;-&nbsp;17:50</span></label>
				<label class="time_btn"><input type="radio" name="time" value="17:25,20:05"><span><big><b>17:25</b></big>&nbsp;-&nbsp;20:05</span></label>
				<label class="time_btn"><input type="radio" name="time" value="17:50,20:30"><span><big><b>17:50</b></big>&nbsp;-&nbsp;20:30</span></label>
				<label class="time_btn"><input type="radio" name="time" value="20:55,23:35"><span><big><b>20:55</b></big>&nbsp;-&nbsp;23:35</span></label>
				<label class="time_btn"><input type="radio" name="time" value="24:00,26:40"><span><big><b>24:00</b></big>&nbsp;-&nbsp;26:40</span></label>
			</div>
			<div class="reserve">
				<div class="seat">
					<div class="screen">screen<br>
						<img src="./img/door.png" class="door1">
						<img src="./img/door.png" class="door2">
					</div>
				<%
					String[] a={"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"};
				%>
				<div class="block">
				<%
					for(int i=0;i<a.length;i++){
				%>
						<label class="seat_tit"><span><%=a[i]%></span></label>
				<%	
					}
				%>
				</div>
				<div class="block0">
				<%
					for(int i=0;i<9;i++){
						for(int j=1;j<4;j++){	
								if(i<3&&(j==1||j==2||j==7||j==8)){
				%>
									<label class="seat_btn"><input type="checkbox" name="seat" value="<%=a[i]+j%>" disabled="true"><span>X</span></label>
				<%
								}else{							
				%>
									<label class="seat_btn"><input type="checkbox" name="seat" value="<%=a[i]+j%>"><span><%=a[i]+j%></span></label>
				<%
								}					
						}
				%>
				<br>
				<%
					}
				%>
				</div>
				<div class="block1">
				<%
					for(int i=0;i<a.length;i++){
						for(int j=4;j<10;j++){	
								if(i<3&&(j==1||j==2)){
				%>
									<label class="seat_btn"><input type="checkbox" name="seat" value="<%=a[i]+j%>" disabled="true"><span>X</span></label>
				<%
								}else{							
				%>
									<label class="seat_btn"><input type="checkbox" name="seat" value="<%=a[i]+j%>"><span><%=a[i]+j%></span></label>
				<%
								}					
						}
				%>
				<br>
				<%
					}
				%>
				</div>
				<div class="block2">
				<%
					for(int i=0;i<9;i++){
						for(int j=10;j<13;j++){	
								if(i<3&&(j==7||j==8)){
				%>
									<label class="seat_btn"><input type="checkbox" name="seat" value="<%=a[i]+j%>" disabled="true"><span>X</span></label>
				<%
								}else{							
				%>
									<label class="seat_btn"><input type="checkbox" name="seat" value="<%=a[i]+j%>"><span><%=a[i]+j%></span></label>
				<%
								}					
						}
				%>
				<br>
				<%
					}
				%>
				</div>
				</div>
				<div class="btn_area">
					<input type="reset" value="초기화" class="btn">
					<input type="submit" value="예 매" class="btn">
				</div>
			</div>
		</div>
	</div>
	</form>
</body>
</html>