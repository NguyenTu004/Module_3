<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h2>Currency Converter</h2>
<form action="converter" method="post">
    <label>Rate: </label><br>
    <input type="text" name="rate" placeholder="RATE" value="22000"><br>
    <label>USD: </label><br>
    <input type="text" name="usd" placeholder="USD" ><br>
    <input type="submit" id="submit" value="Converter">
</form>
</body>
</html>