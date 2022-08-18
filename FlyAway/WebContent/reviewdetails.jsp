<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3> Review all details and confirm it</h3>
<% 
System.out.println(session.getAttribute("userName"));
System.out.println(request.getAttribute("email"));
if(session.getAttribute("userName")!=null && request.getParameter("email")!= null){
	String fullName = request.getParameter("fName");
	String address = request.getParameter("address");
	String age = request.getParameter("age");
	String mobile = request.getParameter("mobile");
	String email = request.getParameter("email");
	String uNo = request.getParameter("uNo");
	String uNumber = request.getParameter("uNumber");
	pageContext.setAttribute("fullName", fullName, PageContext.PAGE_SCOPE);
	pageContext.setAttribute("address", address, PageContext.PAGE_SCOPE);
	pageContext.setAttribute("age", age, PageContext.PAGE_SCOPE);
	pageContext.setAttribute("mobile", mobile, PageContext.PAGE_SCOPE);
	pageContext.setAttribute("email", email, PageContext.PAGE_SCOPE);
	pageContext.setAttribute("uNo", uNo, PageContext.PAGE_SCOPE);
	pageContext.setAttribute("uNumber", fullName, PageContext.PAGE_SCOPE); %>

Flight Number: <%= session.getAttribute("flight_no")%> <br><br>
Airline: <%= session.getAttribute("airlineName")%> <br><br>
Ticket Price: <%= session.getAttribute("price")%> <br><br>
Source City: <%= session.getAttribute("source_city")%> <br><br>
Destination: <%= session.getAttribute("destination_city")%> <br><br>
Class: <%= session.getAttribute("className")%> <br><br> 
Date of Travel: <%= session.getAttribute("date_of_travel")%> <br><br>
<%} %>

 <jsp:useBean id="registerfields" class="advanced.java.program.RegisterFields" scope="session"></jsp:useBean>
<jsp:setProperty property="fullName" name="registerfields" value="${fullName}"/>
<jsp:setProperty property="address" name="registerfields" value="${address}"/>
<jsp:setProperty property="age" name="registerfields" value="${age}"/>
<jsp:setProperty property="mobile" name="registerfields" value="${mobile}"/>
<jsp:setProperty property="emailid" name="registerfields" value="${email}"/>
<jsp:setProperty property="docType" name="registerfields" value="${uNumber}"/>
<jsp:setProperty property="docno" name="registerfields" value="${uNo}"/>

<a href="confirmation.jsp">Payment</a>
</body>
</html>