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
    request.setCharacterEncoding("UTF-8");
            
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
        session.setAttribute("last.nota", nota);
        response.sendRedirect("index.jsp");
        
    }
    
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Quiz</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    </head>
    <body class="bg-dark">
        <div class="container text-light">
            <div class="row justify-content-center">
                <a class="text-light mb-5 mt-2 h1" href="index.jsp">Quiz x Math</a>
            </div>
            <div class="row">
                <a class="btn btn-secondary font-weight-bold col-2" href="index.jsp">Voltar</a>
            </div>
        <div class="row justify-content-center">
            <div class="col-8">
                
            
        <form method="post" class="form-group">
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
                    <div class="bg-secondary pr-4">
                    <p class="text-light font-weight-bold h4 mt-3"><%=i%>.) <%=question.getDescription()%></p>
                    <input type="hidden" name="desc<%=i%>" value="<%=question.getDescription()%>">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="ans<%=i%>" value="<%=question.getAnswerwrong1()%>">
                        <label class="form-check-label"><%=question.getAnswerwrong1()%></label><br>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="ans<%=i%>" value="<%=question.getAnswer()%>">
                        <label class="form-check-label"><%=question.getAnswer()%></label><br>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="ans<%=i%>" value="<%=question.getAnswerwrong3()%>">
                        <label class="form-check-label"><%=question.getAnswerwrong3()%></label><br>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="ans<%=i%>" value="<%=question.getAnswerwrong2()%>">
                        <label class="form-check-label"><%=question.getAnswerwrong2()%></label><br>
                    </div>
                    </div>
                    <%  
                }
                else if(x == 2){
                    %>
                    <div class="bg-secondary">
                    <p class="text-light font-weight-bold h4 mt-3"><%=i%>.) <%=question.getDescription()%></p>
                    <input type="hidden" name="desc<%=i%>" value="<%=question.getDescription()%>">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="ans<%=i%>" value="<%=question.getAnswerwrong2()%>">
                        <label class="form-check-label"><%=question.getAnswerwrong1()%></label><br>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="ans<%=i%>" value="<%=question.getAnswerwrong1()%>">
                        <label class="form-check-label"><%=question.getAnswerwrong3()%></label><br>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="ans<%=i%>" value="<%=question.getAnswerwrong2()%>">
                        <label class="form-check-label"><%=question.getAnswerwrong2()%></label><br>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="ans<%=i%>" value="<%=question.getAnswer()%>">
                        <label class="form-check-label"><%=question.getAnswer()%></label><br>
                    </div>
                    </div>
                    <%  
                }
                
                else{
                    %>
                    <div class="bg-secondary">
                    <p class="text-light font-weight-bold h4 mt-3"><%=i%>.) <%=question.getDescription()%></p>
                    <input type="hidden" name="desc<%=i%>" value="<%=question.getDescription()%>">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="ans<%=i%>" value="<%=question.getAnswer()%>">
                        <label class="form-check-label"><%=question.getAnswer()%></label><br>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="ans<%=i%>" value="<%=question.getAnswerwrong1()%>">
                        <label class="form-check-label"><%=question.getAnswerwrong1()%></label><br>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="ans<%=i%>" value="<%=question.getAnswerwrong3()%>">
                        <label class="form-check-label"><%=question.getAnswerwrong3()%></label><br>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="ans<%=i%>" value="<%=question.getAnswerwrong2()%>">
                        <label class="form-check-label"><%=question.getAnswerwrong2()%></label><br>
                    </div>
                    </div>
                    <%  
                }
                
                
            }
        %>
        
        <input class="btn btn-secondary mt-2 font-weight-bold btn-block" type="submit" name="quiz.answers" value="Enviar respostas">
        
        </form>
        </div>
        </div>
        </div>
    </body>
</html>
