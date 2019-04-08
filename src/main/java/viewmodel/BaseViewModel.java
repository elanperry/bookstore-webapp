package viewmodel;

import business.ApplicationContext;
import business.cart.ShoppingCart;
import business.cart.ShoppingCartItem;
import business.category.Category;
import business.book.Book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public class BaseViewModel {

    // We're moving the initialization parameters to the view model
    private static final String SITE_IMAGE_PATH = "images/site/";
    private static final String BOOK_IMAGE_PATH = "images/books/";

    // Every view model knows the request and session
    protected HttpServletRequest request;
    protected HttpSession session;

    // The header (on all pages) needs to know the categories
    private List<Category> categories;
    private ShoppingCart cart;
    private ShoppingCartItem cartItem;
    private Book book;

    private Category selectedCategory;
    private List<Book> selectedCategoryBooks;

    public BaseViewModel(HttpServletRequest request) {
        this.request = request;
        this.session = request.getSession(true);
        this.categories = initCategories();
        this.cart = initCart();
    }

    private ShoppingCart initCart() {
        ShoppingCart result = (ShoppingCart) session.getAttribute("cart");
        if (result == null) {
            result = new ShoppingCart();
            session.setAttribute("cart", result);
        }
        return result;
    }

    private List<Category> initCategories() {
        List<Category> result = (List<Category>) request.getServletContext().getAttribute("categories");
        if (result == null) {
            result = ApplicationContext.INSTANCE.getCategoryDao().findAll();
            request.getServletContext().setAttribute("categories", result);
        }
        return result;
    }

    public String getSiteImagePath() { return SITE_IMAGE_PATH; }
    public String getBookImagePath() { return BOOK_IMAGE_PATH; }
    public List<Category> getCategories() { return categories; }
    public ShoppingCart getCart() { return cart; }
    public Book getBook() { return book;}
    public ShoppingCartItem getCartItem() { return cartItem; }

    public Category getSelectedCategory() {
        return (Category) session.getAttribute("selectedCategory");
    }

    public boolean getHasSelectedCategory() {
        return session.getAttribute("selectedCategory") != null;
    }
}
