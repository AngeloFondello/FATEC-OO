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
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author angelo
 */
public class User {
    private String login;
    private String name;
    
    
    //CRIANDO METODO PARA PEGAR USUARIOS
    public static ArrayList<User> getUsers() throws Exception{
        ArrayList<User> list = new ArrayList<>();
        Class.forName("org.sqlite.JDBC");
        Connection on = DriverManager.getConnection(Listener.URL);
        Statement stmt = on.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM users");
        while(rs.next()){
            list.add(new User(
                    rs.getString("login"), 
                    rs.getString("name")));
        }
        rs.close();
        stmt.close();
        on.close();
        return list;
    }
    
    public static User getUser(String login, String password) throws Exception{
        User user = null;
        Class.forName("org.sqlite.JDBC");
        Connection on = DriverManager.getConnection(Listener.URL);
        String SQL = "SELECT * FROM users WHERE login=? AND password_hash=?";
        PreparedStatement stmt = on.prepareStatement(SQL);
        stmt.setString(1, login);
        stmt.setLong(2, password.hashCode());
        ResultSet rs = stmt.executeQuery();
        if(rs.next()){
            user = new User(
                    rs.getString("name"), 
                    rs.getString("login"));
        }else{
            
        }
        rs.close();
        stmt.close();
        on.close();
        return user;
    }
    //METODO PARA CRIAR SESSAO DO USUARIO
    public static User login(String login, String password) throws Exception {
        User output = null;
        Connection con = DriverManager.getConnection(Listener.URL);
        String SQL = "SELECT * FROM users WHERE login=? AND password_hash=?";
        PreparedStatement stmt = con.prepareStatement(SQL);
        stmt.setString(1, login);
        stmt.setLong(2, password.hashCode());
        ResultSet rs = stmt.executeQuery();
        if(rs.next()){
            output = new User(
                    rs.getString("name"), 
                    rs.getString("login")
            );
        }else{
            output = null;
        }
        rs.close();
        stmt.close();
        con.close();
        return output;
    }
    
    //CRIANDO METODO PARA CRIAR USUARIOS
    public static void addUser(String login, String name,String password) throws Exception{
        Class.forName("org.sqlite.JDBC");
        Connection on = DriverManager.getConnection(Listener.URL);
        String SQL = "INSERT INTO users(login, name, password_hash) VALUES(?,?,?,?)";
        PreparedStatement stmt = on.prepareStatement(SQL);
        stmt.setString(1, login);
        stmt.setString(2, name);
        stmt.setLong(3, password.hashCode());
        stmt.execute();
        stmt.close();
        on.close();
    }

    public User(String login, String name) {
        this.login = login;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

}
