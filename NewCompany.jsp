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
        <title>New Company</title>
    </head>
    <body>
        <%
               String Compid="";
               String Compname="";
               String Address="";
               String Contact="";
               String Email="";
               String Startdate="";
               String Logo="";
               String Status="";
               
               String placeid="";
               String a="";
               
               
                if(request.getParameter("eid")!=null)
        {
          String upd="update tbl_company set comp_status=1 where comp_id='"+request.getParameter("eid")+"'";
          boolean b=obj.ExecuteCommand(upd);
          
        
         
           if(b)
          {
              response.sendRedirect("NewCompany.jsp");
          }
          else
          {
              out.print(upd);
          }
        }
         if(request.getParameter("did")!=null)
        {
             
             String SEL="SELECT * from tbl_company where comp_id='" + request.getParameter("did") + "'";
                ResultSet rs=obj.selectData(SEL);
                while(rs.next())
                {
                  a=rs.getString("login_id");
                    
                }
                String del="delete from tbl_login where login_id='" +a+ "'";
                boolean b1 = obj.ExecuteCommand(del);
             
          String delk="delete from tbl_company where comp_id='" + request.getParameter("did") + "'";
          boolean b=obj.ExecuteCommand(delk);
          if(b)
          {
              response.sendRedirect("NewCompany.jsp");
          }
          else
          {
              out.print(del);
          }
        }        
    %>

        <form>
            
                   <table class="table table-hover" align="center" border="2">
                       <tr><td>Sl no</td><td>Name</td><td>Address</td><td>Contact Number</td><td>Email</td><td>Start Date</td><td>Logo</td>
                       </tr>
                   
                     <% int i=1;
    String str="select * from tbl_company where comp_status=0";
    ResultSet rs=obj.selectData(str);
    while(rs.next())
    {
     %>
     <tr>
         <td><%=i%></td>
         <td><%=rs.getString("comp_name")%></td>
         <td><%=rs.getString("comp_address")%></td>    
         <td><%=rs.getString("comp_con_no")%></td>
         <td><%=rs.getString("comp_email")%></td>
         <td><%=rs.getString("comp_start_date")%></td>
         <td><img src="../Company/Logo/<%=rs.getString("comp_logo")%>" height="100" width="100"></td>
          
         
         
         <td><a href="NewCompany.jsp?eid=<%=rs.getString("comp_id")%>">APPROVE</a></td>
     <td><a href="NewCompany.jsp?did=<%=rs.getString("comp_id")%>">REJECTED</a></td></tr>
             
   
    <%
    i++;
    }
    %>
  

                   
                   
                   </table>
            
            
            
            
            
        </form>
    </body>
</html>
               
               
              