package com.quiz;
import java.sql.*;

public class DBConn 
{
    public static Connection getConn()
    {
        Connection con = null;
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college_quiz", "root", "");
        } 
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
}