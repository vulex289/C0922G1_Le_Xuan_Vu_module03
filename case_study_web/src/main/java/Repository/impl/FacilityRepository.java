package Repository.impl;

import Repository.BaseRepository;
import Repository.IFacilityRepository;
import model.Facility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private static final String SELECT_ALL="select * from facility";
    private static final String DELETE_FACILITY="delete from facility where facility_id=?";
    private static final String FIND_FACILITY_BY_ID="select * from facility where facility_id=?";
    private static final String UPDATE_FACILITY=" update facility set `name`=?,area=?,cost=?,max_people=?,rent_type_id=?,facility_type_id=?,standard_room=?,description_other_convenience=?,pool_area=?,number_of_floors=?,facility_free=?;";
    private static final String SEARCH_FACILITY_BY="select * from facility f\n" +
            " join facility_type ft on f.facility_type_id = ft.facility_type_id\n" +
            " join rent_type r on f.rent_type_id = r.rent_type_id\n" +
            " where f.`name` like ? and r.rent_type_id = ? and ft.facility_type_id =?; ";
    private static final String INSERT_FACILITY="insert into facility(`name`,area,cost,max_people,rent_type_id,facility_type_id,standard_room,\n" +
            "description_other_convenience,pool_area,number_of_floors,facility_free)values\n" +
            "(?,?,?,?,?,?,?,?,?,?,?)";
    @Override
    public List<Facility> findAll() {
        List<Facility> facilityList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int facilityId= resultSet.getInt("facility_id");
                String facilityName = resultSet.getString("name");
                int area= resultSet.getInt("area");
                double cost= resultSet.getDouble("cost");
                int maxPeople = resultSet.getInt("max_people");
                int rentTypeId = resultSet.getInt("rent_type_id");
                int facilityTypeId = resultSet.getInt("facility_type_id");
                String standRoom = resultSet.getString("standard_room");
                String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                double pool_area= resultSet.getDouble("pool_area");
                int numberOfFloors = resultSet.getInt("number_of_floors");
                String facilityFree = resultSet.getString("facility_free");
                Facility facility = new Facility(facilityId,facilityName,area,cost,maxPeople,rentTypeId,facilityTypeId,standRoom,descriptionOtherConvenience,pool_area,numberOfFloors,facilityFree);
                facilityList.add(facility);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityList;
    }

    @Override
    public Facility findById(int id) {
        Facility facility =null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_FACILITY_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int facilityId= resultSet.getInt("facility_id");
                String facilityName = resultSet.getString("name");
                int area= resultSet.getInt("area");
                double cost= resultSet.getDouble("cost");
                int maxPeople = resultSet.getInt("max_people");
                int rentTypeId = resultSet.getInt("rent_type_id");
                int facilityTypeId = resultSet.getInt("facility_type_id");
                String standRoom = resultSet.getString("standard_room");
                String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                double pool_area= resultSet.getDouble("pool_area");
                int numberOfFloors = resultSet.getInt("number_of_floors");
                String facilityFree = resultSet.getString("facility_free");
                 facility = new Facility(facilityId,facilityName,area,cost,maxPeople,rentTypeId,facilityTypeId,standRoom,descriptionOtherConvenience,pool_area,numberOfFloors,facilityFree);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facility;
    }

    @Override
    public boolean deleteFacility(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_FACILITY);
            preparedStatement.setInt(1,id);
           return preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean insertFacility(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_FACILITY);
            preparedStatement.setString(1,facility.getFacilityName());
            preparedStatement.setInt(2,facility.getArea());
            preparedStatement.setDouble(3,facility.getCost());
            preparedStatement.setInt(4,facility.getMaxPeople());
            preparedStatement.setInt(5,facility.getRentTypeId());
            preparedStatement.setInt(6,facility.getFacilityTypeId());
            preparedStatement.setString(7,facility.getStandardRoom());
            preparedStatement.setString(8,facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(9,facility.getPoolArea());
            preparedStatement.setInt(10,facility.getNumberOfFloors());
            preparedStatement.setString(11,facility.getFacilityFree());
          return preparedStatement.executeUpdate() >0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean updateFacility(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_FACILITY);
            preparedStatement.setString(1,facility.getFacilityName());
            preparedStatement.setInt(2,facility.getArea());
            preparedStatement.setDouble(3,facility.getCost());
            preparedStatement.setInt(4,facility.getMaxPeople());
            preparedStatement.setInt(5,facility.getRentTypeId());
            preparedStatement.setInt(6,facility.getFacilityTypeId());
            preparedStatement.setString(7,facility.getStandardRoom());
            preparedStatement.setString(8,facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(9,facility.getPoolArea());
            preparedStatement.setInt(10,facility.getNumberOfFloors());
            preparedStatement.setString(11,facility.getFacilityFree());
            return preparedStatement.executeUpdate() >0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Facility> searchByName(String name, int rentTypeId1, int facilityTypeId1) {
        List<Facility>facilityList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_FACILITY_BY);
            preparedStatement.setString(1,"%"+name+"%");
            preparedStatement.setInt(2, rentTypeId1);
            preparedStatement.setInt(3, facilityTypeId1);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int facilityId= resultSet.getInt("facility_id");
                String facilityName = resultSet.getString("name");
                int area= resultSet.getInt("area");
                double cost= resultSet.getDouble("cost");
                int maxPeople = resultSet.getInt("max_people");
                int rentTypeId = resultSet.getInt("rent_type_id");
                int facilityTypeId = resultSet.getInt("facility_type_id");
                String standRoom = resultSet.getString("standard_room");
                String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                double pool_area= resultSet.getDouble("pool_area");
                int numberOfFloors = resultSet.getInt("number_of_floors");
                String facilityFree = resultSet.getString("facility_free");
                Facility facility = new Facility(facilityId,facilityName,area,cost,maxPeople,rentTypeId,facilityTypeId,standRoom,descriptionOtherConvenience,pool_area,numberOfFloors,facilityFree);
                facilityList.add(facility);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityList;
    }
}
