<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/db_flyaway"  
     user="root"  password="root"/>  
 <% 
         String pwd=request.getParameter("newpwd");
         String userName = request.getParameter("userName");
         pageContext.setAttribute("pwd", pwd,PageContext.PAGE_SCOPE);
         pageContext.setAttribute("userName", userName,PageContext.PAGE_SCOPE);
 
 %>   
    
	<sql:update dataSource="${db}" var="count">  
		Update admin_login set password=? where userName=?
	 <sql:param value="${pwd}" />  
	 <sql:param value="${userName}" />  
</sql:update> 
<% response.sendRedirect("login.jsp"); %>															
</body>
</html>