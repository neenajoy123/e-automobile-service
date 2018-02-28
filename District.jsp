<%-- 
    Document   : District
    Created on : Feb 7, 2018, 11:37:25 AM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District</title>
    </head>
    <body>
      
      
    <%
        String Districtid="";
        String Districtname="";
        String disid=""; 
        String disname="";
        
        if(request.getParameter("editid")!=null)
        {
            String sel="select * from tbl_district where dis_id='"+request.getParameter("editid")+"'";
            ResultSet rs=obj.selectData(sel);
            if(rs.next())
            {
                disid=rs.getString("dis_id");
                disname=rs.getString("dis_name");
            }
        }
        if(request.getParameter("did")!=null)
        {
            String del="delete from tbl_district where dis_id='"+request.getParameter("did")+"'";
            obj.ExecuteCommand(del);
            
        }
        
        if(request.getParameter("btnsubmit")!=null)
            
        {
            Districtname=request.getParameter("txtname");
            if(request.getParameter("hid")!="")
            {
                String up="update tbl_district set dis_name='"+Districtname+"' where dis_id='"+request.getParameter("hid")+"'";
                boolean b=obj.ExecuteCommand(up);
                if(b)
                {
                    response.sendRedirect("District.jsp");
                }
                else
                {
                    out.println(up);
                    
                }
                }
            else
            {
              
            
           String insQry="insert into tbl_district(dis_name)values('"+Districtname+"')";
        
        out.println(insQry);
        boolean b1=obj.ExecuteCommand(insQry);
        if(b1){
            response.sendRedirect("District.jsp");
        }
        else
        {
            out.println(insQry);
        }
            }
        }
    %>
    <center><h1>District</h1></center> 
    <form>
        
        <input type="hidden"  value="<%=disid%>" name="hid">
        <table align="center" border="1">
          <tr>
              <td>
                  District name
              </td>
              <td>
                  <input type="text" value="<%=disname%>" name="txtname">
              </td>
              </tr>
          <tr>
              <td colspan="2" align="center">
                  <input type="submit" name="btnsubmit" value="submit">
                  
              </td>
    </tr>
    
        </table>
              <br>
              <br>
        <table align="center" border="1">
        <tr>
            <td>
                 Sl.No
            </td>
           
   
        <td>
            district name
        </td>
           
        </tr>
      <%
        int i=1;
                String selQry="select * from tbl_district";
                ResultSet rs=obj.selectData(selQry);
                while(rs.next())
                    
                {
                    String disID=rs.getString("dis_id");
          %>
                <tr><td><%=i%></td>
                    <td><%=rs.getString("dis_name")%></td>
                    <td><a href="District.jsp?did=<%=disID%>">Delete</a>
                   <a href="District.jsp?editid=<%=disID%>">Edit</a></td></tr>
                <%
                i++;
                }
                
                
                %>
                
                
            </table>
         
                
    </form>
    </body>
</html>

               
                
        