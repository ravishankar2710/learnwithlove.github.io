<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>

<%@ page import="java.util.*"%>
<%
String uid = (String)session.getAttribute("user_id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "eagri";
String userid = "root";
String password = "Bhargavi@1276";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<link href="st.css" rel="stylesheet" type="text/css" />
<style>
    body{
    margin: 0;
    padding: 0;
    background: url(loan.jpeg);
    background-size: cover;
    background-position: center;
    font-family: sans-serif;}
</style>
<body>
    <pre>










    </pre>
    <div class="trnsp">
<table border="1" class="tabla">
<%
try{
    Class.forName("com.mysql.jdbc.Driver");

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eagri","root","Bhargavi@1276");
String sql ="select loan.loan_id,loan.loan_amount,loan.loan_type from loan,Farmer_Loan where loan.loan_id=Farmer_Loan.loan_id and Farmer_Loan.user_id=?";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1,uid);
resultSet =ps.executeQuery();
while(resultSet.next()){
%>
<tr>
<td>Loan Id: </td><td><%=resultSet.getString("loan_id") %></td></tr>
<tr><td>Loan type:</td><td><%=resultSet.getString("loan_type") %></td></tr>
<tr><td>Loan amount:</td><td><%=resultSet.getString("loan_amount") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>