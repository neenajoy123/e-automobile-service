<%-- 
    Document   : ajaxdelete
    Created on : Mar 21, 2018, 12:23:42 PM
    Author     : ckc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<%
    //.
    String sel="select model_id,vsale_quantity from tbl_vehiclesale where vsale_id="+request.getParameter("id");
    ResultSet rs=obj.selectData(sel);
    System.out.println(sel);
    if(rs.next())
    {
        int qun=0;
        int qunt=Integer.parseInt(rs.getString("vsale_quantity"));
        int qun1=0;
       String sell="select bmodel_stock from tbl_branchmodel where model_id="+rs.getString("model_id");
       ResultSet rss=obj.selectData(sell);
           System.out.println(sell);

       if(rss.next())
       {
           qun=rss.getInt("bmodel_stock");
           qun1=qun-qunt;
           String up="update tbl_branchmodel set bmodel_stock='"+qun1+"' where model_id="+rs.getString("model_id");
           obj.ExecuteCommand(up);
           System.out.println(up);
       }
    }
      String delete="delete from tbl_vehiclesale where vsale_id="+request.getParameter("id");
      obj.ExecuteCommand(delete);
      System.out.println(delete);
      
%>
