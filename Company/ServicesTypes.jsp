<%-- 
    Document   : Services
    Created on : Feb 15, 2018, 11:01:50 AM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service types</title>
    </head>
    <body>
        <form>
            <% 
                String eid="";
                String model="";
                String service="";
                String feature="";
                if(request.getParameter("eid")!=null)
                {
                    eid=request.getParameter("eid");
                    String sel="select servicetype_name,model_id,servicetype_features from  tbl_servicetype where servicetype_id="+eid;
                    ResultSet rs=obj.selectData(sel);
                    if(rs.next())
                    {
                        service=rs.getString("servicetype_name");
                        model=rs.getString("model_id");
                         feature=rs.getString("servicetype_features");
                    }
                }
                if(request.getParameter("did")!=null)
                {
                    String delete="delete from tbl_servicetype where servicetype_id="+request.getParameter("did");
                    boolean b=obj.ExecuteCommand(delete);
                    if(b)
                    {
                        %>
                        <script>
                            alert("Deleted");
                        </script>
                        <%
                    }
                }
                if(request.getParameter("btnsubmit")!=null)
                {
                    if(!request.getParameter("hid").equals(""))
                    {
                        String update="update tbl_servicetype set servicetype_name='"+request.getParameter("txtservice")+"',model_id='"+request.getParameter("ddlmodel")+"',servicetype_features='"+request.getParameter("txtfeature")+"' where servicetype_id='"+request.getParameter("hid")+"'";
                        boolean b=obj.ExecuteCommand(update);
                        if(b)
                        {
                            %>
                         
                            <script>
                                alert("Updated");
                            </script>
                         
                            <%
                        }
                    }
                    else
                    {
                    String ins="insert into tbl_servicetype(servicetype_name,model_id,servicetype_features) values('"+request.getParameter("txtservice")+"','"+request.getParameter("ddlmodel")+"','"+request.getParameter("txtfeature")+"')";
                    boolean b=obj.ExecuteCommand(ins);
                    if(b)
                    {
                        %>
                        <script>
                            alert("Inserted");
                        </script>
                        <%
                    }
                    }
                    
                }
            
            %>
            <br>
            <br>
            <br>
            <table align="center" border="1">
                <tr>
                    <th>Model
                        <input type="hidden" name="hid" value="<%=eid%>"></th>
                    <td>
                        <select name="ddlmodel" required="">
                            
                            <option value="">
                                --select--
                            </option>
                            <%
                                String sel="select model_id,model_name from tbl_model where comp_id="+session.getAttribute("company");
                                ResultSet rs=obj.selectData(sel);
                                while(rs.next())
                                {
                                    %>
                                    <option <%if(model.equals(rs.getString("model_id"))){%>selected="" <%}%>value="<%=rs.getString("model_id")%>"><%=rs.getString("model_name")%></option>
                                    <%
                                }
                                
                            
                            %>
                        </select>
                    </td>
                </tr>
                <tr>

                    <th>Service type</th>
                    <td><input type="text" name="txtservice" value="<%=service%>" required=""></td>
                </tr>
                <tr>
                    <th>Features</th>
                    <td><textarea name="txtfeature" required=""><%=feature%></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Submit">
                        <input type="reset" name="btnreset" value="Cancel">
                    </td>
                </tr>
            </table>
                        
                        <br>
                        <br>
                        
                        <table align="center">
                            <tr>
                                <th>SNo</th>
                                <th>Model</th>
                                <th>Service Type</th>
                                <th>Features</th>
                            </tr>
                            <%
                                int i=0;
                                String sel1="select servicetype_name,servicetype_features,servicetype_id,model_name from tbl_servicetype st inner join tbl_model m on m.model_id=st.model_id where m.comp_id="+session.getAttribute("company");
                                ResultSet rs1=obj.selectData(sel1);
                                while(rs1.next())
                                {
                                  i++;
                                  %>
                                    <tr>
                                        
                                        <td><%=i%></td>
                                        <td><%=rs1.getString("model_name")%></td>
                                        <td><%=rs1.getString("servicetype_name")%></td>
                                        <td><%=rs1.getString("servicetype_features")%></td>
                                        <td><a href="ServicesTypes.jsp?eid=<%=rs1.getString("servicetype_id")%>">Edit</a></td>
                                        <td><a href="ServicesTypes.jsp?did=<%=rs1.getString("servicetype_id")%>">Delete</a></td>
                                       
                                    </tr>
                                    <%
                                }
                            %>
                            
                        </table>
        </form>
    </body>
</html>
