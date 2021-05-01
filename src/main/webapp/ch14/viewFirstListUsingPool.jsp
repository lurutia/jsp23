<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>First List 목록</title>
</head>
<body>
First List
<table>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		String jdbcDriver = "jdbc:apache:commons:dbcp:ch14";
		/* String dbUser = "root"; */
		/* String dbPass = "12345"; */
		
		String query = "SELECT * FROM actor";
		conn = DriverManager.getConnection(jdbcDriver);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		
		while(rs.next()) {
%>
			<tr>
				<td><%= rs.getString("first_name") %></td>
			</tr>
<%
		}
	} catch(Exception e) {
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
%>
</table>
</body>
</html>