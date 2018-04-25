<%-- 
    Document   : ViewVehicleServiceStatus
    Created on : 24 Apr, 2018, 1:45:17 PM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vehicle Service Status</title>
    </head>
    <body>
        <form>
        <%
            if(request.getParameter("btnsubmit")!=null)
            {
                String update="update tbl_service set service_finalcharge='"+request.getParameter("txtamt")+"',service_vehstatus=3 where service_id="+request.getParameter("hid");
                boolean b=obj.ExecuteCommand(update);
                if(b)
                {
                    response.sendRedirect("ViewVehicleServiceStatus.jsp");
                }
            }
            
            if(request.getParameter("id")!=null)
            {
                %>
                <br>
                <table align='center' border='2'> 
                    <tr>
                    <input type="hidden" name="hid" value="<%=request.getParameter("id")%>">
                        <th>Enter final charge:</th>
                        <td><input type="text" name='txtamt' required=""></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" name="btnsubmit" value="Submit">
                            <input type="reset" name="btnreset" value="Cancel">
                        </td>
                    </tr>
                </table>
                <%
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
                    <th>Expected Amount</th>
                    <th>Days Require</th>
                    <th>Status</th>
                </tr>
              
                    <%
                        int i=0;
                        String sel="select service_charge,service_days,service_paystatus,service_vehstatus,service_id,cus_name,cus_con_no,place_name,service_date,service_vregno,service_desc,servicetype_name,model_name,comp_name from tbl_customer c inner join tbl_place p on p.place_id=c.place_id inner join tbl_service s on s.cus_id=c.cus_id inner join tbl_servicetype st on st.servicetype_id=s.servicetype_id inner join tbl_model m on s.model_id=m.model_id inner join tbl_company cm on cm.comp_id=m.comp_id where s.service_status=1 and s.branch_id='"+session.getAttribute("Branch")+"'";
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
                                 <td><%=rs.getString("service_charge")%></td>
                                 <td><%=rs.getString("service_days")%></td>
                                 
                                <%
                                if(rs.getString("service_vehstatus").equals("0"))
                                {
                                    %>
                                    <td>Waiting for customer's conformation</td>
                                    <%
                                }
                                else if(rs.getString("service_vehstatus").equals("1"))
                                {
                                    %>
                                    <td>work in progress</td>
                                    <td><a href="ViewVehicleServiceStatus.jsp?id=<%=rs.getString("service_id")%>">change status to completed</a></td>
                                    <%
                                }
                                else if(rs.getString("service_vehstatus").equals("2"))
                                {
                                    %>
                                    <td>Rejected by customer</td>
                                   
                                    <%
                                }
                                 else if(rs.getString("service_vehstatus").equals("3"))
                                {
                                    %>
                                    <td>Work completed</td>
                                   
                                    <%
                                    if(rs.getString("service_paystatus").equals("0"))
                                    {
                                       %>
                                    <td>Waiting for Payment</td>
                                   
                                    <% 
                                    }
                                    else if(rs.getString("service_paystatus").equals("1"))
                                    {
                                       %>
                                    <td>Payment Completed</td>
                                   
                                    <% 
                                    }
                                }
                                %>
                                
                                
                            </tr>
                            <%
                        }
                        
                    %>
              
                
            </table>

        </form>
    </body>
</html>
