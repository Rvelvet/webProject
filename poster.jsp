<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String img = request.getParameter("img"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포스터</title>
<link rel="stylesheet" type="text/css" href="css/dgubox-style.css" />
</head>
<body style="margin: 0px; background: black; height: 100%;">
	<img src=<%= img %> class="big_poster">
</body>
</html>