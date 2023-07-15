/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class ProductDAO {

    public int size(String[] typeIds, String priceFrom, String priceTo) {

        String sql = "SELECT COUNT(a.productId) as total from("
                + "Select DISTINCT\n"
                + "	p.productId,\n"
                + "	p.productName,\n"
                + "	p.productImg,\n"
                + "	p.productPrice,\n"
                + "	p.productDescription,\n"
                + "	p.categoryId,\n"
                + "	p.productIsFeatured,\n"
                + "	p.productIsRecent,\n"
                + "	p.productDeleted,\n"
                + "     p.typeId,\n"
                + "     p.quantity\n"
                + "from product p \n"
                + " Where p.productPrice between ? and ? ";
        if (typeIds != null) {
            sql += " AND (";
            for (int i = 0; i < typeIds.length - 1; i++) {
                sql += " p.typeId = " + typeIds[i] + " OR ";
            }
            sql += " p.typeId = " + typeIds[typeIds.length - 1] + " ) ";
        }
        sql += ") as a";
//        System.out.println(sql);
        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, priceFrom);
            ps.setObject(2, priceTo);
            ResultSet rs = ps.executeQuery();
            int total = 0;
            while (rs.next()) {
                total = rs.getInt("total");
            }
            return total;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public List<Product> getListProductPerPage(int numberProductPerPage, int pageCur, String[] typeIds, String priceFrom, String priceTo) {

        String sql = ""
                + "Select DISTINCT\n"
                + "	p.productId,\n"
                + "	p.productName,\n"
                + "	p.productImg,\n"
                + "	p.productPrice,\n"
                + "	p.productDescription,\n"
                + "	p.categoryId,\n"
                + "	p.productIsFeatured,\n"
                + "	p.productIsRecent,\n"
                + "	p.productDeleted,\n"
                + "     p.typeId,\n"
                + "     p.quantity\n"
                + "from product p \n"
                + " Where p.productPrice between ? and ? ";
        if (typeIds != null) {
            sql += " AND (";
            for (int i = 0; i < typeIds.length - 1; i++) {
                sql += " p.typeId = " + typeIds[i] + " OR ";
            }
            sql += " p.typeId = " + typeIds[typeIds.length - 1] + " ) ";
        }
        sql += " Order BY p.productId\n"
                + "OFFSET ? ROWS \n"
                + "FETCH NEXT ? ROWS ONLY";
        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, priceFrom);
            ps.setObject(2, priceTo);
            ps.setObject(3, pageCur * numberProductPerPage - numberProductPerPage);
            ps.setObject(4, numberProductPerPage);
            ResultSet rs = ps.executeQuery();

            List<Product> list = new ArrayList<>();//
            while (rs.next()) {
                Product s = Product.builder()
                        .productId(rs.getInt("productId"))
                        .productName(rs.getString("productName"))
                        .productImg(rs.getString("productImg"))
                        .productPrice(rs.getInt("productPrice"))
                        .productDescription(rs.getString("productDescription"))
                        .categoryId(rs.getInt("categoryId"))
                        .productIsFeatured(rs.getBoolean("productIsFeatured"))
                        .productIsRecent(rs.getBoolean("productIsRecent"))
                        .productDeleted(rs.getBoolean("productDeleted"))
                        .typeId(rs.getInt("typeId"))
                        .quantity(rs.getInt("quantity"))
                        .build();
                list.add(s);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Product> getListProductPerPageByCategoryId(int numberProductPerPage, int pageCur, int categoryId, String[] typeIds, String priceFrom, String priceTo) {

        String sql = ""
                + "Select DISTINCT\n"
                + "	p.productId,\n"
                + "	p.productName,\n"
                + "	p.productImg,\n"
                + "	p.productPrice,\n"
                + "	p.productDescription,\n"
                + "	p.categoryId,\n"
                + "	p.productIsFeatured,\n"
                + "	p.productIsRecent,\n"
                + "	p.productDeleted,\n"
                + "     p.typeId,\n"
                + "     p.quantity\n"
                + "from product p \n"
                + " Where categoryId = ? And p.productPrice between ? and ? ";
        if (typeIds != null) {
            sql += " AND (";
            for (int i = 0; i < typeIds.length - 1; i++) {
                sql += " p.typeId = " + typeIds[i] + " OR ";
            }
            sql += " p.typeId = " + typeIds[typeIds.length - 1] + " ) ";
        }
        sql += " Order BY p.productId\n"
                + "OFFSET ? ROWS \n"
                + "FETCH NEXT ? ROWS ONLY";
//        System.out.println(sql);
        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, categoryId);
            ps.setObject(2, priceFrom);
            ps.setObject(3, priceTo);
            ps.setObject(4, pageCur * numberProductPerPage - numberProductPerPage);
            ps.setObject(5, numberProductPerPage);
            ResultSet rs = ps.executeQuery();

            List<Product> list = new ArrayList<>();//
            while (rs.next()) {
                Product s = Product.builder()
                        .productId(rs.getInt("productId"))
                        .productName(rs.getString("productName"))
                        .productImg(rs.getString("productImg"))
                        .productPrice(rs.getInt("productPrice"))
                        .productDescription(rs.getString("productDescription"))
                        .categoryId(rs.getInt("categoryId"))
                        .productIsFeatured(rs.getBoolean("productIsFeatured"))
                        .productIsRecent(rs.getBoolean("productIsRecent"))
                        .productDeleted(rs.getBoolean("productDeleted"))
                        .typeId(rs.getInt("typeId"))
                        .quantity(rs.getInt("quantity"))
                        .build();
                list.add(s);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Product> getListProductPerPageBySeachValue(int numberProductPerPage, int pageCur, String searchValue) {

        String sql = "  Select * from \n"
                + "Product p Join Category c ON p.categoryId = c.categoryId \n"
                + "WHERE p.productName LIKE ? OR c.categoryName LIKE ?"
                + "	Order BY p.productId\n"
                + "OFFSET ? ROWS \n"
                + "FETCH NEXT ? ROWS ONLY";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, "%" + searchValue + "%");
            ps.setObject(2, "%" + searchValue + "%");
            ps.setObject(3, pageCur * numberProductPerPage - numberProductPerPage);
            ps.setObject(4, numberProductPerPage);
            ResultSet rs = ps.executeQuery();

            List<Product> list = new ArrayList<>();//
            while (rs.next()) {
                Product s = Product.builder()
                        .productId(rs.getInt("productId"))
                        .productName(rs.getString("productName"))
                        .productImg(rs.getString("productImg"))
                        .productPrice(rs.getInt("productPrice"))
                        .productDescription(rs.getString("productDescription"))
                        .categoryId(rs.getInt("categoryId"))
                        .productIsFeatured(rs.getBoolean("productIsFeatured"))
                        .productIsRecent(rs.getBoolean("productIsRecent"))
                        .productDeleted(rs.getBoolean("productDeleted"))
                        .typeId(rs.getInt("typeId"))
                        .quantity(rs.getInt("quantity"))
                        .build();
                list.add(s);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Product> getListProductSort(int numberProductPerPage, int pageCur, int categoryId, String[] typeIds, String priceFrom, String priceTo, String type) {

        String sql = ""
                + "Select\n"
                + "	p.productId,\n"
                + "	p.productName,\n"
                + "	p.productImg,\n"
                + "	p.productPrice,\n"
                + "	p.productDescription,\n"
                + "	p.categoryId,\n"
                + "	p.productIsFeatured,\n"
                + "	p.productIsRecent,\n"
                + "	p.productDeleted,\n"
                + "     p.typeId,\n"
                + "     p.quantity\n"
                + "from product p \n"
                + " Where categoryId = ? And p.productPrice between ? and ? ";
        if (typeIds != null) {
            sql += " AND (";
            for (int i = 0; i < typeIds.length - 1; i++) {
                sql += " p.typeId = " + typeIds[i] + " OR ";
            }
            sql += " p.typeId = " + typeIds[typeIds.length - 1] + " ) ";
        }
        sql += " Order BY p.productPrice\n" + type
                + " OFFSET ? ROWS \n"
                + "FETCH NEXT ? ROWS ONLY";
        System.out.println(sql);
        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, categoryId);
            ps.setObject(2, priceFrom);
            ps.setObject(3, priceTo);
            ps.setObject(4, pageCur * numberProductPerPage - numberProductPerPage);
            ps.setObject(5, numberProductPerPage);
            ResultSet rs = ps.executeQuery();

            List<Product> list = new ArrayList<>();//
            while (rs.next()) {
                Product s = Product.builder()
                        .productId(rs.getInt("productId"))
                        .productName(rs.getString("productName"))
                        .productImg(rs.getString("productImg"))
                        .productPrice(rs.getInt("productPrice"))
                        .productDescription(rs.getString("productDescription"))
                        .categoryId(rs.getInt("categoryId"))
                        .productIsFeatured(rs.getBoolean("productIsFeatured"))
                        .productIsRecent(rs.getBoolean("productIsRecent"))
                        .productDeleted(rs.getBoolean("productDeleted"))
                        .typeId(rs.getInt("typeId"))
                        .quantity(rs.getInt("quantity"))
                        .build();
                list.add(s);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public int sizeByCategory(int categoryId, String[] typeIds, String priceFrom, String priceTo) {

        String sql = "SELECT COUNT(a.productId) as total from("
                + "Select DISTINCT\n"
                + "	p.productId,\n"
                + "	p.productName,\n"
                + "	p.productImg,\n"
                + "	p.productPrice,\n"
                + "	p.productDescription,\n"
                + "	p.categoryId,\n"
                + "	p.productIsFeatured,\n"
                + "	p.productIsRecent,\n"
                + "	p.productDeleted,\n"
                + "     p.typeId,\n"
                + "     p.quantity\n"
                + "from product p \n"
                + " Where categoryId = ? and p.productPrice between ? and ? ";
        if (typeIds != null) {
            sql += " AND (";
            for (int i = 0; i < typeIds.length - 1; i++) {
                sql += " p.typeId = " + typeIds[i] + " OR ";
            }
            sql += " p.typeId = " + typeIds[typeIds.length - 1] + " ) ";
        }
        sql += ") as a";

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, categoryId);
            ps.setObject(2, priceFrom);
            ps.setObject(3, priceTo);
            ResultSet rs = ps.executeQuery();
            int total = 0;
            while (rs.next()) {
                total = rs.getInt("total");
            }
            return total;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public int sizeBySearchValue(String searchValue) {

        String sql = "SELECT COUNT(p.productId) as total from\n"
                + "Product p Join Category c ON p.categoryId = c.categoryId \n"
                + "WHERE p.productName LIKE ? OR c.categoryName LIKE ?";

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, "%" + searchValue + "%");
            ps.setObject(2, "%" + searchValue + "%");
            ResultSet rs = ps.executeQuery();
            int total = 0;
            while (rs.next()) {
                total = rs.getInt("total");
            }
            return total;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public List<Product> getAllByFeatured() {

        String sql = "SELECT * FROM Product Where productIsFeatured = 1";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();

            List<Product> list = new ArrayList<>();//
            while (rs.next()) {
                Product s = Product.builder()
                        .productId(rs.getInt("productId"))
                        .productName(rs.getString("productName"))
                        .productImg(rs.getString("productImg"))
                        .productPrice(rs.getInt("productPrice"))
                        .productDescription(rs.getString("productDescription"))
                        .categoryId(rs.getInt("categoryId"))
                        .productIsFeatured(rs.getBoolean("productIsFeatured"))
                        .productIsRecent(rs.getBoolean("productIsRecent"))
                        .productDeleted(rs.getBoolean("productDeleted"))
                        .typeId(rs.getInt("typeId"))
                        .quantity(rs.getInt("quantity"))
                        .build();
                list.add(s);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Product> getAllByRecent() {

        String sql = "SELECT * FROM Product Where productIsRecent = 1";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();

            List<Product> list = new ArrayList<>();//
            while (rs.next()) {
                Product s = Product.builder()
                        .productId(rs.getInt("productId"))
                        .productName(rs.getString("productName"))
                        .productImg(rs.getString("productImg"))
                        .productPrice(rs.getInt("productPrice"))
                        .productDescription(rs.getString("productDescription"))
                        .categoryId(rs.getInt("categoryId"))
                        .productIsFeatured(rs.getBoolean("productIsFeatured"))
                        .productIsRecent(rs.getBoolean("productIsRecent"))
                        .productDeleted(rs.getBoolean("productDeleted"))
                        .typeId(rs.getInt("typeId"))
                        .quantity(rs.getInt("quantity"))
                        .build();
                list.add(s);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public Product getOne(int productId) {

        String sql = "Select * From Product Where productId = ?";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, productId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product s = Product.builder()
                        .productId(rs.getInt("productId"))
                        .productName(rs.getString("productName"))
                        .productImg(rs.getString("productImg"))
                        .productPrice(rs.getInt("productPrice"))
                        .productDescription(rs.getString("productDescription"))
                        .categoryId(rs.getInt("categoryId"))
                        .productIsFeatured(rs.getBoolean("productIsFeatured"))
                        .productIsRecent(rs.getBoolean("productIsRecent"))
                        .productDeleted(rs.getBoolean("productDeleted"))
                        .typeId(rs.getInt("typeId"))
                        .quantity(rs.getInt("quantity"))
                        .build();
                return s;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Product> getRandByCategoryId(int numberProduct, int categoryId, int productId) {
        String sql = "SELECT TOP " + numberProduct + " * FROM product where categoryId = ? AND productId != ? ORDER BY NEWID()";//
        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, categoryId);
            ps.setObject(2, productId);
            ResultSet rs = ps.executeQuery();

            List<Product> list = new ArrayList<>();//
            while (rs.next()) {
                Product p = Product.builder()
                        .productId(rs.getInt("productId"))
                        .productName(rs.getString("productName"))
                        .productImg(rs.getString("productImg"))
                        .productPrice(rs.getInt("productPrice"))
                        .productDescription(rs.getString("productDescription"))
                        .categoryId(rs.getInt("categoryId"))
                        .productIsFeatured(rs.getBoolean("productIsFeatured"))
                        .productIsRecent(rs.getBoolean("productIsRecent"))
                        .productDeleted(rs.getBoolean("productDeleted"))
                        .typeId(rs.getInt("typeId"))
                        .quantity(rs.getInt("quantity"))
                        .build();
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public int add(Product obj) {
        int check = 0;
        String sql = "INSERT [dbo].[Product] ([productName], [productImg], [productPrice], [productDescription], [categoryId], [productIsFeatured], [productIsRecent], [productDeleted], [typeId], [quantity])"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = (con != null) ? con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS) : null;) {
            ps.setObject(1, obj.getProductName());
            ps.setObject(2, obj.getProductImg());
            ps.setObject(3, obj.getProductPrice());
            ps.setObject(4, obj.getProductDescription());
            ps.setObject(5, obj.getCategoryId());
            ps.setObject(6, obj.isProductIsFeatured());
            ps.setObject(7, obj.isProductIsRecent());
            ps.setObject(8, obj.isProductDeleted());
            ps.setObject(9, obj.getTypeId());
            ps.setObject(10, obj.getQuantity());

            check = ps.executeUpdate();
            if (check > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                rs.next();
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public boolean update(Product obj, int productId) {
        int check = 0;
        String sql = "UPDATE Product SET productName = ?, categoryId = ?, productPrice = ?, productIsFeatured = ?, productIsRecent = ?, productDescription = ?, typeId = ?, quantity = ? WHERE productId = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, obj.getProductName());
            ps.setObject(2, obj.getCategoryId());
            ps.setObject(3, obj.getProductPrice());
            ps.setObject(4, obj.isProductIsFeatured());
            ps.setObject(5, obj.isProductIsRecent());
            ps.setObject(6, obj.getProductDescription());
            ps.setObject(7, obj.getTypeId());
            ps.setObject(8, obj.getQuantity());
            ps.setObject(9, productId);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public static void main(String[] args) {
        String[] i = {"1", "2"};
        System.out.println(new ProductDAO().getListProductSort(9, 1, 1, i, "0", "1000000000", "asc"));
    }
}
