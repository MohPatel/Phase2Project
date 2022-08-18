<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
if (request.getParameter("error") != null)
    out.println("<b>Please enter right userName and Password.</b><br>");
%>

<br> <br>
<form action="checklogindatas.jsp" method="post">
  Email <input type="email" name="email" maxlength="80" required><br> <br>
  Password <input type="password" name="pwd" maxlength="10" required><br> <br>
  <button>Submit</button>
  
</form>
</body>
</html>