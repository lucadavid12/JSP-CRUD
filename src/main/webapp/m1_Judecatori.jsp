<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Judecatori</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<style>
    body {
      background-image: url("img/still-life-with-scales-justice\ \(1\).jpg");
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-size: cover;
      text-align: center;
    }
  </style>
<body>
	<h1 align="center">Tabela Judecatori:</h1>
	<br />
	<p align="center">
		<a href="nou_Judecator.jsp"><b>Adauga un nou judecator.</b></a> <a
			href="index.html"><b>Home</b></a>
	</p>
	<%
            jb.connect();
            int pmk = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("judecatori", "idjudecator", pmk);
            rs.first();
            
            String Nume = rs.getString("nume_judecator");
            String Prenume = rs.getString("prenume_judecator");
            
            rs.close();
            jb.disconnect();
        %>
	<form action="m2_Judecatori.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">IdJudecator:</td>
				<td><input type="text" name="idjudecator" size="30"
					value="<%= pmk%>" readonly /></td>
			</tr>
			<tr>
				<td align="right">Nume:</td>
				<td><input type="text" name="nume_judecator" size="30" value="<%= Nume%>" /></td>
			</tr>
			<tr>
				<td align="right">Prenume:</td>
				<td><input type="text" name="prenume_judecator" size="30"
					value="<%= Prenume%>" /></td>
			</tr>
		</table>
		<p align="center">
			<input type="submit" value="Modifica linia">
		</p>
	</form>
	<p align="center"">
		<a href="index.html"><b>Home</b></a> <br />
</body>
</html>
