<%@ page language="java" contentType="text/html; charset=iso-8859-1" %>
<%@ page import="java.util.Date" %>
<%
	Date now = new Date();
%>
<!DOCTYPE html>
<html>
<head>
<title>현재시간</title>
</head>
<body>
현재시각:
<%= now %>
</body>
</html>