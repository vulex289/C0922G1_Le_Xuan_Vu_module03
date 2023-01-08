package Repository.impl;

import Repository.BaseRepository;
import Repository.IRentTypeRepository;
import model.RentType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepository implements IRentTypeRepository {
    private static final String SELECT_ALL_RENT_TYPE="select * from rent_type";
    @Override
    public List<RentType> findAll() {
        List<RentType> rentTypeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_RENT_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int rentTypeId = resultSet.getInt("rent_type_id");
                String rentTypeName= resultSet.getString("name");
                RentType rentType = new RentType(rentTypeId,rentTypeName);
                rentTypeList.add(rentType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentTypeList;
    }
}
