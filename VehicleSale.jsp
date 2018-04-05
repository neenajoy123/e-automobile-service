<%-- 
    Document   : VehiclePurchase
    Created on : Mar 13, 2018, 3:33:22 PM
    Author     : ckc
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vehicle Sale</title>
        <script src="jquery.js" type="text/javascript"></script>
        <script>
            function fillTable()
            {
                 $.ajax(
                    {
                        url: "ajaxsaleFillTable.jsp",
                        success: function(result)
                        {
                          $("#filltab").html(result);
                        }
                    });
            }
            
            function getModel(u)
            {
            $.ajax(
                    {
                        url: "AjaxVehicleSale.jsp?id="+ u,
                        success: function(result)
                        {
                           $("#model").html(result);
                        }
                    });
        }
        function getPrice(u)
        {
//            alert(u);
            $.ajax(
                    {
                        url: "AjaxsalegetPrice.jsp?id="+ u,
                        success: function(result)
                        {
                          $("#price").html(result);
                        }
                    });
        }
        function calcTotal(u)
        {
           
           var a=document.getElementById("model").value;
           
//            alert("model"+a+",qun"+u);
           
              $.ajax(
                    {
                        url: "AjaxsaleUnitPrice.jsp",
                        data: {model:a,qun:u},
                        success: function(result)
                        {
                           $("#tot").html(result);
                        }
                    });
        }
        function insertItems()
        {
            var model=document.getElementById("model").value;
            var qun=document.getElementById("qun").value;
            
              $.ajax(
                    {
                        url: "Ajax_saleinsertItem.jsp",
                        data: {model:model,qun:qun},
                        success: function(result)
                        {
                           fillTable();
                        }
                    });
        }
        function vehInsert()
        {
            var inv=document.getElementById("hinvoice").value;
            var date=document.getElementById("hdate").value;
            var comp=document.getElementById("company").value;
//            var model=document.getElementById("model").value;
//            var qun=document.getElementById("qun").value;
            var des=document.getElementById("txtdes").value;
            
              $.ajax(
                    {
                        url: "ajax_salevehicleInsert.jsp",
                        data: {invoice:inv,date:date,comp:comp,des:des},
                        success: function(result)
                        {
                           insertItems();
                        }
                    });
        }
        function deleteMethod(a)
        {
            $.ajax(
                    {
                        url:"ajaxsaledelete.jsp?id="+a,
                        success:function(result)
                        {
                           fillTable();
                        }
                    });
        }
        </script>
    </head>
    <body>
        <%
            // Creating Invoice No
            String no="0";
            String sel="select MAX(vsh_invoiceno) as invoice from tbl_vehiclesalehead where branch_id="+session.getAttribute("Branch");
            ResultSet rs=obj.selectData(sel);
            if(rs.next())
            {
                no=rs.getString("invoice");
                if(no==null)
                {
                    no="100";
                }
                else
                {
                    no=""+(Integer.parseInt(no)+1);
                }
            }
            
            // Selecting Date
            
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            Date date=new Date();
        %>
        <h1>Vehicle Sale</h1>
        <form>
            <%
                if(request.getParameter("btnsave")!=null)
                {
                    String total=request.getParameter("gtotal");
                    String update="update tbl_vehiclesalehead set vsh_gtotal='"+total+"' where vsh_id="+session.getAttribute("vsh");
                    boolean b=obj.ExecuteCommand(update);
                    if(b)
                    {
                        %>
                        <script>
                            alert("Saved");
                        </script>
                        <%
                    }
                }
            %>
            <table align="center" border="1">
                <tr>
                    <th>
                        Invoice No
                    </th>
                    <td>
                        <%=no%>
                        <input type="hidden" name="hinvoice" id="hinvoice" value="<%=no%>">
                    </td>
                    
                    <th>
                       Date 
                    </th>
                    <td>
                        <%=sdf.format(date)%>
                        <input type="hidden" name="hdate" id="hdate" value="<%=sdf.format(date)%>">
                    </td>
                </tr>
                <tr>
                    <th>
                        Customer
                    </th>
                    <td>
                        <select name="customer" id="cus" required="">
                           <option value="">
                                --select--
                            </option>
                            <%
                            String sel1="select cus_name,cus_id from tbl_customer";
                            ResultSet rs11=obj.selectData(sel1);
                            while(rs11.next())
                            {
                                %>
                                <option value="<%=rs11.getString("cus_id")%>"><%=rs11.getString("cus_name")%></option>
                                <%
                            }
                            
                            %>
                            
                                                 
                        </select>
                   </td>
                </tr>
                <tr>
                    <th>
                        Company
                    </th>
                <td>
                         <select name="company" id="company" onchange="getModel(this.value)">
                             <option value="">
                                --select--
                            </option>
                            
                             <%
                            String str1="select * from tbl_company";
                            ResultSet rs1=obj.selectData(str1);
                            while (rs1.next())
                            {
                           %>
                           <option value="<%=rs1.getString("comp_id")%>">
                               <%=rs1.getString("comp_name")%>
                           </option>
                            <%
                            }
                            %>
                            
                        </select><br> 
                    </td>
                    
                           <th>
                               Description
                           </th>
                           <td>
                               <input type="text" name="txtdes" id="txtdes">
                           </td>
                      
                
                </tr>
                    
                 <tr>
                    <th>
                        Model Name
                    </th>
                   
                    <td>
                        <select name="model" id="model" required="" onchange="getPrice(this.value)">
                           <option value="">
                                --select--
                            </option>
                            
                                                 
                        </select>
                   </td>
               
               
                       
                          
                           <th>
                               Rate
                           </th>
                           <td>
                               <div id="price"></div>
                               <input type="hidden" name="txtprice" id="price">
                           </td>
                 </tr>
                 <tr>
                            <th>
                               Quantity
                           </th>
                           <td>
                               <input type="text" name="txtquan" id="qun" onblur="calcTotal(this.value)">
                           </td>
                       
                      
                           <th>
                             Total Amount  
                           </th>
                           <td >
                               <div id="tot"></div>
                               <input type="hidden" name="txttotal" id="tot">
                           </td>
                       </tr>
                       
                       <tr>
              <td colspan="2" align="center">
                  <input type="button" name="btnsubmit" value="ADD" onclick="vehInsert()">
                 
              </td>
    </tr>

            </table>
                            <br>
                            <div id="filltab"></div>
        </form> 
    </body>
</html>
