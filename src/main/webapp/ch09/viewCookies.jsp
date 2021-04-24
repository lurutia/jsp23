<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 목록</title>
</head>
<body>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length > 0) {
		for(int i=0; i<cookies.length; i++) {
			out.println(cookies[i].getName() + " = ");
			out.println(URLDecoder.decode(cookies[i].getValue(), "utf-8"));
			out.println("<br>");
		}
	} else {
		out.println("쿠키가 존재하지 않습니다.");
	}
%>
</body>
</html>