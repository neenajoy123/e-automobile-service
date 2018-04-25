<%-- 
    Document   : Complaints
    Created on : Feb 15, 2018, 11:04:39 AM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Complaint</title>
    </head>
    <body>
        <%
        if(request.getParameter("btnsubmit")!=null)
        {
           
               String ins="insert into tbl_branchcomplaint(bcomp_name,bcomp_desc,comp_id,bcomp_date,branch_id) values('"+request.getParameter("txtcomp")+"','"+request.getParameter("txtdesc")+"','"+request.getParameter("ddlcomp")+"',curdate(),'"+session.getAttribute("Branch")+"')";
               boolean b=obj.ExecuteCommand(ins);
               if(b)
               {
                   %>
                   <script>
                       alert("Complaint Registered");
                        setTimeout(function(){window.location.href='Complaints.jsp'},100);
                   </script>
                   <%
               }
            
        }
        %>
        <form><br>
            <table align="center" border="1">
                <tr>
                    <th>
                        Select Company
                    </th>
                    <td>
                        <select name="ddlcomp" required="">
                            <option value="">--select--</option>
                            <%
                            String sele="select distinct c.comp_id,comp_name from tbl_company c inner join tbl_model m on c.comp_id=m.comp_id inner join tbl_branchmodel bm on bm.model_id=m.model_id where bm.branch_id="+session.getAttribute("Branch");
                            ResultSet rss=obj.selectData(sele);
                            while(rss.next())
                            {
                                %>
                                <option value="<%=rss.getString("comp_id")%>"><%=rss.getString("comp_name")%></option>
                            <%
                            }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>
                        Complaint Subject
                    </th>
                    <td>
                        <input type="text" name="txtcomp" required="">
                    </td>
                </tr>
                <tr>
                    <th>
                        Complaint Description
                    </th>
                    <td>
                        <textarea name="txtdesc" required=""></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Submit">
                        <input type="reset" name="btnreset" value="Reset">
                    </td>
                </tr>
            </table>
            <br>
            <br>
            <table align="center" border="1">
                <tr><th>SNo</th>
                    <th>Complaint Subject</th>
                    <th>Description</th>
                    <th>Branch Name</th>
                    <th>Date</th>
                    <th>Status</th>
                </tr>
                <%
                            int i=0;
                    String sel="select bcomp_name,bcomp_desc,bcomp_date,bcomp_status,comp_name from tbl_branchcomplaint c inner join tbl_company b on c.comp_id=b.comp_id where c.branch_id="+session.getAttribute("Branch");
                    ResultSet rs=obj.selectData(sel);
                   
                    while(rs.next())
                    {
                        i++;
                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><%=rs.getString("bcomp_name")%></td>
                            <td><%=rs.getString("bcomp_desc")%></td>
                             <td><%=rs.getString("comp_name")%></td>
                            <td><%=rs.getString("bcomp_date")%></td>
                           
                            <%
                            if(rs.getString("bcomp_status").equals("0"))
                            {
                                %>
                                <td>Pending</td>
                                <%
                            }
                            if(rs.getString("bcomp_status").equals("1"))
                            {
                                %>
                                <td>Complaint Viewed</td>
                                <%
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
