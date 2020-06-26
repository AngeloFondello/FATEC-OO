/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Class;

import DB.Listener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author angelo
 */
public class Quiz {
 
   private String description;
   private String answer;
   private String answerwrong1;
   private String answerwrong2;
   private String answerwrong3;

   
   //METODO PARA VERIFICAR SE A RESPOSTA ESTA CORRETA
   
   public boolean verifyAnswer() throws SQLException{
       
        Connection con = DriverManager.getConnection(Listener.URL);
        String SQL = "SELECT * FROM questions WHERE answer = ? and description = ?";
        PreparedStatement stmt = con.prepareStatement(SQL);
        stmt.setString(1, this.answer);
        stmt.setString(2, this.description);
        ResultSet rs = stmt.executeQuery();
        boolean vef = false;
        if(rs.next()){
            vef = true;
        }
        stmt.close();
        rs.close();
        con.close();
        
        return vef;
   }
   
   //CRIANDO METODO PARA PEGAR QEUSTÔES
   public static ArrayList<Quiz> getQuiz() throws Exception{
        ArrayList<Quiz> list = new ArrayList<>();
        Class.forName("org.sqlite.JDBC");
        Connection on = DriverManager.getConnection(Listener.URL);
        Statement stmt = on.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM questions ORDER BY random() LIMIT 10");
        while(rs.next()){
            list.add(new Quiz(
                    rs.getString("description"), 
                    rs.getString("answer"), 
                    rs.getString("answerwrong1"), 
                    rs.getString("answerwrong2"), 
                    rs.getString("answerwrong3")));
        }
        rs.close();
        stmt.close();
        on.close();
        return list;
    }
   
   
   
   
    public Quiz(String description, String answer, String answerwrong1, String answerwrong2, String answerwrong3) {
        this.description = description;
        this.answer = answer;
        this.answerwrong1 = answerwrong1;
        this.answerwrong2 = answerwrong2;
        this.answerwrong3 = answerwrong3;
    }
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getAnswerwrong1() {
        return answerwrong1;
    }

    public void setAnswerwrong1(String answerwrong1) {
        this.answerwrong1 = answerwrong1;
    }

    public String getAnswerwrong2() {
        return answerwrong2;
    }

    public void setAnswerwrong2(String answerwrong2) {
        this.answerwrong2 = answerwrong2;
    }

    public String getAnswerwrong3() {
        return answerwrong3;
    }

    public void setAnswerwrong3(String answerwrong3) {
        this.answerwrong3 = answerwrong3;
    }
    
    }