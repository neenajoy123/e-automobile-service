<%-- 
    Document   : ajax_vehicleInsert
    Created on : Mar 20, 2018, 12:24:59 PM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String inv="";
    String date="";
    String comp="";
    String desc="";
    String vphid="";
    inv=request.getParameter("invoice");
    date=request.getParameter("date");
    comp=request.getParameter("comp");
    desc=request.getParameter("des");
    
    String sel1="select vph_id from tbl_vehiclepurchasehead where vph_invoiceno="+inv;
    ResultSet rs1=obj.selectData(sel1);
    if(rs1.next())
    {
        vphid=rs1.getString("vph_id");
    }
    else
    {
    String ins="insert into tbl_vehiclepurchasehead(vph_date,vph_invoiceno,branch_id,vph_des,comp_id) values('"+date+"','"+inv+"','"+session.getAttribute("Branch")+"','"+desc+"','"+comp+"')";
    boolean b=obj.ExecuteCommand(ins);
    System.out.println(ins);
    if(b)
    {
        String sel="select MAX(vph_id) from tbl_vehiclepurchasehead";
        ResultSet rs=obj.selectData(sel);
        if(rs.next())
        {
            vphid= rs.getString("MAX(vph_id)");
        }
            
        }
    }
    
   session.setAttribute("vph", vphid);
            System.out.println(session.getAttribute("vph"));
%>
