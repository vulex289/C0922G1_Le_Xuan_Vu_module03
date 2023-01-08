package Service.impl;

import Repository.IFacilityRepository;
import Repository.impl.FacilityRepository;
import Service.IFacilityService;
import model.Facility;

import java.util.List;

public class FacilityService implements IFacilityService {
    IFacilityRepository facilityRepository = new FacilityRepository();
    @Override
    public List<Facility> findAll() {
        return facilityRepository.findAll();
    }

    @Override
    public Facility findById(int id) {
        return facilityRepository.findById(id);
    }

    @Override
    public boolean deleteFacility(int id) {
        return facilityRepository.deleteFacility(id);
    }

    @Override
    public boolean insertFacility(Facility facility) {
        return facilityRepository.insertFacility(facility);
    }

    @Override
    public boolean updateFacility(Facility facility) {
        return facilityRepository.updateFacility(facility);
    }

    @Override
    public List<Facility> searchByName(String name, int rentTypeId1, int facilityTypeId1) {
        return facilityRepository.searchByName(name,rentTypeId1,facilityTypeId1);
    }
}
