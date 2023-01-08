package Repository;

import model.FacilityType;

import java.util.List;

public interface IFacilityTypeRepository {
    List<FacilityType> findAll();
}
