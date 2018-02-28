<%-- 
    Document   : EditProfile
    Created on : Feb 22, 2018, 1:50:23 PM
    Author     : ckc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
    
        
        String Compname="";
        String Address="";
        String Conno="";
        String Email="";
        String Uname="";
        String logid="";
        String sel="select * from tbl_company c inner join tbl_login l on c.login_id=l.login_id  where comp_id='"+session.getAttribute("company")+"'";
        ResultSet rs1=obj.selectData(sel);
        if(rs1.next())
        {
            
            Compname=rs1.getString("comp_name");
            Address=rs1.getString("comp_address");
            Conno=rs1.getString("comp_con_no");
            Email=rs1.getString("comp_email");
            Uname=rs1.getString("login_username");
            logid=rs1.getString("login_id");
        }
        
        
         if(request.getParameter("btn_submit")!=null)
            
        {
          
            Compname =request.getParameter("txtname");
            Address =request.getParameter("txtaddress");
            Conno =request.getParameter("txtcon");
            Email =request.getParameter("txtemail");
            Uname=request.getParameter("txtuname");
            logid=request.getParameter("hid");
            String update="update tbl_login set login_username='"+Uname+"' where login_id="+logid;
            boolean bb=obj.ExecuteCommand(update);
            if(bb==true)
            {
        String up="update tbl_company set comp_name='"+Compname+"',comp_address='"+Address+"',comp_con_no='"+Conno+"',comp_email='"+Email+"' where comp_id='"+session.getAttribute("company")+"'";
                boolean b=obj.ExecuteCommand(up);
                if(b)
                {
                    response.sendRedirect("EditProfile.jsp");
                }
                else
                {
                    out.println(up);
                    
                }
                
            }
        }
       
           
        
       
        
        %>
                 
           <center><h1>Edit Profile</h1></center>
    <form>
        <table align="center" border="1">
            <tr>
                <th>
                    Company Name
                </th>
                <td>
                    <input type="text" name="txtname" value="<%=Compname%>" required="">
                </td>
                            
                            
            </tr>
               <tr>
                   <th> 
                       Address
                   </th>
                   <td>
                       <textarea name="txtaddress" required=""><%=Address%></textarea> 
                   </td>
            </tr>
            <tr>
                <th>
                    Contact No
                </th>
                <td>
                    <input type="text" name="txtcon" value="<%=Conno%>" required="">
                </td>
                
            </tr>
            <tr>
                 <th>
                    Email
                </th>
                <td>
                    <input type="text" name="txtemail" value="<%=Email%>" required="">
                    <input type="hidden" name="hid" value="<%=logid%>">
                </td>
                
            </tr>
            <tr>
                 <th>
                    UserName
                </th>
                <td>
                    <input type="text" name="txtuname" value="<%=Uname%>" required="">
                </td>
                
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btn_submit" value="SUBMIT">
                    <input type="reset" name="btn_reset" value="CANCEL">
                </td>
            </tr>
                   </table>
    </form>
    </body>
</html>
