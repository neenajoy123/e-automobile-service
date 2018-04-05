<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
   <option>--Select--</option>
<%
    String id=request.getParameter("id");
                            String str="select * from tbl_model where comp_id="+id;
                            ResultSet rs1=obj.selectData(str);
                            while (rs1.next())
                            {
                           %>
                           <option value="<%=rs1.getString("model_id")%>"> 
                               <%=rs1.getString("model_name")%>
                           </option>
                            <%
                            }
                            %>

