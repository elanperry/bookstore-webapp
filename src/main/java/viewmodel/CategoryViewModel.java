package viewmodel;

import business.ApplicationContext;
import business.book.Book;
import business.book.BookDao;
import business.category.Category;
import business.category.CategoryDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

import static java.lang.System.out;

public class CategoryViewModel extends BaseViewModel {

    BookDao bookDao = ApplicationContext.INSTANCE.getBookDao();
    CategoryDao categoryDao = ApplicationContext.INSTANCE.getCategoryDao();

    private Category selectedCategory;
    private List<Book> selectedCategoryBooks;

    public CategoryViewModel(HttpServletRequest request) {
        super(request);

        HttpSession session = request.getSession();

        String categoryName = request.getParameter("category");
        selectedCategory = (isValidName(categoryName)) ?
                categoryDao.findByName(categoryName) :
                categoryDao.findByCategoryId(1);
        selectedCategoryBooks = bookDao.findByCategoryId(selectedCategory.getCategoryId());
        rememberSelectedCategory(session, selectedCategory);
    }

    private boolean isValidName(String categoryName) {
        return (categoryName != null); //Fix this (iterate over the categories)
    }

    public Category getSelectedCategory() { return selectedCategory; }
    public List<Book> getSelectedCategoryBooks() { return selectedCategoryBooks; }

    private void rememberSelectedCategory(HttpSession session, Category selectedCategory) {
        out.println("selectedCategory:"+ selectedCategory);
        session.setAttribute("selectedCategory", selectedCategory);
    }


}
