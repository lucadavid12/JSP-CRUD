<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Procese</title>
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
	<h1 align="center">Tabela Procese:</h1>
	<br />
	<p align="center">
		<a href="nou_Proces.jsp"><b>Adauga un nou Proces.</b></a> <a
			href="index.html"><b>Home</b></a>
	</p>
		<%
			jb.connect();
			int pmk = java.lang.Integer.parseInt(request.getParameter("primarykey"));
			ResultSet rs = jb.intoarceLinieDupaId("procese", "idproces", pmk);
			rs.first();
			
			String NumeR = request.getParameter("nume_reclamant");
			String PrenumeR = request.getParameter("prenume_reclamant");
			String NumeP = request.getParameter("nume_parat");
			String PrenumeP = request.getParameter("prenume_parat");
			String data = request.getParameter("data_proces");
			String obiect = request.getParameter("obiectul_cauzei");
			
			rs.close();
			jb.disconnect();
		%>
	<form action="m2_Procese.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">IdProces:</td>
				<td><input type="text" name="idproces" size="30"
					value="<%=pmk%>" readonly /></td>
			</tr>
			<tr>
				<td align="right">Nume reclamant:</td>
				<td><input type="text" name="nume_reclamant" size="30"
					value="<%=NumeR%>" /></td>
			</tr>
			<tr>
				<td align="right">Prenume reclamant:</td>
				<td><input type="text" name="prenume_reclamant" size="30"
					value="<%=PrenumeR%>" /></td>
			</tr>
			<tr>
				<td align="right">Nume parat:</td>
				<td><input type="text" name="nume_parat" size="30"
					value="<%=NumeR%>" /></td>
			</tr>
			<tr>
				<td align="right">Prenume parat:</td>
				<td><input type="text" name="prenume_parat" size="30"
					value="<%=PrenumeR%>" /></td>
			</tr>
			<tr>
				<td align="right">Data proces:</td>
				<td><input type="text" name="data_proces" size="30"
					value="<%=NumeR%>" /></td>
			</tr>
			<tr>
				<td align="right">Obicetul cauzei:</td>
				<td><input type="text" name="obiectul_cauzei" size="30"
					value="<%=PrenumeR%>" /></td>
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
