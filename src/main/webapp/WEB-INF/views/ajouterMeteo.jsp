<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter une station</title>
</head>
<body>
<jsp:include page="../tags/header.jsp" />

<main class="container">
    <a href="${pageContext.request.contextPath}/stations" class="back-link mb-3 d-inline-block">
        Retour à la liste
    </a>

    <div class="row justify-content-center mt-3">
        <div class="col-md-8 col-lg-6">
            <div class="card-clean">
                <h1 class="page-title">Ajouter une station</h1>
                <p class="page-subtitle">Renseignez les coordonnées géographiques de la nouvelle station.</p>

                <c:if test="${not empty sessionScope.success}">
                    <div class="alert-clean-success mb-3">${sessionScope.success}</div>
                    <c:remove var="success" scope="session"/>
                </c:if>
                <c:if test="${not empty sessionScope.error}">
                    <div class="alert-clean-error mb-3">${sessionScope.error}</div>
                    <c:remove var="error" scope="session"/>
                </c:if>

                <form action="${pageContext.request.contextPath}/ajout-meteo" method="post" class="form-clean">
                    <div class="mb-3">
                        <label for="champ1" class="form-label">Latitude</label>
                        <input type="number"
                               id="champ1"
                               name="champ1"
                               class="form-control"
                               min="-90"
                               max="90"
                               step="any"
                               placeholder="Ex: 46.5197"
                               required>
                        <small class="text-muted">Entre -90 et 90</small>
                    </div>
                    <div class="mb-4">
                        <label for="champ2" class="form-label">Longitude</label>
                        <input type="number"
                               id="champ2"
                               name="champ2"
                               class="form-control"
                               min="-180"
                               max="180"
                               step="any"
                               placeholder="Ex: 6.6323"
                               required>
                        <small class="text-muted">Entre -180 et 180</small>
                    </div>
                    <button type="submit" class="btn-primary-clean w-100">Ajouter la station</button>
                </form>
            </div>
        </div>
    </div>
</main>

<jsp:include page="../tags/footer.jsp" />
</body>
</html>