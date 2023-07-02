/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.TypeDAO;
import entity.Category;
import entity.Product;
import entity.Type;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;
import utils.Helper;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ShopController", urlPatterns = {"/shop"})
public class ShopController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShopController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Properties properties = Helper.getPropertiesByFileName("const/const.properties");
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Integer> lstPage = new ArrayList<>();
        TypeDAO typeDAO = new TypeDAO();

        int categoryId = request.getParameter("categoryId") == null ? 0 : Integer.parseInt(request.getParameter("categoryId"));
        String searchValue = request.getParameter("searchValue");
        int numberProductPerPage = Integer.parseInt(properties.getProperty("numberProductPerPage"));
        int pageCur = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
        int size = 0;
        List<Product> lstProduct;
        String href;
        String priceFrom = request.getParameter("priceFrom") == null? "100000" : request.getParameter("priceFrom");
        String priceTo = request.getParameter("priceTo")  == null? "1000000000" : request.getParameter("priceTo");
        String[] typeIds = request.getParameterValues("typeId");

        if (categoryId != 0) {
            lstProduct = productDAO.getListProductPerPageByCategoryId(numberProductPerPage, pageCur, categoryId, typeIds, priceFrom, priceTo);
            //href = "shop?categoryId=" + categoryId + "&";
            href = priceFrom.equals("0") ? "shop?categoryId=" + categoryId + "&" : "shop?categoryId=" + categoryId +"&priceFrom=" + priceFrom + "&priceTo=" + priceTo + "&";
            size = productDAO.sizeByCategory(categoryId, typeIds, priceFrom, priceTo);
            if (typeIds != null) {
                for (String typeId : typeIds) {
                    href += "&typeId=" + typeId + "&";
                }
            }
        } else if (searchValue != null) {
            lstProduct = productDAO.getListProductPerPageBySeachValue(numberProductPerPage, pageCur, searchValue);
            href = "shop?searchValue=" + searchValue + "&";
            size = productDAO.sizeBySearchValue(searchValue);
        } else {
            lstProduct = productDAO.getListProductPerPage(numberProductPerPage, pageCur, typeIds, priceFrom, priceTo);
            href = priceFrom.equals("0") ? "shop?" : "shop?priceFrom=" + priceFrom + "&priceTo=" + priceTo + "&";
            size = productDAO.size(typeIds, priceFrom, priceTo);
            if (typeIds != null) {
                for (String typeId : typeIds) {
                    href += "&typeId=" + typeId + "&";
                }
            }
        }
        int totalPage = size % numberProductPerPage == 0
                ? size / numberProductPerPage
                : size / numberProductPerPage + 1;
        for (int i = 1; i <= totalPage; i++) {
            lstPage.add(i);
        }
        List<Category> lstCategory = categoryDAO.getAll();
        List<Type> lstType = typeDAO.getAll();

        request.setAttribute("typeIds", typeIds);
        request.setAttribute("priceFrom", priceFrom);
        request.setAttribute("priceTo", priceTo);
        request.setAttribute("categoryId", categoryId);
        request.setAttribute("Helper", new Helper());
        request.setAttribute("href", href);
        request.setAttribute("lstCategory", lstCategory);
        request.setAttribute("lstType", lstType);
        request.setAttribute("lstProduct", lstProduct);
        request.setAttribute("lstPage", lstPage);
        request.setAttribute("pageCur", pageCur);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("searchValue", searchValue);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
