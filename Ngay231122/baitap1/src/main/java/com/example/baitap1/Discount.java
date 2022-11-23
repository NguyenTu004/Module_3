package com.example.baitap1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Discount", value="/discount")
public class Discount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String text = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("list_price"));
        double discount = Double.parseDouble(request.getParameter("discount_percent"));
        double discount_amount =(double) (price * discount * 0.01);
        double discount_price = (double) (price * (100-discount) * 0.01);
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Product Description: "+text+"</h1>");
        writer.println("<h1>Discount Amount: "+discount_amount+"</h1>");
        writer.println("<h1>Discount Price: "+discount_price+"</h1>");
        writer.println("</html>");
    }

}
