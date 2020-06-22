<%-- 
    Document   : index
    Created on : 17/06/2020, 19:50:51
    Author     : Daniel
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Class.Historic"%>
<%@page import="DB.Listener"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QUIZ - Página inicial</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <%if(Listener.exceptionMessage != null){%>
            <h3 style="color:red"><%= Listener.exceptionMessage %></h3>
        <%}%>
        
        
    </body>
</html>
