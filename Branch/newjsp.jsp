<%-- 
    Document   : newjsp
    Created on : Mar 20, 2018, 10:58:59 AM
    Author     : ckc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
            <table align="center" border="1">
                <tr>
                    <td>Id</td>
                    <td>Model</td>
                    <td>Quantity</td>
                    <td>Rate</td>
                    <td>Unit Rate</td>
                </tr>
                
                
                <tr>
                    <td>
                        <input type="button" name="btn" value="Remove"></td>
                </tr>
                
                  </table>
            <br>
        
           <table align="center">
           <tr>
                    <th>Grand Total</th>
                    <td><input type="text" name="txttotal"></td>
                </tr>
            </table>
            <br>
            <table align="center">
                <tr>
                    <td>
                     <input type="button" name="btn" value="Save">  
                    </td>
                </tr>
            </table>
             </form>
    </body>
</html>
