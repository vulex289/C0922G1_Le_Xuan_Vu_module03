package Service.impl;

import Repository.IRentTypeRepository;
import Repository.impl.RentTypeRepository;
import Service.IRentTypeService;
import model.RentType;

import java.util.List;

public class RentTypeService implements IRentTypeService {
    IRentTypeRepository rentTypeRepository = new RentTypeRepository();
    @Override
    public List<RentType> findAll() {
        return rentTypeRepository.findAll();
    }
}
