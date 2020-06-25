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
import java.util.Collections;
import java.util.Date;

/**
 *
 * @author angelo
 */
public class Historic {
    private double result;
    private String user;
    //private Date date;

    public Historic(double result, String user) {
        this.result = result;
        this.user = user;
        //this.date = date;
    }
    

    public double getResult() {
        return result;
    }

    public void setResult(double result) {
        this.result = result;
    }
    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public void addResult() throws SQLException{
        Connection con = DriverManager.getConnection(Listener.URL);
        String SQL = "INSERT INTO quiz(result, fk_login_user) VALUES (?, ?)";
        PreparedStatement stmt = con.prepareStatement(SQL);
        stmt.setDouble(1, this.result);
        stmt.setString(2, this.user);
        stmt.execute();
        stmt.close();
        con.close();
    }
    //ORDENA AS MELHORES NOTA
    public static ArrayList<Historic> getBestResults() throws Exception{
        ArrayList<Historic> list = new ArrayList<>();
        Class.forName("org.sqlite.JDBC");
        Connection con = DriverManager.getConnection(Listener.URL);
        String SQL;
        SQL = "SELECT * FROM quiz ORDER BY result LIMIT 10";
        PreparedStatement stmt = con.prepareStatement(SQL);
        ResultSet rs = stmt.executeQuery();
        while(rs.next()){
            list.add(
                    new Historic(
                            rs.getDouble("result"),
                            rs.getString("fk_login_user")
                    )
            );
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    //ORDENA OS ULTIMOS TESTE
    public static ArrayList<Historic> getLastQuiz(String login) throws Exception{
        ArrayList<Historic> list = new ArrayList<>();
        Class.forName("org.sqlite.JDBC");
        Connection con = DriverManager.getConnection(Listener.URL);
        String SQL;
        if(!login.equals("")){
            SQL = "SELECT * FROM quiz WHERE fk_login_user = ? ORDER BY rowid DESC LIMIT 10";
        }
        else{
            SQL = "SELECT * FROM quiz ORDER BY rowid DESC LIMIT 10";
        }
        PreparedStatement stmt = con.prepareStatement(SQL);
        if(!login.equals("")){
            stmt.setString(1, login);
        }
        ResultSet rs = stmt.executeQuery();
        while(rs.next()){
            list.add(
                    new Historic(
                            rs.getDouble("result"),
                            rs.getString("fk_login_user")
                    )
            );
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
}
