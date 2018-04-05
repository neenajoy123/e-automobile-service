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
    
    String sphid="";
    inv=request.getParameter("invoice");
    date=request.getParameter("date1");
    comp=request.getParameter("comp");
    desc=request.getParameter("des");
    
    
     String sel1="select sph_id from tbl_sparepartspurchasedhead where sph_invoiceno="+inv;
     System.out.println(sel1);
    ResultSet rs1=obj.selectData(sel1);
    if(rs1.next())
    {
        sphid=rs1.getString("sph_id");
    }
    else
    {
        
   
    String ins="insert into tbl_sparepartspurchasedhead(sph_date,sph_invoiceno,branch_id,sph_des,comp_id) values('"+date+"','"+inv+"','"+session.getAttribute("Branch")+"','"+desc+"','"+comp+"')";
    boolean b=obj.ExecuteCommand(ins);
    System.out.println(ins);
    if(b)
    {
        String sel="select MAX(sph_id) from tbl_sparepartspurchasedhead";
        ResultSet rs=obj.selectData(sel);
        if(rs.next())
        {
           sphid= rs.getString("MAX(sph_id)");
            
        }
    }
}
    session.setAttribute("sph",sphid); 
            System.out.println(session.getAttribute("sph"));
%>
