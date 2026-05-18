<%@ page import="java.sql.*, com.quiz.DBConn" %>
<html>
<head>
    <title>Online Quiz System</title>
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
</head>
<body>
    <div class="quiz-container">
        <h1>Culinary Arts & Science Quiz</h1>
        <form action="ResultServlet" method="post">
            <div class="name-section">
                <label><b>Enter your Name to Start:</b></label><br>
                <input type="text" name="studentName" required class="name-input"><br>
            </div>

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
                            <img src="assets/images/q<%=id%>.jpg" class="question-image" alt="Recipe Image">
                            
                            <p class="question-text"><b>Q<%=id%>: <%= rs.getString("question_text") %></b></p>
                            
                            <label class="option-row">
                                <input type="radio" name="q<%=id%>" value="A" required> <%= rs.getString("option_a") %>
                            </label>
                            <label class="option-row">
                                <input type="radio" name="q<%=id%>" value="B"> <%= rs.getString("option_b") %>
                            </label>
                            <label class="option-row">
                                <input type="radio" name="q<%=id%>" value="C"> <%= rs.getString("option_c") %>
                            </label>
                            <label class="option-row">
                                <input type="radio" name="q<%=id%>" value="D"> <%= rs.getString("option_d") %>
                            </label>
                        </div>
            <%
                    }
                    con.close();
                } 
                catch(Exception e) 
                { 
                    out.println("<div class='error'>Error: " + e.getMessage() + "</div>"); 
                }
            %>
            
            <input type="submit" value="Finish and See Result" class="btn-submit">
        </form>
    </div>
</body>
</html>