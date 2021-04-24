<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="member" scope="request" class="ch08.member.MemberInfo"></jsp:useBean>
<%
	member.setId("gosuljo");
	member.setName("고설조");
%>
<jsp:forward page="/ch08/useObject.jsp"/>