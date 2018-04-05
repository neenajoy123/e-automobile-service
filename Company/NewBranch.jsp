<%-- 
    Document   : NewCompany
    Created on : Feb 21, 2018, 1:39:02 PM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Branch</title>
    </head>
    <body>
        <%
               String Branchid="";
               String Branchname="";
               String Address="";
               String Contact="";
               String Email="";
               String Startdate="";
               String Runby="";
               String placeid="";
               String a="";
               String Status="";
               
               
        if(request.getParameter("eid")!=null)
        {
          String upd="update tbl_branch set branch_status=1 where branch_id='"+request.getParameter("eid")+"'";
          boolean b=obj.ExecuteCommand(upd);
          
        
         
           if(b)
          {
              response.sendRedirect("NewBranch.jsp");
          }
          else
          {
              out.print(upd);
          }
        }
         if(request.getParameter("did")!=null)
        {
             
             String SEL="SELECT * from tbl_branch where branch_id='" + request.getParameter("did") + "'";
                ResultSet rs=obj.selectData(SEL);
                while(rs.next())
                {
                  a=rs.getString("login_id");
                    
                }
                String del="delete from tbl_login where login_id='" +a+ "'";
                boolean b1 = obj.ExecuteCommand(del);
             
          String delk="delete from tbl_branch where branch_id='" + request.getParameter("did") + "'";
          boolean b=obj.ExecuteCommand(delk);
          if(b)
          {
              response.sendRedirect("NewBranch.jsp");
          }
          else
          {
              out.print(del);
          }
        }        
    %>

        <form>
            
                   <table class="table table-hover" align="center" border="2">
                       <tr><td>Sl no</td><td>Name</td><td>Address</td><td>Contact Number</td><td>place</td><td>Email</td><td>Start Date</td><td>Run By</td>
                       </tr>
                   
                     <% int i=1;
    String str="select * from tbl_branch where branch_status=0";
    ResultSet rs=obj.selectData(str);
    while(rs.next())
    {
     %>
     <tr>
         <td><%=i%></td>
         <td><%=rs.getString("branch_name")%></td>
         <td><%=rs.getString("branch_address")%></td>    
         <td><%=rs.getString("branch_contact")%></td>
         <td><%=rs.getString("place_id")%></td>
         <td><%=rs.getString("branch_email")%></td>
         <td><%=rs.getString("branch_startdate")%></td>
         <td><%=rs.getString("branch_runby")%></td>
        
          
         
         
         <td><a href="NewBranch.jsp?eid=<%=rs.getString("branch_id")%>">APPROVE</a></td>
     <td><a href="NewBranch.jsp?did=<%=rs.getString("branch_id")%>">REJECTED</a></td></tr>
             
   
    <%
    i++;
    }
    %>
  

                   
                   
                   </table>
            
            
            
            
            
        </form>
    </body>
</html>
               
               
              
               
               
               