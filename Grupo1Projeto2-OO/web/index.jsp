<%-- 
    Document   : index
    Created on : 17/06/2020, 19:50:51
    Author     : Daniel
--%>

<%@page import="DB.Listener"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QUIZ - Página inicial</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    </head>
    <body class="bg-dark">
        <div class="container">
            <div class="row justify-content-center">
                <h1 class="text-light mb-5 mt-2">Quiz x Math</h1>
            </div>
            <div class="row justify-content-center">
                <%@include file="WEB-INF/jspf/menu.jspf" %>
                
            </div>
            <div class="row justify-content-center">
                <%if (Listener.exceptionMessage != null) {%>
                <h3 class="text-danger font-weight-bold"><%= Listener.exceptionMessage%></h3>
                <%}
                if(errorMsg != ""){
                %>
                    <p class="text-danger font-weight-bold alert alert-danger"><%=errorMsg%></p>
                <%}%>
            </div>
            <div class="row justify-content-center">
                <%@include file="WEB-INF/jspf/tables.jspf" %>
            </div>
        </div>

    </body>
</html>
