<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga judecator</title>
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
            String Nume = request.getParameter("nume_judecator");
            String Prenume = request.getParameter("prenume_judecator");
            
            if (Nume != null) {
                jb.connect();
                jb.adaugaJudecator(Nume, Prenume);
                jb.disconnect();
        %>
	<p>Datele au fost adaugate.</p>
	<%
        } else {
        %>
	<h1>Suntem in tabela Judecatori.</h1>
	<form action="nou_Judecator.jsp" method="post">
		<table>	
			<tr>
				<td align="right">Nume:</td>
				<td><input type="text" name="nume_judecator" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Prenume:</td>
				<td><input type="text" name="prenume_judecator" size="30" /></td>
			</tr>
		</table>
		<input type="submit" value="Adauga judecator" />
	</form>
	<%
            }
        %>
	<br />
	<a href="index.html"><b>Home</b></a>
	<br />
</body>
</html>
