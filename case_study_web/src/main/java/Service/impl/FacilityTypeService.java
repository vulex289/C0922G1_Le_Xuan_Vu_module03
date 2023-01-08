package Service.impl;

import Repository.IFacilityTypeRepository;
import Repository.impl.FacilityTypeRepository;
import Service.IFacilityTypeService;
import model.FacilityType;

import java.util.List;

public class FacilityTypeService implements IFacilityTypeService {
    IFacilityTypeRepository facilityTypeRepository = new FacilityTypeRepository();
    @Override
    public List<FacilityType> findAll() {
        return facilityTypeRepository.findAll();
    }
}
