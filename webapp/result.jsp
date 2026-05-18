<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Quiz Result</title>
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
</head>
<body>
    <div class="result-container">
        <div class="result-badge">🍳</div>
        
        <h1 class="result-title">Congratulations, <%= request.getAttribute("uName") %>!</h1>
        <p class="result-text">You have successfully completed the Culinary Arts & Science Quiz.</p>
        
        <p class="score-label">Your Final Score</p>
        <div class="score-display"><%= request.getAttribute("finalScore") %></div>
        
        <a href="quiz.jsp" class="btn-retry">Try Another Time?</a>
    </div>
</body>
</html>