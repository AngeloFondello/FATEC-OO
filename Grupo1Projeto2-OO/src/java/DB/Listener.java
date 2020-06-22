/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import Class.Quiz;
import Class.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author angelo
 */
public class Listener implements ServletContextListener {

    //CRIA O BANCO DE DADOS NA PASTA INDICADA
    public static final String URL = "jdbc:sqlite:D:\\FATEC - ADS\\POO\\Projeto 3\\quiz.db";
    public static String exceptionMessage = null;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        String step = "Starting database creation";
        try {
            Class.forName("org.sqlite.JDBC");
            Connection con = DriverManager.getConnection(URL);
            Statement stmt = con.createStatement();

            //CRIANDO BANCO DE DADOS
            String SQL = null;

            //CRIANDO TABELA DE USUARIOS
            step = "users Table creation";

            //POPULANDO CASO NÂO HAJA NENHUM REGISTRO
            SQL = "CREATE TABLE IF NOT EXISTS users("
                    + "name VARCHAR(200) NOT NULL,"
                    + "login VARCHAR(50) NOT NULL,"
                    + "password_hash LONG NOT NULL"
                    + ")";
            stmt.executeUpdate(SQL);

            //CRIANDO TABELA USERS PARA ARMAZENAr USUARIOS
            step = "Default users creation";
            if (User.getUsers().isEmpty()) {
                SQL = "INSERT INTO users(name, login, password_hash) "
                        + "VALUES('Dani dos Code', 'DaniThePai', '" + ("123456".hashCode()) + "')";
                stmt.executeUpdate(SQL);

                //CRIANDO USUARIOS
                SQL = "INSERT INTO users(name, login, password_hash) "
                        + "VALUES('Erick da maljação', 'ErickTheStrong', '" + ("123456".hashCode()) + "')";
                stmt.executeUpdate(SQL);
                SQL = "INSERT INTO users(name, login, password_hash) "
                        + "VALUES('SamuelBoy.SP ', 'SamucaTheBoy', '" + ("123456".hashCode()) + "')";
                stmt.executeUpdate(SQL);
            }

            //CRIANDO TABELA QUESTIONS PARA ARMAZENAR PERGUNTASE E RESPOSTAS
            step = "questions Table creation";
            SQL = "CREATE TABLE IF NOT EXISTS questions("
                    + "description VARCHAR(250) PRIMARY KEY,"
                    + "answer VARCHAR(250) NOT NULL,"
                    + "answerwrong1 VARCHAR(250) NOT NULL,"
                    + "answerwrong2 VARCHAR(250) NOT NULL,"
                    + "answerwrong3 VARCHAR(250) NOT NULL"
                    + ")";
            stmt.executeUpdate(SQL);

            //CRIANDO PERGUNTAS E RESPOSTAS
            step = "Default questions creation";
            if (Quiz.getQuiz().isEmpty()) {
                SQL = "INSERT INTO questions(description, answer, answerwrong1, answerwrong2, answerwrong3) VALUES ('Quanto é 17 x 6','102', '108', '94', '93')";
                stmt.executeUpdate(SQL);
                SQL = "INSERT INTO questions(description, answer, answerwrong1, answerwrong2, answerwrong3) VALUES ('Quanto é 6 x 16?','96', '94', '97', '98')";
                stmt.executeUpdate(SQL);
                SQL = "INSERT INTO questions(description, answer, answerwrong1, answerwrong2, answerwrong3) VALUES ('Quanto é 19 x 4?','76', '74', '80', '66')";
                stmt.executeUpdate(SQL);
                SQL = "INSERT INTO questions(description, answer, answerwrong1, answerwrong2, answerwrong3) VALUES ('Quanto é 15 x 19?','285', '282', '281', '277')";
                stmt.executeUpdate(SQL);
                SQL = "INSERT INTO questions(description, answer, answerwrong1, answerwrong2, answerwrong3) VALUES ('Quanto é 13 x 18?','234', '219', '233', '228')";
                stmt.executeUpdate(SQL);
                SQL = "INSERT INTO questions(description, answer, answerwrong1, answerwrong2, answerwrong3) VALUES ('Quanto é 199 + 219?', '418', '410', '420', '426')";
                stmt.executeUpdate(SQL);
                SQL = "INSERT INTO questions(description, answer, answerwrong1, answerwrong2, answerwrong3) VALUES ('Quanto é 422 + 53?', '475', '465', '483', '476')";
                stmt.executeUpdate(SQL);
                SQL = "INSERT INTO questions(description, answer, answerwrong1, answerwrong2, answerwrong3) VALUES ('Quanto é 271 + 260?', '531', '537', '529', '534')";
                stmt.executeUpdate(SQL);
                SQL = "INSERT INTO questions(description, answer, answerwrong1, answerwrong2, answerwrong3) VALUES ('Quanto é 354 + 77?', '431', '440', '422', '434')";
                stmt.executeUpdate(SQL);
                SQL = "INSERT INTO questions(description, answer, answerwrong1, answerwrong2, answerwrong3) VALUES ('Quanto é 387 + 72?', '459', '461', '468', '462')";
                stmt.executeUpdate(SQL);
                SQL = "INSERT INTO questions(description, answer, answerwrong1, answerwrong2, answerwrong3) VALUES ('Quanto é 485 - 289?', '196', '197', '186', '188')";
                stmt.executeUpdate(SQL);
                SQL = "INSERT INTO questions(description, answer, answerwrong1, answerwrong2, answerwrong3) VALUES ('Quanto é 247 - 289?', '-42', '-37', '-43', '-39')";
                stmt.executeUpdate(SQL);
                SQL = "INSERT INTO questions(description, answer, answerwrong1, answerwrong2, answerwrong3) VALUES ('Quanto é 110 - 310?', '-200', '-201', '-210', '-208')";
                stmt.executeUpdate(SQL);
                SQL = "INSERT INTO questions(description, answer, answerwrong1, answerwrong2, answerwrong3) VALUES ('Quanto é 275 - 408?', '-133', '-139', '-129', '-132')";
                stmt.executeUpdate(SQL);
                SQL = "INSERT INTO questions(description, answer, answerwrong1, answerwrong2, answerwrong3) VALUES ('Quanto é 220 - 415?', '-195', '-198', '-192', '-185')";
                stmt.executeUpdate(SQL);

            }

            //TABELA QUIZ PARA ARMAZENAR O RESULTADO DOS QUIZES RESPONDIDOS
            step = "quiz table creation";

            SQL = "CREATE TABLE IF NOT EXISTS quiz("
                    + "cd_quiz INTEGER PRIMARY KEY,"
                    + "result REAL NOT NULL,"
                    + "fk_login_user VARCHAR(50) NOT NULL,"
                    + "FOREIGN KEY (fk_login_user) REFERENCES users(login))";
            stmt.executeUpdate(SQL);

        } catch (Exception ex) {
            exceptionMessage = step + ": " + ex;
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
