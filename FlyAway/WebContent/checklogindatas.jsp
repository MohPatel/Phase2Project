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
<%
	String userName = request.getParameter("email");
	String password = request.getParameter("pwd");
	String strQuery;
	
	/* System.out.println("UserName: " + userName);
	System.out.println("passoword: " + password); */
	try{
	/* creating database conncetion and retrieving data  */
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_flyaway","root","root");     
    Statement st=con.createStatement();
    if(userName.equals("admin@gmail.com")){
    	strQuery= "SELECT * from admin_login where userName= '" + userName + "' AND password ='" + password + "'";
    }else {
    	strQuery= "SELECT * from user_login where userName= '" + userName + "' AND password ='" + password + "'";
    }
    ResultSet rs = st.executeQuery(strQuery);
	
    
    if(rs.next()){
    	System.out.println("Data successfully parsed");
    	session.setAttribute("userName", userName);
    	session.setAttribute("password", password);
    	if(userName.equals("admin@gmail.com")){
    		response.sendRedirect("adminpage.jsp");
    	}
    	else{
    	response.sendRedirect("search.jsp");}
    }
    else{
    	System.out.println("Data successfully parsed");
    	response.sendRedirect("login.jsp?error=1");
    }
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>


</body>
</html>