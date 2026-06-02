<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--
  Created by IntelliJ IDEA.
  User: natha
  Date: 19.05.2026
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Ajouter une station</title>
</head>
<body>
    <jsp:include page="../tags/header.jsp" />

    <main>
        <c:if test="${not empty sessionScope.success}">
            <p>${sessionScope.success}</p>
            <c:remove var="success" scope="session"/>
        </c:if>
        <c:if test="${not empty sessionScope.error}">
            <p>${sessionScope.error}</p>
            <c:remove var="error" scope="session"/>
        </c:if>
        <h1>Ajouter une station</h1>
        <form action="${pageContext.request.contextPath}/ajout-meteo" method="post">
            <div>
                <label for="champ1">Latitude</label>
                <input type="text" id="champ1" name="champ1" required>
            </div>
            <div>
                <label for="champ2">longitude</label>
                <input type="text" id="champ2" name="champ2" required>
            </div>
            <button type="submit">Ajouter</button>
        </form>
    </main>
    <jsp:include page="../tags/footer.jsp" />
</body>
</html>
