<%-- 
    Document   : AjaxUnitPrice
    Created on : Mar 14, 2018, 3:17:47 PM
    Author     : ckc
--%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String price="";
    String qun=request.getParameter("qun");
    String model=request.getParameter("model");
    String str="select model_prize from tbl_model where model_id="+model;
    System.out.println(str);
    ResultSet rs1=obj.selectData(str);
    if (rs1.next())
    {
    price=rs1.getString("model_prize");
    }
    int p=Integer.parseInt(price);
    int q=Integer.parseInt(qun);
    int tot=p*q;
    session.setAttribute("utotal", tot);
%>
<div><%=tot%></div>
