<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
    
<%
    String sel="select sp_id,ssale_qun from tbl_spartssale where ssale_id="+request.getParameter("id");
    ResultSet rs=obj.selectData(sel);
    System.out.println(sel);
    if(rs.next())
    {
        int qun=0;
        int qunt=Integer.parseInt(rs.getString("ssale_qun"));
        int qun1=0;
       String sell="select bsp_stock from tbl_branchspareparts where sp_id="+rs.getString("sp_id");
       ResultSet rss=obj.selectData(sell);
           System.out.println(sell);

       if(rss.next())
       {
           qun=rss.getInt("bsp_stock");
           qun1=qun+qunt;
           String up="update tbl_branchspareparts set bsp_stock='"+qun1+"' where sp_id="+rs.getString("sp_id");
           obj.ExecuteCommand(up);
           System.out.println(up);
       }
    }
 String delete="delete from tbl_spartssale where ssale_id="+request.getParameter("id");
      obj.ExecuteCommand(delete);
      %>
    