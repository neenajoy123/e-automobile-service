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
    String model=request.getParameter("model");
    String ins="insert into tbl_vehiclepurchase(vph_id,model_id,vpurchase_rate,vpurchase_utotal,vpurchase_quantity) values('"+session.getAttribute("vph")+"','"+model+"','"+session.getAttribute("rate")+"','"+session.getAttribute("utotal")+"','"+qun+"')";
    System.out.println(ins);
    boolean b=obj.ExecuteCommand(ins);
    
    String stock="";
    int stock1=0;
    int totstock=0;
    
    int qun1=Integer.parseInt(qun);
    
    if(b)
    {
        String sel="select bmodel_stock,bmodel_id from tbl_branchmodel where model_id="+model;
        System.out.println(sel);
        ResultSet rs=obj.selectData(sel);
        if(rs.next())
        {
            stock=rs.getString("bmodel_stock");
            stock1=Integer.parseInt(stock);
            totstock=qun1+stock1;
            String update="update tbl_branchmodel set bmodel_stock='"+totstock+"' where bmodel_id="+rs.getString("bmodel_id");
            obj.ExecuteCommand(update);
            System.out.println(update);
        }
        else
        {
            String in="insert into tbl_branchmodel(branch_id,model_id,bmodel_stock) values('"+session.getAttribute("Branch") +"','"+model+"','"+qun1+"')";
            obj.ExecuteCommand(in);
            System.out.println(in);
        }
    }

%>
