package controller;

import business.ApplicationContext;
import business.cart.ShoppingCart;
import viewmodel.CartViewModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import business.book.Book;

@ServletSecurity(@HttpConstraint(transportGuarantee = ServletSecurity.TransportGuarantee.CONFIDENTIAL))
@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends BookstoreServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if ("decrement".equals(action)) {
            ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
            String bookIdString = request.getParameter("bookId");
            long bookId = Long.parseLong(bookIdString);
            Book book = ApplicationContext.INSTANCE.getBookDao().findByBookId(bookId);
            cart.decrement(book);
        }
        if ("increment".equals(action)) {
            ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
            String bookIdString = request.getParameter("bookId");
            long bookId = Long.parseLong(bookIdString);
            Book book = ApplicationContext.INSTANCE.getBookDao().findByBookId(bookId);
            cart.increment(book);
        }
        response.sendRedirect(request.getContextPath() + "/cart");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("p", new CartViewModel(request));
        forwardToJsp(request, response, "/cart");

    }
}
