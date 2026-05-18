package com.quiz;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ResultServlet")
public class ResultServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int score = 0;
        String name = request.getParameter("studentName");

        try {
            Connection con = DBConn.getConn();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT id, correct_ans FROM questions");

            while(rs.next()) {
                // The JSP sends answers with names like q1, q2, q3...
                String questionId = "q" + rs.getInt("id");
                String userAnswer = request.getParameter(questionId);
                String correctAnswer = rs.getString("correct_ans");

                
                if(userAnswer != null && userAnswer.equals(correctAnswer)) {
                    score++;
                }
            }
            con.close();
            
            
            request.setAttribute("finalScore", score);
            request.setAttribute("uName", name);
            
            
            RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
            rd.forward(request, response);

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}