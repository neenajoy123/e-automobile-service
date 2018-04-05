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
    
    String sel1="select vsh_id from tbl_vehiclesalehead where vsh_invoiceno="+inv;
    ResultSet rs1=obj.selectData(sel1);
    if(rs1.next())
    {
        vphid=rs1.getString("vsh_id");
    }
    else
    {
    String ins="insert into tbl_vehiclesalehead(vsh_date,vsh_invoiceno,branch_id,vsh_des,cus_id) values('"+date+"','"+inv+"','"+session.getAttribute("Branch")+"','"+desc+"','"+comp+"')";
    boolean b=obj.ExecuteCommand(ins);
    System.out.println(ins);
    if(b)
    {
        String sel="select MAX(vsh_id) from tbl_vehiclesalehead";
        ResultSet rs=obj.selectData(sel);
        if(rs.next())
        {
            vphid= rs.getString("MAX(vsh_id)");
        }
            
        }
    }
    
   session.setAttribute("vsh", vphid);
            System.out.println(session.getAttribute("vsh"));
%>
