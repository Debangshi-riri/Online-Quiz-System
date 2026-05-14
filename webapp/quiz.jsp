<%@ page import="java.sql.*, com.quiz.DBConn" %>
<html>
<head>
    <title>Online Quiz System</title>
    <style>
        body { font-family: Arial; margin: 40px; background-color: #f4f4f4; }
        .quiz-container { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h1 { color: #333; }
        .question { margin-bottom: 20px; border-bottom: 1px solid #ddd; padding-bottom: 10px; }
    </style>
</head>
<body>
    <div class="quiz-container">
        <h1>BCA PCA-2: Online Quiz</h1>
        <form action="ResultServlet" method="post">
            <label><b>Enter your Name to Start:</b></label><br>
            <input type="text" name="studentName" required style="margin-bottom: 20px;"><br>

            <%
                try 
                {
                    Connection con = DBConn.getConn();
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM questions");

                    while(rs.next()) 
                    {
                        int id = rs.getInt("id");
            %>
                        <div class="question">
                            <p><b>Q<%=id%>: <%= rs.getString("question_text").replace("<", "&lt;").replace(">", "&gt;") %></b></p>
                            <input type="radio" name="q<%=id%>" value="A" required> <%= rs.getString("option_a").replace("<", "&lt;").replace(">", "&gt;") %><br>
                            <input type="radio" name="q<%=id%>" value="B"> <%= rs.getString("option_b").replace("<", "&lt;").replace(">", "&gt;") %><br>
                            <input type="radio" name="q<%=id%>" value="C"> <%= rs.getString("option_c").replace("<", "&lt;").replace(">", "&gt;") %><br>
                            <input type="radio" name="q<%=id%>" value="D"> <%= rs.getString("option_d").replace("<", "&lt;").replace(">", "&gt;") %><br>
                        </div>
            <%
                    }
                    con.close();
                } 
                catch(Exception e) 
                { 
                    out.println("Error: " + e.getMessage()); 
                }
            %>
            
            <br><input type="submit" value="Finish and See Result" style="padding: 10px 20px; cursor: pointer;">
        </form>
    </div>
</body>
</html>