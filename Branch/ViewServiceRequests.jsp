<%-- 
    Document   : ViewServiceRequests
    Created on : 17 Apr, 2018, 1:45:15 PM
    Author     : user
--%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Service Requests</title>
    </head>
    <body>
        <br>
        <form>
        <%
            if(request.getParameter("rid")!=null)
            {
                String update="update tbl_service set service_status=2 where service_id="+request.getParameter("rid");
                boolean b=obj.ExecuteCommand(update);
                if(b)
                {
                    %>
                    <script>
                        alert("Rejected");
                    </script>
                    <%
                }
            }
            if(request.getParameter("aid")!=null)
            {
                session.setAttribute("serviceID", request.getParameter("aid"));
                response.sendRedirect("UpdateServiceDetails.jsp");
            }
            
        %>
        
            <br>
            <br>
            <table align="center" border="1">
                <tr>
                    <th>S.No</th>
                    
                    <th>Company</th>
                    <th>Model</th>
                    <th>Service Type</th>
                    <th>Service Description</th>
                    <th>Vehicle RegNo</th>
                    <th>Customer</th>
                    <th>Contact</th>
                    <th>Place</th>
                </tr>
              
                    <%
                        int i=0;
                        String sel="select service_id,cus_name,cus_con_no,place_name,service_date,service_vregno,service_desc,servicetype_name,model_name,comp_name from tbl_customer c inner join tbl_place p on p.place_id=c.place_id inner join tbl_service s on s.cus_id=c.cus_id inner join tbl_servicetype st on st.servicetype_id=s.servicetype_id inner join tbl_model m on s.model_id=m.model_id inner join tbl_company cm on cm.comp_id=m.comp_id where s.service_status=0 and s.branch_id='"+session.getAttribute("Branch")+"'";
                        ResultSet rs=obj.selectData(sel);
                        while(rs.next())
                        {
                            i++;
                            %>
                            <tr>
                                <td><%=i%></td>
                               
                                <td><%=rs.getString("comp_name")%></td>
                                <td><%=rs.getString("model_name")%></td>
                                <td><%=rs.getString("servicetype_name")%></td>
                                <td><%=rs.getString("service_desc")%></td>
                                <td><%=rs.getString("service_vregno")%></td>
                                <td><%=rs.getString("cus_name")%></td>
                                <td><%=rs.getString("cus_con_no")%></td>
                                <td><%=rs.getString("place_name")%></td>
                                <td><a href="ViewServiceRequests.jsp?aid=<%=rs.getString("service_id")%>">Accept</a></td>
                                <td><a href="ViewServiceRequests.jsp?rid=<%=rs.getString("service_id")%>">Reject</a></td>
                            </tr>
                            <%
                        }
                        
                    %>
              
                
            </table>
        </form>
    </body>
</html>
