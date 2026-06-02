package ch.hearc.ig.scl.openweathermapweb;


import ch.hearc.ig.scl.service.IOWMManager;
import ch.hearc.ig.scl.service.OWMManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "refreshAllStations", value = "/refresh-all-stations")
public class RefreshAllDataServlet extends HttpServlet {

    IOWMManager OWMmanager = new OWMManager();
    private boolean success;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        try {
            boolean success = OWMmanager.refreshData();
            if(success){
                resp.setStatus(HttpServletResponse.SC_OK);
                resp.getWriter().write("{\"success\": true, \"message\": \"Données rafraîchies avec succès !\"}");
            }else{
                resp.setStatus(HttpServletResponse.SC_OK);
                resp.getWriter().write("{\"success\": false, \"message\": \"toutes Les données sont à jour.\"}");
            }

        } catch (Exception e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("{\"success\": false, \"message\": \"Erreur serveur : " + e.getMessage() + "\"}");
        }
    }


}
