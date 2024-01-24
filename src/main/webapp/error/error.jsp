<%@ page isErrorPage="true" %>
<html>
<head>
    <title>Error Page</title>
    <link rel="stylesheet" href="./error/niga.css">
</head>
<body>
<img src="./error/niga.jpg" id="nigaPicture" alt="NIGER">
<h1><%="RESPONSE:400"%></h1>
<h1><%="HEADERS"%></h1>
<h1><%="x:"+request.getHeader("x")%></h1>
<h1><%="y:"+request.getHeader("y")%></h1>
<h1><%="r:"+request.getHeader("r")%></h1>
<h1><%="currentTime:"+request.getHeader("currentTime")%></h1>
<%
   response.setStatus(400);
%>
</body>
</html>