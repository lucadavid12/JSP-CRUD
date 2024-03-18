<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga proces</title>
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
	<%
            String NumeR = request.getParameter("nume_reclamant");
            String PrenumeR = request.getParameter("prenume_reclamant");
            String NumeP = request.getParameter("nume_parat");
            String PrenumeP = request.getParameter("prenume_parat");
            String data = request.getParameter("data_proces");
            String obiect = request.getParameter("obiectul_cauzei");
            
            if (NumeR != null) {
                jb.connect();
                jb.adaugaProces(NumeR, PrenumeR, NumeP, PrenumeP, data, obiect);
                jb.disconnect();
        %>
	<p>Datele au fost adaugate.</p>
	<%
        } 
            else {
        %>
	<h1>Suntem in tabela Procese.</h1>
	<form action="nou_Proces.jsp" method="post">
		<table>
			<tr>
				<td align="right">Numele reclamantului :</td>
				<td><input type="text" name="nume_reclamant" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Prenume reclamantului:</td>
				<td><input type="text" name="prenume_reclamant" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Numele paratului :</td>
				<td><input type="text" name="nume_parat" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Prenumele paratului :</td>
				<td><input type="text" name="prenume_parat" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Data procesului :</td>
				<td><input type="text" name="data_proces" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Obiectul cauzei :</td>
				<td><input type="text" name="obiectul_cauzei" size="40" /></td>
			</tr>
		</table>
		<input type="submit" value="Adauga proces" />
	</form>
	<%
            }
        %>
	<br />
	<a href="index.html"><b>Home</b></a>
	<br />
</body>
</html>
