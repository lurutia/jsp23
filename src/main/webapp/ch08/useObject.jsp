<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ch08.member.*" %>
<jsp:useBean id="member" scope="request" class="ch08.member.MemberInfo"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사말</title>
</head>
<body>
<%= member.getName() %> (<%= member.getId() %>) 회원님
안녕하세요.
</body>
</html>