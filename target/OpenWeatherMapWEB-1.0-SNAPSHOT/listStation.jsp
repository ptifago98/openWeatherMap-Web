<%@ page import="ch.hearc.ig.scl.business.StationMeteo" %>
<%@ page import="java.util.List" %>
<%@ page import="ch.hearc.ig.scl.service.OWMManager" %>
<%@ page import="ch.hearc.ig.scl.service.IOWMManager" %><%--
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
    <div>
        <jsp:include page="WEB-INF/tags/header.jsp" />
    </div>
</head>
<body>
<h1>Liste des stations</h1>
<div>
    <%!IOWMManager manager = new OWMManager();%>
    <%!List<StationMeteo> stations = manager.getStations(); %>

    <table>
        <thead>
            <th>Nom</th>
            <th>Pays</th>
            <th>Code du pays</th>
            <th>latitude</th>
            <th>longitude</th>
            <th>Fuseau horaire</th>
        </thead>$
        <tbody>
            <% for(StationMeteo s : stations){%>
            <% Integer timeZone = s.getTimeZone()/3600;%>
            <tr>
                <td><%=s.getNom()%></td>
                <td><%=s.getPays().getName()%></td>
                <td><%=s.getPays().getCode()%></td>
                <td><%=s.getLatitude()%></td>
                <td><%=s.getLongitude()%></td>
                <td>+<%=timeZone%></td>
            </tr>
            <% } %>
        </tbody>


    </table>

</div>

</body>
</html>

