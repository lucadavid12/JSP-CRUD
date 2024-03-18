<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Dosar</title>
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
	<h1 align="center">Tabela Dosar:</h1>
	<br />
	<p align="center">
		<a href="nou_Dosar.jsp"><b>Adauga un nou Dosar.</b></a> <a
			href="index.html"><b>Home</b></a>
	</p>
	<%
	jb.connect();
	int aux = java.lang.Integer.parseInt(request.getParameter("iddosar"));

	String idj = request.getParameter("idjudecator");
	String idp = request.getParameter("idproces");

	String Nr_dosar = request.getParameter("nr_dosar");
	String Denumire = request.getParameter("denumire_dosar");
	String Status = request.getParameter("status");

	String[] valori = { idj, idp, Nr_dosar, Denumire, Status };
	String[] campuri = { "idjudecator", "idproces", "nr_dosar", "denumire_dosar", "status" };
	jb.modificaTabela("dosar", "iddosar", aux, campuri, valori);
	jb.disconnect();
	%>
	<h1 align="center">Modificarile au fost efectuate !</h1>
	<p align="center">
		<a                   class="u-align-center u-border-none u-btn u-button-style u-custom-color-4 u-hover-custom-color-2 u-btn-1"
		href="index.html"><b>Home</b></a> <br />
</body>
</html>
