package Service;

import model.Facility;

import java.util.List;
import java.util.Map;

public interface IFacilityService {
    List<Facility> findAll();
    Facility findById(int id);
    boolean deleteFacility(int id);
    boolean insertFacility(Facility facility);
    boolean updateFacility(Facility facility);
    List<Facility>searchByName(String name,String rentType, String facilityTypeName);
}
