<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OpenWeatherMap</title>
</head>
<body>
<jsp:include page="WEB-INF/tags/header.jsp" />

<main class="container">
    <div class="text-center mb-4">
        <h1 class="page-title">OpenWeatherMap</h1>
        <p class="page-subtitle">Une plateforme, cinq fonctionnalités pour gérer vos stations météo.</p>
    </div>

    <div class="orbit-container">
        <!-- Bouton central -->
        <a href="${pageContext.request.contextPath}/stations" class="orbit-center">
            Accéder<br>aux stations
        </a>

        <!-- Cartes en orbite -->
        <div class="orbit-card orbit-pos-1">
            <h3>Ajouter une donnée</h3>
            <p>Insérer une nouvelle donnée météo dans la base.</p>
        </div>
        <div class="orbit-card orbit-pos-2">
            <h3>Liste des stations</h3>
            <p>Consulter l'ensemble des stations enregistrées.</p>
        </div>
        <div class="orbit-card orbit-pos-3">
            <h3>Détails d'une station</h3>
            <p>Afficher une station et toutes ses mesures.</p>
        </div>
        <div class="orbit-card orbit-pos-4">
            <h3>Rafraîchir une station</h3>
            <p>Mettre à jour les données d'une seule station.</p>
        </div>
        <div class="orbit-card orbit-pos-5">
            <h3>Rafraîchir toutes les stations</h3>
            <p>Mettre à jour les données de l'ensemble du parc.</p>
        </div>
    </div>
</main>

<jsp:include page="WEB-INF/tags/footer.jsp" />
</body>
</html>