package com.example.baitap1.controller;

import com.example.baitap1.model.Origin;
import com.example.baitap1.model.Product;
import com.example.baitap1.service.ProductServiceImp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import static com.sun.javafx.fxml.expression.Expression.add;

@WebServlet(name = "ProductServlet", value = "/ProductServlet")
public class ProductServlet extends HttpServlet {
    private ProductServiceImp productServiceImp;
    @Override
    public void init()  {
        productServiceImp = new ProductServiceImp();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action="";
        }
        switch (action){
            case "update":disUpdate(request, response);break;
            case "add":disAdd(request, response);break;
            case "delete": disDelete(request, response);break;
            default:display(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action="";
        }
        switch (action){
            case "delete": delete(request, response);break;
            case "add":add(request, response);break;
            case "update":update(request, response);break;
        }
    }
    private void disDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("delete.jsp");
        List<Product> products = productServiceImp.findAll();
        Long id = Long.parseLong(request.getParameter("id"));
        for (Product product : products ){
            if (product.getId().equals(id)){
                request.setAttribute("product", product);
                break;
            }
        }
        requestDispatcher.forward(request, response);
    }
    private void display(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        request.setAttribute("products",productServiceImp.findAll());
        requestDispatcher.forward(request,response);
    }
    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Long.parseLong(request.getParameter("id"));
        productServiceImp.delete(id);
        response.sendRedirect("ProductServlet");
    }
    private void disAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("add.jsp");
        request.setAttribute("listOrigin",productServiceImp.findOrigin());
        requestDispatcher.forward(request,response);
    }
    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String text = request.getParameter("origin");
        Origin origin =new Origin() ;
        for (Origin o: productServiceImp.findOrigin()){
            if (o.getName().equals(text)){
                origin = o;
                break;
            }
        }
        Product product = new Product(name, price, origin);
        productServiceImp.save(product);
        response.sendRedirect("ProductServlet");
    }
    private void disUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Long.parseLong(request.getParameter("id"));
        Product product = productServiceImp.findById(id);
        List<Origin> origins = new ArrayList<>();
        for (Origin o : productServiceImp.findOrigin()){
            if (!Objects.equals(o,product.getOrigin())){
                origins.add(o);
            }
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("update.jsp");
        request.setAttribute("product", product);
        request.setAttribute("listOrigin", origins);
        requestDispatcher.forward(request, response);
    }
    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String text = request.getParameter("origin");
        Origin origin =new Origin() ;
        for (Origin o: productServiceImp.findOrigin()){
            if (o.getName().equals(text)){
                origin = o;
            }
        }
       for (Product p: productServiceImp.findAll()){
           if (p.getId().equals(id)){
               p.setName(name);
               p.setPrice(price);
               p.setOrigin(origin);
               break;
           }
       }
       response.sendRedirect("ProductServlet");
    }
}
