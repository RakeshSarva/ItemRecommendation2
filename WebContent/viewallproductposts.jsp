<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.lang.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	.pic{
		width:150px;
		height:150px;
	}
	.whole{
		width:400px;
		height:400px;
		border:2px solid black;
		background-color:lightgray;
		color:black;
		margin:20px;
		flex-direction:row;
	}
	td{
		margin:auto;
	}
	.hlo{
		flex-direction:row;
		padding:10px;
	}
	img{
		width:250px;
		height:150px;
		margin-top:20px;
		margin-bottom:20px;
	}
	.whole{
		padding-left:40px;
	}
	
</style>
</head>
<body>
	<% 
	try
	{
	ResultSet resultSet;
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/unisoft","root","root");
	Statement st = con.createStatement();
	String sql = "select * from productdetails";
	resultSet = st.executeQuery(sql);
	int id;
	while(resultSet.next())
	{	
		id=resultSet.getInt("id");
		System.out.println(id);
	%>
		<div class="hlo">
			<table class="whole">
				<tr>
					<td class="pic"><img src="AccessImage?id=<%=id%>" alt="image"></td>
				</tr>
				<tr>
					<td>Name:  <%=resultSet.getString("name")%></td>
				</tr>
				<tr>
					<td>Weight:  <%=resultSet.getString("weight")%></td>
				</tr>
				<tr>
					<td>Item color:  <%=resultSet.getString("itemcolor")%></td>
				</tr>
				<tr>
					<td>Category:  <%=resultSet.getString("category")%></td>
				</tr>
				<tr>
					<td>Quality:  <%=resultSet.getString("quality")%></td>
				</tr>
				<tr>
					<td>Manufacture date:  <%=resultSet.getString("manufacturedate")%></td>
				</tr>
				<tr>
					<td>Item cost:  <%=resultSet.getString("itemcost")%></td>
				</tr>
			</table>
		</div>
	<%
	//id++;
	}
	con.close();
	}
	catch(Exception e){
		out.println(e);
	}
	%>

</body>
</html>