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
<h3>Thank you for booking with us.</h3>
<h5>Please bring photo ID for identification.</h5>
<jsp:useBean id="registerfields" class="advanced.java.program.RegisterFields" scope="session"></jsp:useBean>
Name: <jsp:getProperty property="fullName" name="registerfields"/> <br><br>
Address: <jsp:getProperty property="address" name="registerfields"/> <br><br>
Age: <jsp:getProperty property="age" name="registerfields"/> <br><br>
Mobile: <jsp:getProperty property="mobile" name="registerfields"/> <br><br>
EmailID: <jsp:getProperty property="emailid" name="registerfields"/> <br><br>
ID Type: <jsp:getProperty property="docType" name="registerfields"/> <br><br>
ID Number: <jsp:getProperty property="docno" name="registerfields"/> <br><br>

<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/db_flyaway"  
     user="root"  password="root"/>  
     
     <% String userName = session.getAttribute("userName").toString();
        String flightno = session.getAttribute("flight_no").toString();
        pageContext.setAttribute("userName", userName,PageContext.PAGE_SCOPE);
        pageContext.setAttribute("flightno", flightno,PageContext.PAGE_SCOPE);
       
     %>
<sql:update dataSource="${db}">  
  Insert into booking(userName,flight_no) values(?,?)
<sql:param value="${userName}" />  
<sql:param value="${flightno}" />  
</sql:update> 
</body>
</html>