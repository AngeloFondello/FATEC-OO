<%-- 
    Document   : sign
    Created on : 19/06/2020, 22:23:55
    Author     : Daniel
--%>

<%@page import="DB.Listener"%>
<%@page import="Class.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String errorMsg = "";
    //verifico se já tem uma sessão
    if (session.getAttribute("user.login") != null) {
        response.sendRedirect("index.jsp");
    } else {
        //verifico se o botao de cadastrar foi acionado
        if (request.getParameter("sign") != null) {
            //pegar os dados do cadastro
            String login = request.getParameter("user.login");
            String name = request.getParameter("user.name");
            String pass = request.getParameter("user.password");
            String pass2 = request.getParameter("user.re-password");
            //verifica se a confirmação da senha é igual a senha
            if (pass.equals(pass2)) {
                //verifica se já existe usuario
                User user = new User(login, name);
                if (!user.verifyUser(login)) {
                    //insere o usuario
                    user.addUser(login, name, pass);
                    //faz login
                    session.setAttribute("user.login", login);
                    session.setAttribute("user.pass", pass);
                    response.sendRedirect("index.jsp");
                } else {
                    errorMsg += "Login já esta em uso!";
                }
            } else{
                errorMsg += "Senhas incorretas!";
            }
        }
        
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post">
            <label>Nome:</label>
            <input type="text" name="user.name"><br><br>
            <label>Login:</label>
            <input type="text" name="user.login"><br><br>
            <label>Senha:</label>
            <input type="password" name="user.password"><br><br>
            <label>Confirme a senha:</label>
            <input type="password" name="user.re-password"><br><br>
            <input type="submit" name="sign" value="Registrar-se">
            <a href="index.jsp">Voltar</a>
        </form>
        <%=errorMsg%>
        <%if(Listener.exceptionMessage != null){%>
            <h3 style="color:red"><%= Listener.exceptionMessage %></h3>
            <%}%>
    </body>
</html>
