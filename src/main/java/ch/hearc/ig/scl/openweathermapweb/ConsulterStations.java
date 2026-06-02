package ch.hearc.ig.scl.openweathermapweb;

import ch.hearc.ig.scl.business.StationMeteo;
import ch.hearc.ig.scl.service.IOWMManager;
import ch.hearc.ig.scl.service.OWMManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "consulterStations", value = "/affichage-données")
public class ConsulterStations extends HttpServlet {
    private IOWMManager manager;

    @Override
    public void init() {
        manager = new OWMManager();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id");

        if (id == null || id.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/stations");
            return;
        }
        StationMeteo station = manager.getMeteo(id);

        if (station == null) {
            req.setAttribute("error", "Station introuvable");
            req.getRequestDispatcher("/WEB-INF/views/affichageDonnees.jsp")
                    .forward(req, resp);
            return;
        }

        req.setAttribute("station", station);
        req.getRequestDispatcher("/WEB-INF/views/affichageDonnéeStation.jsp")
                .forward(req, resp);
    }





}
