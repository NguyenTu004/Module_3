<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 11/28/2022
  Time: 8:29 PM
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
        .form{
            height: 30px;
            width: 70px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>List Product</h1>
    <form action=""><button><a href="${pageContext.request.contextPath}/ProductServlet?action=add">Add</a></button></form>
    <table class="table table-striped">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Price</th>
            <th>Origin</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${products}" var="product">
            <tr>
                <td><c:out value="${product.getId()}"/></td>
                <td><c:out value="${product.getName()}"/></td>
                <td><c:out value="${product.getPrice()}"/></td>
                <td><c:out value="${product.getOrigin()}"/></td>
                <td>
                    <a style="float: left;margin: 10px;" href="${pageContext.request.contextPath}
                    /ProductServlet?action=delete&id=${product.getId()}" >
                        <button class="form" type="submit">Delete</button>
                    </a>
                    <a style="float: left;margin: 10px;" href="${pageContext.request.contextPath}
                    /ProductServlet?action=update&id=${product.getId()}" >
                        <button class="form" type="submit">Update</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
