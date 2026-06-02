package ch.hearc.ig.scl.openweathermapweb;


import ch.hearc.ig.scl.service.IOWMManager;
import ch.hearc.ig.scl.service.OWMManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "ajouterMeteo", value = "/ajout-meteo")
public class AjouterMeteo extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/ajouterMeteo.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{

        HttpSession message = req.getSession();

        try {
            Double latitude = Double.parseDouble(req.getParameter("champ1"));
            Double longitude = Double.parseDouble(req.getParameter("champ2"));

            IOWMManager OWMmanager = new OWMManager();

            if (OWMmanager.insertAll(latitude, longitude)) {
                message.setAttribute("success", "Insértion réussie!");
            } else {
                message.setAttribute("error", "Insértion impossible");
            }
        }catch (NumberFormatException e){
            message.setAttribute("error", "Latitude et longitude doivent être des nombres.");
        }
        resp.sendRedirect(req.getContextPath() + "/ajout-meteo");

    }







}
