<%@page import="java.net.URL"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 기본 객체 사용하여 자원 읽기2</title>
</head>
<body>

<%
	String resourcePath = "/ch05/message/notice.txt";
%>

자원의 실제 경로:<%= application.getRealPath(resourcePath) %>
<br>
--------<br>
<%= resourcePath %> 의 내용<br>
--------<br>
<%
	char[] buff = new char[128];
	int len = -1;
	URL url = application.getResource(resourcePath);
	try(InputStreamReader fr = new InputStreamReader(url.openStream(), "UTF-8")) {
		while((len = fr.read(buff)) != -1) {
			out.println(new String(buff, 0, len));
		}
	} catch(IOException ex) {
		out.println("Exception : " + ex.getMessage());
	}
%>
</body>
</html>