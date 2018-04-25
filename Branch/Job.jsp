<%-- 
    Document   : Jobs
    Created on : Feb 15, 2018, 10:59:19 AM
    Author     : ckc
--%>

<%@include file="Header.jsp" %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Jobs</title>
</head>
<%
        String jobID = ""; 
        String branchName = ""; 
        String jobname = "";
        String des="";
        String qual = "";
        String vac="";
        String salary="";
        String date = "";
        String exp= "";
        
        if (request.getParameter("btnsub") != null) 
        {
            //out.println(request.getParameter("hid"));

           if (!request.getParameter("hid").equals("")) 
           {
               
                String jobnamee = request.getParameter("txtjob");
                String dess = request.getParameter("txtdes");
                String l = request.getParameter("txtqual");
                String vacc = request.getParameter("txtvac");
                String salaryy = request.getParameter("txtsalary");
                String datee = request.getParameter("txtdate");
                String expp = request.getParameter("txtexp");
                


                String upQry = "update tbl_job set job_name ='" + jobname + "',job_description='"+des+"',job_qualification='"+qual+"',job_vaccancies='"+vac+"',job_salary='" + salary+ "',job_experience='" + exp + "',job_lastdate='" + date + "',branch_id='"+ request.getParameter("Branch") + "' where job_id='" + request.getParameter("hid") + "'";

               boolean b = obj.ExecuteCommand(upQry);
                if (b == true) 
                {
            out.println("Sucess");
           response.sendRedirect("Job.jsp");
                } 
                else 
                {
            out.println(upQry);
                      }
            } 
           else 
           {
               
              
               String jobnames = request.getParameter("txtjob");
               String dess=request.getParameter("txtdes");
               String quals = request.getParameter("txtqual");
               String vacs=request.getParameter("txtvac");
               String salarys=request.getParameter("txtsalary");
               String dates = request.getParameter("txtdate");
               String exps= request.getParameter("txtexp");
                
                String Unid = request.getParameter("branch");
                String insQuery = "insert into tbl_job (job_name,job_description,job_qualification,job_vaccancies,job_salary,job_experience,job_lastdate,branch_id) values('" + jobnames + "','" + dess + "','" + quals + "','" + vacs + "','" + salarys + "','" + exps + "','" + dates + "','"+session.getAttribute("Branch")+"')";
                boolean b = obj.ExecuteCommand(insQuery);

                if (b == true) 
                {
                    //out.println("success");
               response.sendRedirect("Job.jsp");
                } else 
                {
             out.println(insQuery);
                }

            }
        }
        if (request.getParameter("did") != null) 
        {
            String del = "delete from tbl_job where job_id='" + request.getParameter("did") + "'";
          boolean b = obj.ExecuteCommand(del);
          response.sendRedirect("Job.jsp");
        }
        if (request.getParameter("eid") != null) 
        {
            String selq = "select * from tbl_job j inner join tbl_branch b on j.branch_id=b.branch_id where j.job_id='" + request.getParameter("eid") + "'";

       ResultSet rs3 = obj.selectData(selq);

            while (rs3.next()) 
            {
            jobID = rs3.getString("job_id");
            jobname = rs3.getString("job_name");
            des=rs3.getString("job_description");
            qual= rs3.getString("job_qualification");
            salary= rs3.getString("job_salary");
           date= rs3.getString("job_date");
           vac=rs3.getString("job_vaccancies");
           exp=rs3.getString("job_experience");
           branchName=rs3.getString("branch_id");
            }

        }


    %>


   <body background="001.jpg">

    <form method="post">
        <br>
        <br>
        <br>
    <input type="hidden" name="hid" value="<%=jobID%>">
    
    <table align="center" border="1" style="color: black;width: 70%">

    
        
        
    
     <tr>
     <td>Job Name:</td>
     <td><input type="text" name="txtjob" required="" value="<%=jobname%>" /></td>
     </tr>
     
     <tr>
    <td> Description:</td>
     <td><input type="text" name="txtdes" required="" value="<%=des%>"/></td>
     </tr>
     
     <tr>
    <td> Minimum Qualification:</td>
     <td><input type="text" name="txtqual" required="" value="<%=qual%>"/></td>
     </tr>
     
     <tr>
    <td> Vaccancies:</td>
     <td><input type="text" name="txtvac" required="" value="<%=vac%>"/></td>
     </tr>
     
     
    <tr>
    <td> Experience:</td>
    <td><input type="text" name="txtexp" required="" value="<%=exp%>"/></td>
    </tr>
    
    <tr>
    <td> Salary:</td>
    <td><input type="text" name="txtsalary" required="" value="<%=salary%>" /></td>
    </tr>
    
    <tr>
    <td> Last Date:</td>
    <td><input type="date" name="txtdate" required="" value="<%=date%>" /></td>
    </tr>
    
    <tr>
    <td colspan="2" align="center"><input type="submit" name="btnsub" ></td>

    <td align="center" colspan="2"><input type="reset" name="btnreset"></td>
    </tr>
    
</table>
<table border="1" align="center">
<th>Sl No</th>
<th>Job</th>
<th>Description</th>
<th>Minimum Qualification</th>
<th>Vaccancies</th>
<th>Experience:</th>
<th>Salary</th>
<th>Last Date</th>


<%
int i = 1;
                    String sel2 = "select * from tbl_job j inner join tbl_branch b on j.branch_id=b.branch_id where b.branch_id='"+session.getAttribute("Branch")+"'";
ResultSet rs2 = obj.selectData(sel2);
                    while (rs2.next()) {
                %>
<tr>
<td><%=i%></td>


<td><%=rs2.getString("job_name")%></td>
<td><%=rs2.getString("job_description")%></td>
<td><%=rs2.getString("job_qualification")%></td>
<td><%=rs2.getString("job_vaccancies")%></td>
<td><%=rs2.getString("job_experience")%></td>
<td><%=rs2.getString("job_salary")%></td>
<td><%=rs2.getString("job_lastdate")%></td>

<td><a href="Job.jsp?eid=<%=rs2.getString("job_id")%>">EDIT</a></td><br>

<td><a href="Job.jsp?did=<%=rs2.getString("job_id")%>">Delete</a></td>

</tr>
<%
                        i++;
                    }
                %>

</table>

</form>
</body>
</html>
