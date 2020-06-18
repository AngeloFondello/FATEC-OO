<%-- 
    Document   : index
    Created on : 17/06/2020, 19:50:51
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String errorMsg = null;
    //verifica se o usuario fez o login 
    if(session.getAttribute("user.login") != null){
        //verifica se o usuario acionou o botao de sair
        if(request.getParameter("session.logout") != null){
            //realiza a remocao da sessao do usuario
            session.removeAttribute("user.login");
            session.removeAttribute("user.pass");
            response.sendRedirect("login.jsp");
        }
    }
    //envia o usuario para pagina de login caso nao tenha feito login
    else{
        response.sendRedirect("login.jsp");
    }
    
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QUIZ - Página inicial</title>
    </head>
    <body>
        <h1>Hello <%=session.getAttribute("user.login")%>!</h1>
        <form>
            <input type="submit" name="session.logout" value="Sair">
        </form>
        <!--tabela com select order by rowdid(ultimos testes) e select order by result(melhores notas) -->
    </body>
</html>
