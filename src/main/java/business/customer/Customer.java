package business.customer;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.DateFormat;

import static java.lang.System.out;

public class Customer {

    private long customerId;
    private String customerName;
    private String address;
    private String phone;
    private String email;
    private String ccNumber;
    private Date ccExpDate;

    public Customer(long customerId, String customerName, String address, String phone, String email, String ccNumber, Date ccExpDate) {
        this.customerId = customerId;
        this.customerName = customerName;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.ccNumber = ccNumber;
        this.ccExpDate = ccExpDate;
    }

    public long getCustomerId() {
        return customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public String getAddress() { return address; }

    public String getPhone() { return phone; }

    public String getEmail() { return email; }

    public String getCcNumber() { return ccNumber; }

    public String getCcNumLastFour() {
        return ccNumber.substring(ccNumber.length() - 4);
    }

    public String getCcExpStripped() {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        out.println("dateFormat:" + dateFormat.format(ccExpDate));
        return dateFormat.format(ccExpDate).substring(0, 7);
    }

    public Date getCcExpDate() { return ccExpDate; }

    @Override
    public String toString() {
        return "Customer{" +
                "customerId=" + customerId +
                ", customerName='" + customerName + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", ccNumber='" + ccNumber + '\'' +
                ", ccExpDate=" + ccExpDate +
                '}';
    }
}
