<%-- 
    Document   : login
    Created on : 17/06/2020, 22:16:25
    Author     : Daniel
--%>
<%@page import="DB.Listener"%>
<%@page import="Class.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String errorMsg = "";
    //verifico se já tem uma sessão
    if(session.getAttribute("user.login") == null){
        //verifico se o botao de login foi acionado
        if(request.getParameter("session.login") != null){
            //pegar os dados do form de login e criar objeto user
            String login = request.getParameter("user.login");
            String pass = request.getParameter("user.password");

            User user = User.login(login, pass);

            if(user == null){
                errorMsg += "Login ou senha incorretos";
            }
            else{
                //realizar login e ir para a página incial
                session.setAttribute("user.login", login);
                session.setAttribute("user.pass", pass);
                response.sendRedirect("index.jsp");
            }
        }
    }
    else{
        response.sendRedirect("index.jsp");
    }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QUIZ - Entrar</title>
    </head>
    <body>
        <h1>Quiz x Quiz</h1>
        <form action="#" method="post">
            <label>Login</label>
            <input type="text" name="user.login">
            <label>Senha</label>
            <input type="password" name="user.password">
            <input type="submit" name="session.login" value="Entrar">
        </form>
        <%=errorMsg%>
        <%if(Listener.exceptionMessage != null){%>
            <h3 style="color:red"><%= Listener.exceptionMessage %></h3>
            <%}%>
    </body>
</html>
