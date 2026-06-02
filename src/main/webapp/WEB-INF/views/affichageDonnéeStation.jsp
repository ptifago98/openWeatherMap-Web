<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: natha
  Date: 26.05.2026
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Affichage des données d'une station</title>
</head>
<body>
  <jsp:include page="../tags/header.jsp" />

    <main>
      <p>
        <a href="${pageContext.request.contextPath}/stations">← Retour à la liste</a>
      </p>

      <c:choose>
        <c:when test="${not empty error}">
          <p class="error">${error}</p>
        </c:when>
        <c:otherwise>
          <h1>${station.nom}</h1>
          <p>
            <strong>Pays :</strong> ${station.pays.name} (${station.pays.code})<br>
            <strong>Latitude :</strong> ${station.latitude}<br>
            <strong>Longitude :</strong> ${station.longitude}<br>
            <strong>Fuseau horaire :</strong> +${station.timeZone / 3600}
          </p>

          <h2>Données météo</h2>
          <c:choose>
            <c:when test="${empty station.weatherMap}">
              <p>Aucune donnée météo pour cette station.</p>
            </c:when>
            <c:otherwise>
              <table>
                <thead>
                <tr>
                  <th>Date</th>
                  <th>Description</th>
                  <th>Température (°C)</th>
                  <th>Tempéarture ressentie(°C)</th>
                  <th>Pression</th>
                  <th>Humidité (%)</th>
                  <th>Vitesse du vent </th>
                  <th>Orientation du vent</th>


                </tr>
                </thead>
                <tbody>
                <c:forEach var="entry" items="${station.weatherMap}">
                  <c:set var="m" value="${entry.value}" />
                  <tr>
                    <td>${m.date}</td>
                    <td>${m.description}</td>
                    <td>${m.temperature}</td>
                    <td>${m.temperatureRessentie}</td>
                    <td>${m.pression}</td>
                    <td>${m.humidite}</td>
                    <td>${m.ventVitesse}</td>
                    <td>${m.ventOrientation}</td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </c:otherwise>
          </c:choose>
        </c:otherwise>
      </c:choose>
    </main>
  <jsp:include page="../tags/footer.jsp" />
</body>
</html>
