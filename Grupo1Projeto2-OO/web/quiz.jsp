<%-- 
    Document   : quiz
    Created on : 22/06/2020, 14:49:13
    Author     : Daniel
--%>

<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Class.Quiz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("user.login") == null){
        response.sendRedirect("index.jsp");
    }
            
    
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz</title>
    </head>
    <body>
        <a href="index.jsp">Voltar</a>
        <form method="post">
        <%
            Random random = new Random();
            int x = 0;
            ArrayList<Quiz> list = new Quiz("", "", "", "", "").getQuiz();
            int i = 0;
            for(Quiz question : list){
                x = random.nextInt(3); 
                i++;
                if(x == 1){
                %>
                <p><%=i%>.)<%=question.getDescription()%></p>
                <input type="radio" name="ans<%=i%>" value="<%=question.getAnswerwrong1()%>">
                <label><%=question.getAnswerwrong1()%></label><br>
                <input type="radio" name="ans<%=i%>" value="<%=question.getAnswer()%>">
                <label><%=question.getAnswer()%></label><br>
                <input type="radio" name="ans<%=i%>" value="<%=question.getAnswerwrong3()%>">
                <label><%=question.getAnswerwrong3()%></label><br>
                <input type="radio" name="ans<%=i%>" value="<%=question.getAnswerwrong2()%>">
                <label><%=question.getAnswerwrong2()%></label><br>
                <%  
                }
                else if(x == 2){
                    %>
                <p><%=i%>.)<%=question.getDescription()%></p>
                <input type="radio" name="ans<%=i%>" value="<%=question.getAnswerwrong2()%>">
                <label><%=question.getAnswerwrong2()%></label><br>
                <input type="radio" name="ans<%=i%>" value="<%=question.getAnswerwrong3()%>">
                <label><%=question.getAnswerwrong3()%></label><br>
                <input type="radio" name="ans<%=i%>" value="<%=question.getAnswer()%>">
                <label><%=question.getAnswer()%></label><br>
                <input type="radio" name="ans<%=i%>" value="<%=question.getAnswerwrong1()%>">
                <label><%=question.getAnswerwrong1()%></label><br>
                <%  
                }
                
                else{
                    %>
                    <p><%=i%>.)<%=question.getDescription()%></p>
                    <input type="radio" name="ans<%=i%>" value="<%=question.getAnswerwrong3()%>">
                    <label><%=question.getAnswerwrong3()%></label><br>
                    <input type="radio" name="ans<%=i%>" value="<%=question.getAnswerwrong2()%>">
                    <label><%=question.getAnswerwrong2()%></label><br>
                    <input type="radio" name="ans<%=i%>" value="<%=question.getAnswerwrong1()%>">
                    <label><%=question.getAnswerwrong1()%></label><br>
                    <input type="radio" name="ans<%=i%>" value="<%=question.getAnswer()%>">
                    <label><%=question.getAnswer()%></label><br>
                    <%  
                }
                
                
            }
        %>
        
        <input type="submit" name="quiz.answer" value="Enviar respostas">
        
        </form>
    </body>
</html>
