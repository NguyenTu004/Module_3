<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 11/28/2022
  Time: 9:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
          crossorigin="anonymous"></script>
  <style>
    a{
      text-decoration: none;
      color: black;
    }
  </style>
</head>
<body>
  <div class="container">
    <form  action="${pageContext.request.contextPath}/ProductServlet?action=add" method="post">
      <h1>Add Product</h1>
      <table class="table tab-pane">
        <tr>
          <th>Name: </th>
          <td><input type="text" name="name" id="name"></td>
        </tr>
        <tr>
          <th>Price: </th>
          <td><input type="number" name="price" id="price"></td>
        </tr>
        <tr>
          <th>Origin: </th>
          <td>
            <label>
              <select name="origin">
                <c:forEach items="${listOrigin}" var="o">
                <option value="${o.getName()}"><c:out value="${o.getName()}"/></option>
                </c:forEach>
              </select>
            </label>
          </td>
        </tr>
        <tr>
          <td>
            <button type="submit">Add</button>
          </td>
          <td>
            <button><a href="${pageContext.request.contextPath}/ProductServlet">Back</a></button>
         </td>
        </tr>
      </table>
    </form>
  </div>
</body>
</html>
