package ch.hearc.ig.scl.openweathermapweb;

import ch.hearc.ig.scl.service.IOWMManager;
import ch.hearc.ig.scl.service.OWMManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/refresh-station")
public class RefreshStationServlet extends HttpServlet {

    IOWMManager OWMmanager = new OWMManager();
    private boolean success;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id");
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        if (id == null || id.isBlank()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("{\"success\": false, \"message\": \"ID manquant\"}");
            return;
        }

        try {
            boolean success = OWMmanager.refreshDataForOneStation(id);
            if(success){
                resp.setStatus(HttpServletResponse.SC_OK);
                resp.getWriter().write("{\"success\": true, \"message\": \"Données rafraîchies avec succès\"}");
            }else{
                resp.setStatus(HttpServletResponse.SC_OK);
                resp.getWriter().write("{\"success\": false, \"message\": \"Échec du rafraîchissement\"}");
            }

        } catch (Exception e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("{\"success\": false, \"message\": \"Erreur serveur : " + e.getMessage() + "\"}");
        }
    }
}
