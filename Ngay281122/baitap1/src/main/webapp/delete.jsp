<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 11/28/2022
  Time: 10:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
  <style>
    a{
      text-decoration: none;
      color: black;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Delete Product</h1>
    <form action="${pageContext.request.contextPath}/ProductServlet?action=delete&id=${product.getId()}" method="post">
      <table class="table tab-pane">
        <tr>
          <th><label >Id: </label></th>
          <th><c:out value="${product.getId()}"/></th>
        </tr>
        <tr>
          <th><label >Name: </label></th>
          <th><c:out value="${product.getName()}"/></th>
        </tr>
        <tr>
          <th><label >Price: </label></th>
          <th><c:out value="${product.getPrice()}"/></th>
        </tr>
        <tr>
          <th><label >Origin: </label></th>
          <th><c:out value="${product.getOrigin()}"/></th>
        </tr>
        <tr>
          <td>
            <button type="submit">Delete</button>
          </td>
          <td>
            <button type="button"><a href="${pageContext.request.contextPath}/ProductServlet">Back</a></button>
          </td>
        </tr>
      </table>
    </form>
  </div>
</body>
</html>
