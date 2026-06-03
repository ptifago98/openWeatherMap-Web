<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Détails de la station</title>
</head>
<body>
<jsp:include page="../tags/header.jsp" />

<main class="container">
  <a href="${pageContext.request.contextPath}/stations" class="back-link mb-3 d-inline-block">
    Retour à la liste
  </a>

  <c:choose>
    <c:when test="${not empty error}">
      <div class="alert-clean-error mt-3">${error}</div>
    </c:when>
    <c:otherwise>
      <div class="card-clean mb-4 mt-3">
        <h1 class="page-title mb-4">${station.nom}</h1>
        <div class="row g-4">
          <div class="col-sm-6 col-md-3">
            <div class="detail-item">
              <div class="detail-label">Pays</div>
              <div class="detail-value">${station.pays.name} (${station.pays.code})</div>
            </div>
          </div>
          <div class="col-sm-6 col-md-3">
            <div class="detail-item">
              <div class="detail-label">Latitude</div>
              <div class="detail-value">${station.latitude}</div>
            </div>
          </div>
          <div class="col-sm-6 col-md-3">
            <div class="detail-item">
              <div class="detail-label">Longitude</div>
              <div class="detail-value">${station.longitude}</div>
            </div>
          </div>
          <div class="col-sm-6 col-md-3">
            <div class="detail-item">
              <div class="detail-label">Fuseau horaire</div>
              <div class="detail-value">UTC+${station.timeZone / 3600}</div>
            </div>
          </div>
        </div>
      </div>

      <h2 class="section-title">Données météo</h2>
      <c:choose>
        <c:when test="${empty station.weatherMap}">
          <div class="card-clean text-center">
            <p class="mb-0" style="color: var(--gray-500);">Aucune donnée météo pour cette station.</p>
          </div>
        </c:when>
        <c:otherwise>
          <div class="table-responsive-clean">
            <table class="table table-clean">
              <thead>
              <tr>
                <th>Date</th>
                <th>Description</th>
                <th>Temp. (°C)</th>
                <th>Ressenti (°C)</th>
                <th>Pression</th>
                <th>Humidité (%)</th>
                <th>Vent (vitesse)</th>
                <th>Vent (orient.)</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="entry" items="${station.weatherMap}">
                <c:set var="m" value="${entry.value}" />
                <tr>
                  <td>${m.date}</td>
                  <td>${m.description}</td>
                  <td><strong>${m.temperature}</strong></td>
                  <td>${m.temperatureRessentie}</td>
                  <td>${m.pression}</td>
                  <td>${m.humidite}</td>
                  <td>${m.ventVitesse}</td>
                  <td>${m.ventOrientation}</td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </c:otherwise>
      </c:choose>
    </c:otherwise>
  </c:choose>
</main>

<jsp:include page="../tags/footer.jsp" />
</body>
</html>