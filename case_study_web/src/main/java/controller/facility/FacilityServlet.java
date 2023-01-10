package controller.facility;

import Service.IFacilityService;
import Service.IFacilityTypeService;
import Service.IRentTypeService;
import Service.impl.FacilityService;
import Service.impl.FacilityTypeService;
import Service.impl.RentTypeService;
import model.Facility;
import model.FacilityType;
import model.RentType;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@WebServlet(name = "Servlet", value = "/facility")
public class FacilityServlet extends HttpServlet {
    IFacilityService facilityService = new FacilityService();
    IFacilityTypeService facilityTypeService = new FacilityTypeService();
    IRentTypeService rentTypeService = new RentTypeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                break;
            case "edit":
                showEditFacility(request,response);
                break;
            case "search":
                searchByName(request,response);
                break;
            default:
                showList(request, response);
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createFacility(request, response);
                break;
            case "edit":
                editFacility(request,response);
                break;
            case "delete":
                deleteFacility(request,response);
                break;
            default:
                showList(request,response);
                break;

        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Facility> facilityList = facilityService.findAll();
        List<FacilityType> facilityTypeList = facilityTypeService.findAll();
        List<RentType> rentTypeList = rentTypeService.findAll();
        request.setAttribute("facilityList", facilityList);
        request.setAttribute("facilityTypeList", facilityTypeList);
        request.setAttribute("rentTypeList", rentTypeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    private void createFacility(HttpServletRequest request, HttpServletResponse response) {
        String message = "Thanh Công";
        String facilityName = request.getParameter("facilityName");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facilityTypeId"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        String poolAreaString = request.getParameter("poolArea");
        double poolArea;
        if (Objects.equals(poolAreaString, "")){
                    poolArea = 0;
        }else {
            poolArea = Double.parseDouble(poolAreaString);
        }
        String numberOfFloorString = request.getParameter("numberOfFloors");
        int numberOfFloors;
        if(Objects.equals(numberOfFloorString, "")){
            numberOfFloors = 0;
        }else {
            numberOfFloors = Integer.parseInt(numberOfFloorString);
        }
        String facilityFree = request.getParameter("facilityFree");
        Facility facility = new Facility(facilityName, area, cost, maxPeople, rentTypeId, facilityTypeId, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
//        Map<String,String> mapFacility = facilityService.insertFacility(facility);
//        request.setAttribute("mapFacility",mapFacility);
        facilityService.insertFacility(facility);
      showList(request,response);
    }
    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        facilityService.deleteFacility(id);
        showList(request,response);
    }
    private void searchByName(HttpServletRequest request, HttpServletResponse response) {
    String name= request.getParameter("name");
    String rentTypeStr= request.getParameter("rentType");
//        if (Objects.equals(rentTypeStr, "Chọn kiểu thuê")){
//            rentTypeStr = "";
//        }
    String facilityTypeStr= request.getParameter("facilityType");
//    if (Objects.equals(facilityTypeStr, "Chọn loại dịch vụ")){
//        facilityTypeStr = "";
//    }
    List<Facility> facilityList=facilityService.searchByName(name,rentTypeStr,facilityTypeStr);
    List<FacilityType> facilityTypeList =facilityTypeService.findAll();
    List<RentType>rentTypeList=rentTypeService.findAll();
    request.setAttribute("facilityTypeList",facilityTypeList);
    request.setAttribute("rentTypeList",rentTypeList);
    request.setAttribute("facilityList",facilityList);
    RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void showEditFacility(HttpServletRequest request, HttpServletResponse response) {
    int id = Integer.parseInt(request.getParameter("id"));
    Facility facility = facilityService.findById(id);
        List<FacilityType> facilityTypeList =facilityTypeService.findAll();
        List<RentType>rentTypeList=rentTypeService.findAll();
        request.setAttribute("facilityTypeList",facilityTypeList);
        request.setAttribute("rentTypeList",rentTypeList);
    request.setAttribute("facility",facility);
    RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/edit.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void editFacility(HttpServletRequest request, HttpServletResponse response) {
        String message = "Thành Công";
        String facilityName = request.getParameter("facilityName");
        int facilityId= Integer.parseInt(request.getParameter("id"));
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facilityTypeId"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        String facilityFree = request.getParameter("facilityFree");
        Facility facility = new Facility(facilityId,facilityName, area, cost, maxPeople, rentTypeId, facilityTypeId, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
        boolean check = facilityService.updateFacility(facility);
        if (!check) {
            message = "Không thành công";
        }
        request.setAttribute("message", message);
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("view/facility/edit.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

