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

@WebServlet(name = "stationsServlet", value = "/stations")
public class StationsServlet extends HttpServlet {
    private IOWMManager manager;

    @Override
    public void init(){
        manager = new OWMManager();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException{
        List<StationMeteo> stations = manager.getStations();
        request.setAttribute("stations", stations);
        request.getRequestDispatcher("/WEB-INF/views/listStation.jsp")
                .forward(request, response);


    }



}
