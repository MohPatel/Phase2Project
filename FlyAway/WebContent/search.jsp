<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="flightdetails.jsp" method="post" >
Date Of Travel: <input type="date" name="dot" required> <br> <br>
Source City:  <select name="sourceCity">
    <option value="Winnipeg">Winnipeg</option>
    <option value="Torronto">Torronto</option>
    <option value="Calgary">Calgary</option>
    <option value="Vancour">Vancour</option>
  </select> <br> <br>
Destination City:  <select name="destinationCity">
    <option value="Winnipeg">Winnipeg</option>
    <option value="Torronto">Torronto</option>
    <option value="Calgary">Calgary</option>
    <option value="Vancour">Vancour</option>
    <option value="Hamilton">Hamilton</option>
    <option value="Nova Scotia">Nova Scotia</option>
    <option value="Niagara Falls">Niagara Falls</option>
    <option value="New york">New york</option>
    <option value="Hallifax">Hallifax</option>
</select> <br> <br>
Number of Persons travelling: <input type="number" name="noperson" min="1" max="10" required>  <br> <br>

<input type="submit" value="Search" >
</form>

</body>
</html>