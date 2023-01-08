package Repository;

import model.RentType;

import java.util.List;

public interface IRentTypeRepository {
    List<RentType> findAll();

}
