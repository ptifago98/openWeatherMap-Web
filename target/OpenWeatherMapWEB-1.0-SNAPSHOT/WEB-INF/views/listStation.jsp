<%@ page import="ch.hearc.ig.scl.business.StationMeteo" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--
  Created by IntelliJ IDEA.
  User: natha
  Date: 19.05.2026
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Liste des stations</title>
</head>
<body>
    <jsp:include page="../tags/header.jsp" />
    <input type="button" name="ajoutStation"><a href="${pageContext.request.contextPath}/ajout-meteo">Ajouter des stations</a></input>
    <main>
        <h1>Liste des stations</h1>
        <table>
            <thead>
                <tr>
                    <th>Nom</th>
                    <th>Pays</th>
                    <th>Code du pays</th>
                    <th>latitude</th>
                    <th>longitude</th>
                    <th>Fuseau horaire</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var = "s" items="${stations}">
            <tr>
                <td>${s.nom}</td>
                <td>${s.pays.name}</td>
                <td>${s.pays.code}</td>
                <td>${s.latitude}</td>
                <td>${s.longitude}</td>
                <td>+${s.timeZone / 3600}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/affichage-données?id=${s.idStation}">Voir données météos</a>
                </td>
                <td>
                    <button onclick="refreshStation('${s.idStation}', this)">Rafraîchir</button>
                </td>
            </tr>
            </c:forEach>
            </tbody>


        </table>
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
                    if (data.success) {
                        btn.textContent = '✓ ' + data.message;
                        btn.style.color = 'green';
                    } else {
                        btn.textContent = '✗ ' + data.message;
                        btn.style.color = 'red';
                        btn.disabled = false;
                    }
                })
                .catch(err => {
                    console.error(err);
                    btn.textContent = 'Erreur réseau';
                    btn.style.color = 'red';
                    btn.disabled = false;
                });
        }
    </script>
</body>


</html>

