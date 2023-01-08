package Repository;

import model.Facility;

import java.util.List;

public interface IFacilityRepository {
    List<Facility> findAll();
    Facility findById(int id);
    boolean deleteFacility(int id);
    boolean insertFacility(Facility facility);
    boolean updateFacility(Facility facility);
    List<Facility>searchByName(String name, int rentTypeId1, int facilityTypeId1);
}