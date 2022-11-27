package com.example.ngay241122.baitap1;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/UserServlet")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = new ArrayList<>();
        userList.add(new User("Nam","14/11/1997","Ha Noi","https://khoinguonsangtao.vn/wp-content/uploads/2022/07/avatar-gau-cute.jpg"));
        userList.add(new User("Tung","23/12/2000","Ha Noi","https://khoinguonsangtao.vn/wp-content/uploads/2022/07/avatar-gau-cute.jpg"));
        userList.add(new User("Son","01/05/2000","Ha Noi","https://khoinguonsangtao.vn/wp-content/uploads/2022/07/avatar-gau-cute.jpg"));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("baitap1/baitap1.jsp");
        request.setAttribute("userList",userList);
        requestDispatcher.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
