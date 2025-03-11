<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
    /* Internal CSS for the home page */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f8f9fa; /* Light background color */
    }

    h1 {
        text-align: center;
        color: black;
        background-color: yellow;
        margin: 0;
        padding: 20px;
    }

    .faq-container {
        padding: 20px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        margin: 20px auto;
        max-width: 800px;
    }

    .faq-container h2 {
        text-align: center;
        color: black;
        margin-bottom: 20px;
    }

    .faq-item {
        margin-bottom: 15px;
   3 {
        color: yellow;
        background-color: black;
        padding: 10px;
        border-radius: 5px;
    }

    .faq-item p {
        padding: 10px;
        background-color: #f8f9fa;
        border-radius: 5px;
    }

    .image-container {
        position: relative;
        text-align: center;
    }

    .background-image {
        width: 100%; /* Make main image fit the screen width */
        height: auto;
        display: block;
    }

    .overlay {
        position: absolute;
        top: 40%; /* Adjusted to move text higher */
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: rgba(0, 0, 0, 0.7); /* Black rectangle with some transparency */
        padding: 20px;
        border-radius: 10px;
        text-align: center;
    }

    .overlay a {
        display: inline-block;
        background-color: yellow;
        color: black;
        padding: 10px 20px;
        text-decoration: none;
        font-size: 18px;
        border-radius: 5px;
        margin-top: 10px;
    }

    .overlay a:hover {
        background-color: black;
        color: yellow;
    }

    .vehicles-image {
        width: 100%; /* Make vehicle image fit the screen width */
        height: auto;
        display: block;
    }
</style>
</head>
<body>

    <%@ include file="navBar.jsp" %>
    <div class="faq-container">
        <h2>FAQs</h2>
        
        <div class="faq-item">
            <h3>1. Do I need to pay in advance?</h3>
            <p>No, pay as you go. You can pay after the journey ends.</p>
        </div>

        <div class="faq-item">
            <h3>2. Can I cancel my booking?</h3>
            <p>Yes, you can cancel your booking up to 30 minutes before your ride without any charges by prior notice with a phone call.</p>
        </div>

        <div class="faq-item">
            <h3>3. What payment methods are accepted?</h3>
            <p>We accept cash, credit/debit cards, and digital wallets.</p>
        </div>

        <div class="faq-item">
            <h3>4. Are there any additional charges?</h3>
            <p>No hidden charges! The fare you see is the final price.</p>
        </div>

        <div class="faq-item">
            <h3>5. How do I contact customer support?</h3>
            <p>You can reach us via our hotline or email us at support@megacitycab.com.</p>
        </div>

        <div class="faq-item">
            <h3>6. Can I request a specific driver?</h3>
            <p>Yes, if your preferred driver is available, we can arrange that for you.</p>
        </div>
    </div>
   

</body>
</html>