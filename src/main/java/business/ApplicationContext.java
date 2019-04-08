
package business;

import business.book.BookDao;
import business.book.BookDaoJdbc;
import business.category.CategoryDao;
import business.category.CategoryDaoJdbc;
import business.customer.CustomerDao;
import business.customer.CustomerDaoJdbc;
import business.order.*;


public class ApplicationContext {

    private BookDao bookDao;
    private CategoryDao categoryDao;
    private CustomerDao customerDao;
    private OrderDao orderDao;
    private LineItemDao lineItemDao;
    private OrderService orderService;


    public static ApplicationContext INSTANCE = new ApplicationContext();

    private ApplicationContext() {
        bookDao = new BookDaoJdbc();
        categoryDao = new CategoryDaoJdbc();
        customerDao = new CustomerDaoJdbc();
        orderDao = new OrderDaoJdbc();
        lineItemDao = new LineItemDaoJdbc();
        orderService = new DefaultOrderService();
        DefaultOrderService service = (DefaultOrderService) orderService;
        service.setBookDao(bookDao);
        service.setCustomerDao(customerDao);
        service.setOrderDao(orderDao);
        service.setLineItemDao(lineItemDao);
    }

    public BookDao getBookDao() {
        return bookDao;
    }
    public CategoryDao getCategoryDao() { return categoryDao; }
    public CustomerDao getCustomerDao() {return customerDao;}
    public OrderDao getOrderDao() {return orderDao;}
    public LineItemDao getLineItemDao() {return lineItemDao;}
    public OrderService getOrderService() {return orderService;}
}
