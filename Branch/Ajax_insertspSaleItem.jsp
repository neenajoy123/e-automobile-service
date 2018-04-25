<%-- 
    Document   : Ajax_insertItem
    Created on : Mar 20, 2018, 2:00:17 PM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String qun=request.getParameter("qun");
    
    String spareparts=request.getParameter("model");
    String ins="insert into tbl_spartssale(ssh_id,sp_id,ssale_rate,ssale_utotal,ssale_qun) values('"+session.getAttribute("sph")+"','"+spareparts+"','"+session.getAttribute("rate")+"','"+session.getAttribute("utotal")+"','"+qun+"')";
    System.out.println(ins);
    boolean b=obj.ExecuteCommand(ins);
    
    String stock="";
    int stock1=0;
    int totstock=0;
    
    int qun1=Integer.parseInt(qun);
    
    if(b)
    {
        String sel="select bsp_stock,bsp_id from tbl_branchspareparts where sp_id="+spareparts;
        System.out.println(sel);
        ResultSet rs=obj.selectData(sel);
        if(rs.next())
        {
            stock=rs.getString("bsp_stock");
            stock1=Integer.parseInt(stock);
            totstock=stock1-qun1;
            String update="update tbl_branchspareparts set bsp_stock='"+totstock+"' where bsp_id="+rs.getString("bsp_id");
            obj.ExecuteCommand(update);
            System.out.println(update);
        }
        else
        {
            String in="insert into tbl_branchspareparts(branch_id,sp_id,bsp_stock) values('"+session.getAttribute("Branch") +"','"+spareparts+"','"+qun+"')";
            obj.ExecuteCommand(in);
            System.out.println(in);
    }
        }


%>
