<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("memberId");
	if(id != null && id.equals("gosuljo")) {
		String encodedValue = URLEncoder.encode("자바");
		response.sendRedirect("/ch03/index.jsp?name=" + encodedValue);
	} else {
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인에 실패</title>
</head>
<body>
잘못된 아이디입니다.
</body>
</html>
<%
	}
%>