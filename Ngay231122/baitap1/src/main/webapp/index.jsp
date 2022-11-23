<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h2>Product Discount Calculator</h2>
<form action="discount" method="post">
    <label>Product Description: </label><br>
    <input type="text" name="description" placeholder="name....."><br>
    <label>List Price: </label><br>
    <input type="number" name="list_price" placeholder="10000"><br>
    <label>Discount Percent: </label><br>
    <input type="number" name="discount_percent" placeholder="67"><br>
    <input type="submit" id="sunmit" value="Calculate Discount"><br>
</form>
</body>
</html>