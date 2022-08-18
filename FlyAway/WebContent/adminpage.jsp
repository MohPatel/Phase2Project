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

<form action="changePassword.jsp" method="post">
UserName: <input type="text" name="userName" value="<%= session.getAttribute("userName")%>"/> <br> <br>
Old Password: <input type="password" name="pwd" value="<%= session.getAttribute("password")%>"/> <br> <br>
New Password: <input type="password" name="newpwd" required/> <br> <br>
<input type="submit" value="Change Password"> <br> <br>
</form>
<h5>All booking details</h5>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/db_flyaway"  
     user="root"  password="root"/>  
     
<sql:query dataSource="${db}" var="rs">  
	SELECT * from flight_details;  
</sql:query>
<table border="2" width="100%">  
<tr>  
<th>Source</th>  
<th>Destination</th> 
<th>Airline</th> 
<th>Price</th> 
</tr>
<c:forEach var="table" items="${rs.rows}">  
		<tr>  
			<td><c:out value="${table.source_city}"/></td>  
			<td><c:out value="${table.destination_city}"/></td>   
			<td><c:out value="${table.airlineName}"/></td>   
			<td><c:out value="${table.price}"/></td>   
		</tr>  
	</c:forEach>
</body>
</html>