/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author anapaula
 */
public class ConnectionFactory {
    public static Connection getConnection() throws SQLException{
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost/cinema",
                    "root","vruck3679263");
            return  con;
        }
        catch(ClassNotFoundException ex){
            throw new SQLException(ex.getMessage());
        
        }
        
    }
}
