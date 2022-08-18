<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<%@ page import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% if (request.getParameter("flightID") != null && !session.isNew()){
	try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_flyaway","root","root");     
    Statement st=con.createStatement();
    String strQuery = "SELECT *from flight_details where flight_no= '" + request.getParameter("flightID") +  "'";
    ResultSet rs = st.executeQuery(strQuery);
    if(rs.next()){
    	session.setAttribute("airlineName", rs.getString("airlineName"));
    	session.setAttribute("price", rs.getString("price"));
    	session.setAttribute("flight_no", rs.getString("flight_no"));
    	session.setAttribute("source_city", rs.getString("source_city"));
    	session.setAttribute("destination_city", rs.getString("destination_city"));
    	session.setAttribute("dept_time", rs.getString("dept_time"));
    	session.setAttribute("arrival_time", rs.getString("arrival_time"));
    	session.setAttribute("className", rs.getString("className"));
    	session.setAttribute("seat_avail", rs.getString("seat_avail"));
    	session.setAttribute("date_of_travel", rs.getString("date_of_travel"));
    	
    }}catch(Exception e){
		e.printStackTrace();
	}}%>

<form action="reviewdetails.jsp" method="Post">
Full Name: <input type="text" name="fName" required><br><br>
Address: <input type="text" name="address" required><br><br>
Age: <input type="text" name="age" required><br><br>
Mobile: <input type="text" name="mobile" maxlength="10" required><br><br>
Email ID : <input type="email" name="email" required><br><br>
<select name="uNumber" required>
    <option value="PassportNo">PassportNo</option>
    <option value="DrivingLicense">DrivingLicense</option>
</select>
<input type="text" name="uNo" placeholder="Enter Number"> required<br><br>
Country: <input type="text">
<input type="submit" value="Review"/> 
</form>
</body>
</html>