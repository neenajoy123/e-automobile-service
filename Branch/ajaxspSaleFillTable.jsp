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
        <th>Spare Parts</th>
        <th>Rate</th>
        <th>Quantity</th>
        <th>Unit Total</th>
        
    </tr>
    <%
        String sel="select * from tbl_spartssale sp inner join tbl_model m inner join tbl_spareparts s on sp.sp_id=s.sp_id and s.model_id=m.model_id and sp.ssh_id="+session.getAttribute("sph");
        ResultSet rs=obj.selectData(sel);
        System.out.println("test"+sel);
        while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getString("model_name")%></td>
                <td><%=rs.getString("sp_name")%></td>
                <td><%=rs.getString("ssale_rate")%></td>
                <td><%=rs.getString("ssale_qun")%></td>
                <td><%=rs.getString("ssale_utotal")%></td>
                <td><a onclick="deleteMethod(<%=rs.getString("ssale_id")%>)">Delete</a></td>
                <%
                utotal=Integer.parseInt(rs.getString("ssale_utotal"));
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

