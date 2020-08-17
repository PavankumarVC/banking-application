<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>controller</title>
</head>
<body>
<form action="fundTransfer.jsp" method="post">
<table>
<%
Connection con =null ;
ResultSet rs = null ;
String fromacc = request.getParameter("fromacc");
String toacc = request.getParameter("toacc");
String amt = request.getParameter("pavan");
%>
<tr>
<td>accountno</td>
<td>balance</td>
</tr>

<%
try{  
Class.forName("com.mysql.jdbc.Driver");  
 con=DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/bankapp","root","Mysql_root");
String sql = "update transfer set balance=balance-"+Integer.parseInt(amt)+" where accno = '"+fromacc+"' " ;
PreparedStatement ps=con.prepareStatement(sql) ; 
ps.execute();
String sql1 = "update transfer set balance=balance+"+Integer.parseInt(amt)+" where accno = '"+toacc+"'" ;
PreparedStatement ps1=con.prepareStatement(sql1) ; 
ps1.execute();

}
catch(Exception e){
	e.printStackTrace();
}
response.sendRedirect("index.jsp");
%>

</table>

</form>
</body>
</html>