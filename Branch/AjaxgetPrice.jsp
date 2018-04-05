<%-- 
    Document   : AjaxgetPrice
    Created on : Mar 14, 2018, 2:27:32 PM
    Author     : ckc
--%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String price="";
    String id=request.getParameter("id");
    String str="select model_prize from tbl_model where model_id="+id;
    System.out.println(str);
    ResultSet rs1=obj.selectData(str);
    if (rs1.next())
    {
    price=rs1.getString("model_prize");
    }
   session.setAttribute("rate", price);
%>
<div><%=price%></div>