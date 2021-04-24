<%@page import="java.io.IOException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>절대 경로를 사용해서 자원 읽기</title>
</head>
<body>
<%
	char[] buff = new char[128];
	int len = -1;
	
	String filePath = "C:/development/jsp_web_programming/project/src/main/webapp/ch05/message/notice.txt";
	try(InputStreamReader fr = new InputStreamReader(new FileInputStream(filePath), "UTF-8")) {
		while((len = fr.read(buff)) != -1) {
			out.println(new String(buff, 0, len));
		}
	} catch(IOException ex) {
		out.println("Exception : " + ex.getMessage());
	}
%>
</body>
</html>