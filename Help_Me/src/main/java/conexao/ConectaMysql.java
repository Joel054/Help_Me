/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Clecio
 */
public class ConectaMysql {
    public static Connection getConexao() throws Exception{
             Class.forName("com.mysql.jdbc.Driver");
             // abrir conexao
             String url = "jdbc:mysql://localhost:3306/Help_Me";
             String user = "root";
             String pass = "4431";
             Connection conn = DriverManager.getConnection(url, user, pass);
            return conn;
    }
}
