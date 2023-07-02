/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.Type;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class TypeDAO {

    public List<Type> getAll() {

        String sql = "SELECT * FROM Type";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();

            List<Type> list = new ArrayList<>();//
            while (rs.next()) {
                Type s = Type.builder()
                        .typeId(rs.getInt("typeId"))
                        .typeValue(rs.getString("typeValue"))
                        .build();
                list.add(s);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(new TypeDAO().getAll());
    }

}
