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
                    session.setAttribute("user.name", name);
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
        <title>Criar conta</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    </head>
    <body class="bg-dark">
        <div class="container">
            <div class="row justify-content-center">
                <a class="text-light mb-5 mt-2 h1" href="index.jsp">Quiz x Math</a>
            </div>
            <div class="row justify-content-center">
            <h3 class="text-light col-12 text-center">Criar conta</h3>
            <form method="post" class="form-group text-light col-6">
                <label class="font-weight-bold">Nome:</label>
                <input class="form-control bg-dark text-light" type="text" name="user.name">
                <label class="font-weight-bold">Login:</label>
                <input class="form-control bg-dark text-light" type="text" name="user.login">
                <label class="font-weight-bold">Senha:</label>
                <input class="form-control bg-dark text-light" type="password" name="user.password">
                <label class="font-weight-bold">Confirme a senha:</label>
                <input class="form-control bg-dark text-light" type="password" name="user.re-password">
                <input class="form-control btn btn-secondary font-weight-bold mt-4" type="submit" name="sign" value="Registrar-se">
                <a class="form-control btn btn-secondary mt-1" href="index.jsp">Voltar</a>
            </form>
            </div>
        </div>
        <%=errorMsg%>
        <%if(Listener.exceptionMessage != null){%>
            <h3 style="color:red"><%= Listener.exceptionMessage %></h3>
            <%}%>
    </body>
</html>
