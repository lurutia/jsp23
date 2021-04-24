<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터 출력</title>
</head>
<body>
name parameter value:
<% try { %> 
<%= request.getParameter("name").toUpperCase() %>
<% } catch(Exception e) { %>
	name 파라미터가 올바르지 않습니다.
<%
}
%>

</body>
</html>