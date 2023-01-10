package Service.impl;

import Repository.IFacilityRepository;
import Repository.impl.FacilityRepository;
import Service.IFacilityService;
import model.Facility;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class FacilityService implements IFacilityService {
    private final static String REGEX_NAME_FACILITY = "^[A-Z][a-z-0-9]{1,}$";
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
//        Map<String,String> mapFacility = new HashMap<>();
//        if (!checkInput(facility.getFacilityName(), REGEX_NAME_FACILITY)){
//            mapFacility.put("name","Chưa đúng định dạng");
//        }
//        if(mapFacility.isEmpty()){
           return facilityRepository.insertFacility(facility);
//        };
    }
    boolean checkInput(String value,String regex){
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(value);
        return matcher.matches();
    }


    @Override
    public boolean updateFacility(Facility facility) {
        return facilityRepository.updateFacility(facility);
    }

    @Override
    public List<Facility> searchByName(String name,String rentTypeName, String facilityTypeName) {
        return facilityRepository.searchByName(name,rentTypeName,facilityTypeName);
    }
}
