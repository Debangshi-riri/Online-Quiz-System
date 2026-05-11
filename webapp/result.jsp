<html>
<head>
    <title>Quiz Result</title>
    <style>
        body { font-family: Arial; text-align: center; margin-top: 50px; background-color: #f4f4f4; }
        .box { background: white; display: inline-block; padding: 30px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h1 { color: #2c3e50; }
        .score { font-size: 48px; color: #27ae60; font-weight: bold; }
    </style>
</head>
<body>
    <div class="box">
        <h1>Congratulations, <%= request.getAttribute("uName") %>!</h1>
        <p>You have successfully completed the quiz.</p>
        <p>Your Final Score is:</p>
        <div class="score"><%= request.getAttribute("finalScore") %></div>
        <br>
        <a href="quiz.jsp" style="text-decoration: none; color: #3498db;">Try Again?</a>
    </div>
</body>
</html>