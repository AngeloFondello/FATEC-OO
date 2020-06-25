<%-- 
    Document   : quiz
    Created on : 22/06/2020, 14:49:13
    Author     : Daniel
--%>

<%@page import="Class.Historic"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Class.Quiz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
            
    if(session.getAttribute("user.login") == null){
        response.sendRedirect("index.jsp");
    }
            
    if(request.getParameter("quiz.answers") != null){
        double nota = 0;
        
        Quiz quiz = new Quiz(request.getParameter("desc1").toString(), request.getParameter("ans1").toString(), " ", " ", " ");
        nota += (quiz.verifyAnswer()) ? 1.0 : 0;
        
        quiz = new Quiz(request.getParameter("desc2").toString(), request.getParameter("ans2").toString(), " ", " ", " ");
        nota += (quiz.verifyAnswer()) ? 1.0: 0;
        
        quiz = new Quiz(request.getParameter("desc3").toString(), request.getParameter("ans3").toString(), " ", " ", " ");
        nota += (quiz.verifyAnswer()) ? 1.0 : 0;
        
        quiz = new Quiz(request.getParameter("desc4").toString(), request.getParameter("ans4").toString(), " ", " ", " ");
        nota += (quiz.verifyAnswer()) ? 1.0 : 0;
        
        quiz = new Quiz(request.getParameter("desc5").toString(), request.getParameter("ans5").toString(), " ", " ", " ");
        nota += (quiz.verifyAnswer()) ? 1.0 : 0;
        
        quiz = new Quiz(request.getParameter("desc6").toString(), request.getParameter("ans6").toString(), " ", " ", " ");
        nota += (quiz.verifyAnswer()) ? 1.0 : 0;
        
        quiz = new Quiz(request.getParameter("desc7").toString(), request.getParameter("ans7").toString(), " ", " ", " ");
        nota += (quiz.verifyAnswer()) ? 1.0 : 0;
        
        quiz = new Quiz(request.getParameter("desc8").toString(), request.getParameter("ans8").toString(), " ", " ", " ");
        nota += (quiz.verifyAnswer()) ? 1.0 : 0;
        
        quiz = new Quiz(request.getParameter("desc9").toString(), request.getParameter("ans9").toString(), " ", " ", " ");
        nota += (quiz.verifyAnswer()) ? 1.0 : 0;
        
        quiz = new Quiz(request.getParameter("desc10").toString(), request.getParameter("ans10").toString(), " ", " ", " ");
        nota += (quiz.verifyAnswer()) ? 1.0 : 0;
        
        Historic result = new Historic(nota, session.getAttribute("user.login").toString());
        result.addResult();
        session.setAttribute("last.nota", quiz.verifyAnswer());
        
        
    }
    
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz <%=
            session.getAttribute("last.nota")
        %></title>
    </head>
    <body>
        <a href="index.jsp">Voltar</a>
        <form method="post">
        <%
            Random random = new Random();
            int x = 0;
            int i = 0;
            ArrayList<Quiz> list = new Quiz("", "", "", "", "").getQuiz();
            for(Quiz question : list){
                x = random.nextInt(3); 
                i++;
                if(x == 1){
                    %>
                    <p><%=i%>.) <%=question.getDescription()%></p>
                    <input type="hidden" name="desc<%=i%>" value="<%=question.getDescription()%>">
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
                    <p><%=i%>.) <%=question.getDescription()%></p>
                    <input type="hidden" name="desc<%=i%>" value="<%=question.getDescription()%>">
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
                    <p><%=i%>.) <%=question.getDescription()%></p>
                    <input type="hidden" name="desc<%=i%>" value="<%=question.getDescription()%>">
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
        
        <input type="submit" name="quiz.answers" value="Enviar respostas">
        
        </form>
    </body>
</html>
