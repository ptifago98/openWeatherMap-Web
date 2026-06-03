# Project openWeatherMap-Web
Projet de composant logiciel de OWM utilisant JSP et Servlet

## Paramètres du SDK
java version 25


## Description

Cette application Java permet de :

1. Saisir une **latitude** et une **longitude**, appeler une **API météo**, désérialiser les données JSON, récupérer les informations d'un **pays** via un service web et pour finir insérer ces données dans la base.
2. Afficher la liste des stations dans la base de données.
3. Afficher une station enregistrée et ses données météo
4. Rafraichir toutes les données météo des stations enregistrées.
5. Rafraichir les données d'une station.

Le projet utilise **Maven** pour la gestion des dépendances.

La structure de données correspondant au projet se trouve dans le fichier **main/resources/OWM.sql**.

---


# Structure du projet

## openWeatherMap-Web 
```
src
├── main
    ├── java
    │   └── ch.hearc.ig.scl      
    │       ├── business
    │       │   ├── Meteo.java
    │       │   ├── Pays.java
    │       │   └── StationMeteo.java
    │       │
    |       ├── deserializer
    │       │   ├── MeteoDeserializer
    │       │   ├── PaysDeserializer
    │       │   └── StationMeteoDeserializer
    │       │
    │       ├── openweathermap
    │       │   ├── Accueil
    │       │   ├── AjoutMeteo
    │       │   ├── ConsulterStations
    │       │   ├── HelloServlet
    │       │   ├── RefreshAllDataServlet
    │       │   ├── RefreshStationServlet
    │       │   └── StationsServlet
    │       │
    │       ├── persistence
    │       │   └── DBConnection.java
    │       │
    │       ├── repository
    │       │   ├── MeteoRepository.java
    │       │   ├── PaysRepository.java
    │       │   └── StationRepository.java
    │       │
    │       ├── service
    │       │   ├── ApiCallService.java
    │       │   ├── ApiCallPaysService.java
    │       │   ├── IOWMManager.java
    │       │   ├── OWMManager.java
    │       │
    │       └── tools
    │           ├── EnvProperties.java
    │           └── Log.java
    │
    └── resources
    │   ├── env
    │   └── OWM.sql
    │
    └── webapp
        ├── css
        │   └── style.css
        ├── WEB-INF
        │   ├── tags
        │   │    ├── footer.jsp
        │   │    └── header.jsp
        │   ├── views 
        │   │    ├── affichageDonnéeStation.jsp
        │   │    ├── ajouterMeteo.jsp
        │   │    └── listeStation.jsp
        │   └── web.xml
        └── index.jsp

```
---

# Configuration du projet

Avant d'exécuter l'application, il faut compléter le fichier .env contenant les paramètres suivants :

```
USER=
PASSWORD=
HOST=
PORT=
SID=

APIKEY=
```

### Paramètres de base de données

| Paramètre | Description                             |
| --------- | --------------------------------------- |
| USER      | Nom d'utilisateur de la base de données |
| PASSWORD  | Mot de passe de la base                 |
| HOST      | Adresse du serveur de base de données   |
| PORT      | Port de connexion                       |
| SID       | Identifiant de la base Oracle           |

### Clé API météo

| Paramètre | Description            |
| --------- | ---------------------- |
| APIKEY    | Clé API OpenWeatherMap |

**Il faut avoir installer Tomcat11 et configuré le projet**  
**Il faut également exécuter le script SQL dans le fichier OWM.sql**
---

# Exécution
1. Ouvrir le dossier openWeatherMap-Web dans IntelliJ
2. Lancer l'application.
3. Une fenêtre s'ouvre dans le navigateur. 

<img width="1919" height="911" alt="image" src="https://github.com/user-attachments/assets/513e45fe-6381-4071-8e8f-ab1e4302d054" />

**Cliquer sur "Accéder aux stations" permet d'accéder à la liste des stations, c'est la page principale.**
<img width="1918" height="870" alt="image" src="https://github.com/user-attachments/assets/c5a13322-7f15-4662-bd9c-c01ff1260ac7" />

**Cliquer sur "voir" permet de consulter toutes les données de la station sélectionnée.**
<img width="1919" height="913" alt="image" src="https://github.com/user-attachments/assets/f0b407bc-7aa6-4656-beb9-1af2a36eed85" />

**Cliquer sur "Rafraîchir" sur la ligne permet de mettre à jour les données météos de la station sélectionnée.**
<img width="1919" height="911" alt="image" src="https://github.com/user-attachments/assets/c3c1e785-609f-43b5-8310-1238f4cff1f7" />

**Cliquer sur "Rafraîchir tout" permet de mettre à jour les données météos de toutes les stations."**
<img width="1919" height="911" alt="image" src="https://github.com/user-attachments/assets/8915b05b-4e3d-4416-8962-86f4f272117d" />

**Cliquer "Ajouter une station" permet d'ajouter une station."**
Exemple :  
Entrer une latitude : 46.99  
Entrer une longitude : 6.93  
<img width="1919" height="906" alt="image" src="https://github.com/user-attachments/assets/fa8eb0b0-81bc-4768-86ef-45a05d8e98f8" />

---

# Auteurs

Projet réalisé par Nathan Favre
