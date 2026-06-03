<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des stations</title>
</head>
<body>
<jsp:include page="../tags/header.jsp" />

<main class="container">
    <div class="d-flex flex-wrap justify-content-between align-items-center mb-4 gap-2">
        <div>
            <h1 class="page-title mb-1">Stations</h1>
            <p class="page-subtitle mb-0">Liste de toutes les stations enregistrées.</p>
        </div>
        <div class="d-flex gap-2 flex-wrap">
            <a href="${pageContext.request.contextPath}/ajout-meteo" class="btn-secondary-clean">
                Ajouter une station
            </a>
            <button onclick="refreshAllStations(this)" class="btn-primary-clean">
                Rafraîchir tout
            </button>
        </div>
    </div>

    <div class="table-responsive-clean">
        <table class="table table-clean">
            <thead>
            <tr>
                <th>Nom</th>
                <th>Pays</th>
                <th>Code</th>
                <th>Latitude</th>
                <th>Longitude</th>
                <th>Fuseau</th>
                <th>Données</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="s" items="${stations}">
                <tr>
                    <td><strong>${s.nom}</strong></td>
                    <td>${s.pays.name}</td>
                    <td><span class="code-pill">${s.pays.code}</span></td>
                    <td>${s.latitude}</td>
                    <td>${s.longitude}</td>
                    <td>UTC+${s.timeZone / 3600}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/affichage-données?id=${s.idStation}" class="btn-secondary-clean btn-sm-clean">
                            Voir
                        </a>
                    </td>
                    <td>
                        <button onclick="refreshStation('${s.idStation}', this)" class="btn-primary-clean btn-sm-clean">
                            Rafraîchir
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<jsp:include page="../tags/footer.jsp" />

<script>
    function refreshStation(id, btn) {
        btn.disabled = true;
        btn.textContent = 'En cours...';

        fetch('${pageContext.request.contextPath}/refresh-station?id=' + id, {
            method: 'POST'
        })
            .then(response => response.json())
            .then(data => {
                btn.textContent = data.message;
                if (data.success) {
                    btn.classList.add('btn-success-state');
                } else {
                    btn.classList.add('btn-error-state');
                    btn.disabled = false;
                }
            })
            .catch(err => {
                console.error(err);
                btn.textContent = 'Erreur réseau';
                btn.classList.add('btn-error-state');
                btn.disabled = false;
            });
    }

    function refreshAllStations(btn) {
        btn.disabled = true;
        btn.textContent = 'En cours...';

        fetch('${pageContext.request.contextPath}/refresh-all-stations', {
            method: 'POST'
        })
            .then(response => response.json())
            .then(data => {
                btn.textContent = data.message;
                if (data.success) {
                    btn.classList.add('btn-success-state');
                } else {
                    btn.classList.add('btn-error-state');
                    btn.disabled = false;
                }
            })
            .catch(err => {
                console.error(err);
                btn.textContent = 'Erreur réseau';
                btn.classList.add('btn-error-state');
                btn.disabled = false;
            });
    }
</script>
</body>
</html>