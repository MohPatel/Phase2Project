<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<%@ page import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:set var="dot"><%= request.getParameter("dot") %></c:set>
<c:set var="sourceCity"><%= request.getParameter("sourceCity") %></c:set>
<c:set var="destinationCity"><%= request.getParameter("destinationCity") %></c:set>
<c:set var="noperson"><%= request.getParameter("noperson") %></c:set>

<% String no_of_person= request.getParameter("seat_avail");
   pageContext.setAttribute("no_of_person",no_of_person,PageContext.SESSION_SCOPE);
%>

<%-- <c:out value="${dot}"></c:out> --%>
<!-- sql:setDataSource tag -->
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/db_flyaway"  
     user="root"  password="root"/>  
     
<!-- sql:query  tag --> 
<sql:query dataSource="${db}" var="rs" >  
	SELECT *from flight_details where (date_of_travel=? AND source_city=? AND destination_city=? AND seat_avail >= ? );  
	<sql:param value="${dot}"></sql:param>
	<sql:param value="${sourceCity}"></sql:param>
	<sql:param value="${destinationCity}"></sql:param>
	<sql:param value="${noperson}"></sql:param>
</sql:query>  
 
 <%-- <c:out value="${count}"></c:out> --%>
<%-- <c:if test="${Count <= 0}">
       <% response.sendRedirect("search.jsp"); %>
</c:if> --%>

 <c:forEach var="flightData" items="${rs.rows}">  

		AirFlight:	<c:out value="${flightData.airlineName}"/> <br> <br>
		Price:	<fmt:formatNumber type="currency"><c:out value="${flightData.price}"/></fmt:formatNumber><br> <br>
		Flight No:	<a href="registerdetails.jsp?flightID=${flightData.flight_no}" ><c:out value="${flightData.flight_no}"/> </a> <br> <br><%-- <a href="registerdetails.jsp/flightID=${flightData.flight_no}" ><c:out value="${flightData.flight_no}"/> </a> <br> <br> --%>
		Date of Travel:	<c:out value="${flightData.date_of_travel}"/> <br> <br>
		Source:	<c:out value="${flightData.source_city}"/> <br> <br>
		Destination:  <c:out value="${flightData.destination_city}"/> <br> <br>
		Departure Time:	<c:out value="${flightData.dept_time}"/> <br> <br>
		Arrival Time:	<c:out value="${flightData.arrival_time}"/>  <br> <br>
		Seats available:	<c:out value="${flightData.seat_avail}"/> <br> <br>
		Class:	<c:out value="${flightData.className}"/> <br> <br>
		 
 </c:forEach>
 <a href="search.jsp">Back</a>
</body>
</html>