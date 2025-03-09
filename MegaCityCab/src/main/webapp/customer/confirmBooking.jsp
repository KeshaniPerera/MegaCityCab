<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
    <%@ include file="navBar.jsp" %>

<p>Your total bill is: ${bill} LKR</p>
<p>Pickup Location: ${pickup}</p>
    <p>Drop Location: ${drop}</p>
    <p>Selected Vehicle: ${vehicle}</p>
    <p>Date: ${date}</p>
    <p>Time: ${time}</p>

</body>
</html>