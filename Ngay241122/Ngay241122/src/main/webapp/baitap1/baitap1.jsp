<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 11/24/2022
  Time: 10:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <tr>
        <th>Ten</th>
        <th>Ngay Sinh</th>
        <th>Dia chi</th>
        <th>Anh</th>
    </tr>
     <c:if test="${userList}" != null>
    <c:forEach items="${userList}" var="u">
        <tr>
            <td><c:out value="${u.getName()}"/></td>
            <td><c:out value="${u.getDate()}"/></td>
            <td><c:out value="${u.getAddress()}"/></td>
            <td><img src="<c:out value="${u.getImg()}"/>" ></td>
        </tr>
    </c:forEach>

     </c:if>
</table>
</body>
</html>
