package ch.hearc.ig.scl.service;

import ch.hearc.ig.scl.business.StationMeteo;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;



public interface IOWMManager{
    boolean insertAll(Double lat, Double lon);
    List<StationMeteo> getStations();
    StationMeteo getMeteo(String idStation);
    boolean refreshData();
    boolean refreshDataForOneStation(String idStation);


}
