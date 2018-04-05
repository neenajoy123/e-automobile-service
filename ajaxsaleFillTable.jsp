<%-- 
    Document   : ajaxFillTable
    Created on : Mar 21, 2018, 10:56:51 AM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<table align="center">
    <%
        int utotal=0;
        int gtotal=0;
    %>
    <tr>
        
        <th>Model</th>
        <th>Rate</th>
        <th>Quantity</th>
        <th>Unit Total</th>
        
    </tr>
    <%
        String sel="select * from tbl_vehiclesale v inner join tbl_model m on m.model_id=v.model_id and v.vsh_id="+session.getAttribute("vsh");
        ResultSet rs=obj.selectData(sel);
        System.out.println("test"+sel);
        while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getString("model_name")%></td>
                <td><%=rs.getString("vsale_rate")%></td>
                <td><%=rs.getString("vsale_quantity")%></td>
                <td><%=rs.getString("vsale_utotal")%></td>
                <td><a onclick="deleteMethod(<%=rs.getString("vsale_id")%>)">Delete</a></td>
                <%
                utotal=Integer.parseInt(rs.getString("vsale_utotal"));
                gtotal=gtotal+utotal;
                %>
                
                
            </tr>
            <%}
            %>
        </table>
       
        
   
    <br>
    <table align="center">
    
        <tr>
            <td colspan="4" align="center">Grand Total</td>
            <td><%=gtotal%></td>
        <input type="hidden" name="gtotal" value="<%=gtotal%>">
        </tr>
        <td colspan="2" align="center">
            <input type="submit" name="btnsave" value="SAVE">
        </td>
    
        
    </table>

