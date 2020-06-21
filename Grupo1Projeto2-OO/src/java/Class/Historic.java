/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Class;

import DB.Listener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

/**
 *
 * @author angelo
 */
public class Historic {
    private String user;
    private double result;
    //private Date date;

    public Historic(String user, double result) {
        this.user = user;
        this.result = result;
        //this.date = date;
    }
    
    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public double getResult() {
        return result;
    }

    public void setResult(double result) {
        this.result = result;
    }


    
    //ORDENA AS MELHORES NOTA
    public static ArrayList<Historic> getBestResults() throws Exception{
        ArrayList<Historic> list = new ArrayList<>();
        Class.forName("org.sqlite.JDBC");
        Connection con = DriverManager.getConnection(Listener.URL);
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM quiz WHERE ORDER BY result LIMIT 10");
        while(rs.next()){
            list.add(
                    new Historic(
                            rs.getString("login"), 
                            rs.getDouble("result")
                    )
            );
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    //ORDENA OS AS ULTIMAS NOTAS
    public static ArrayList<Historic> getLastQuiz() throws Exception{
        ArrayList<Historic> list = new ArrayList<>();
        Class.forName("org.sqlite.JDBC");
        Connection con = DriverManager.getConnection(Listener.URL);
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM quiz ORDER BY random() LIMIT 10");
        while(rs.next()){
            list.add(
                    new Historic(
                            rs.getString("login"), 
                            rs.getDouble("result")
                    )
            );
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
}
