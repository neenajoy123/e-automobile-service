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
    String ins="insert into tbl_vehiclesale(vsh_id,model_id,vsale_rate,vsale_utotal,vsale_quantity) values('"+session.getAttribute("vsh")+"','"+model+"','"+session.getAttribute("rate")+"','"+session.getAttribute("utotal")+"','"+qun+"')";
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
            if(stock1<qun1)
            {
                %>
                <script>
                    alert("Insufficient Stock");
                </script>
                <%
            }
            else
            {
            totstock=stock1-qun1;
            String update="update tbl_branchmodel set bmodel_stock='"+totstock+"' where bmodel_id="+rs.getString("bmodel_id");
            obj.ExecuteCommand(update);
            System.out.println(update);
            }
        }
        else
        {
            %>
            <script>
                alert("Stock is unavailable");
            </script>
            <%
        }
    }

%>
