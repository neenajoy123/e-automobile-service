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
    String cus="";
    String desc="";
    
    String sphid="";
    inv=request.getParameter("invoice");
    date=request.getParameter("date1");
    cus=request.getParameter("cus");
    desc=request.getParameter("des");
    System.out.println("CUSTOMER"+cus);
    
     String sel1="select ssh_id from tbl_spartssalehead where ssh_invoiceno="+inv;
     System.out.println(sel1+"SELECTION");
    ResultSet rs1=obj.selectData(sel1);
    if(rs1.next())
    {
        sphid=rs1.getString("ssh_id");
    }
    else
    {
        
   
    String ins="insert into tbl_spartssalehead(ssh_date,ssh_invoiceno,branch_id,ssh_des,cus_id) values('"+date+"','"+inv+"','"+session.getAttribute("Branch")+"','"+desc+"','"+cus+"')";
    boolean b=obj.ExecuteCommand(ins);
    System.out.println(ins+"INSERTION");
    if(b)
    {
        String sel="select MAX(ssh_id) from tbl_spartssalehead";
        ResultSet rs=obj.selectData(sel);
        if(rs.next())
        {
           sphid= rs.getString("MAX(ssh_id)");
            
        }
    }
}
    session.setAttribute("sph",sphid); 
            System.out.println(session.getAttribute("sph")+"sshid");
%>
