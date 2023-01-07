package model;

public class CustomerType {
   private int customerTypeId;
   private String customerTypeName;

    public CustomerType() {
    }

    public CustomerType(int id, String name) {
        this.customerTypeId = id;
        this.customerTypeName = name;
    }

    public int getCustomerTypeId() {
        return customerTypeId;
    }

    public void setCustomerTypeId(int customerTypeId) {
        this.customerTypeId = customerTypeId;
    }

    public String getCustomerTypeName() {
        return customerTypeName;
    }

    public void setCustomerTypeName(String customerTypeName) {
        this.customerTypeName = customerTypeName;
    }
}
