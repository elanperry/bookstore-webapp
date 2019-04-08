package viewmodel;

import business.cart.ShoppingCart;
import business.customer.CustomerForm;
import business.order.DefaultOrderService;
import business.order.Order;
import business.order.OrderDetails;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

public class ConfirmationViewModel extends BaseViewModel {

    private OrderDetails orderDetails;
    private Order order;
    private CustomerForm customerForm;
    private int surcharge;
    private long confNumber;
    private Date orderConfDate;
    private long orderConfTime;
    private long confirmationNumber;

    public ConfirmationViewModel(HttpServletRequest request) {
        super(request);

        orderDetails = (OrderDetails) session.getAttribute("orderDetails");
        session.setAttribute("orderDetails", null);

        order = (Order) session.getAttribute("Order");
        confNumber = 785613212;
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        CustomerForm customerForm = (CustomerForm) session.getAttribute("customerForm");
        surcharge = cart.getSurcharge();
        orderConfDate = getOrderConfirmationDate();
        orderConfTime = getOrderConfirmationTime();
        confirmationNumber = generateConfirmationNumber();
    }

    public OrderDetails getOrderDetails() { return orderDetails; }

    public Order getOrder() { return order; }

    public CustomerForm getCustomerForm() { return customerForm; }

    public long getConfNumber() { return confNumber; }

    public Date getOrderConfirmationDate() {
        Date date = new java.util.Date();

        return date;}

    public long getOrderConfirmationTime() {
        long time = System.currentTimeMillis();

        return time;}

    public long generateConfirmationNumber() {
        Random random = new Random();
        return random.nextInt(999999999);
    }
}
