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
            int aux = java.lang.Integer.parseInt(request.getParameter("idproces"));
            String NumeR = request.getParameter("nume_reclamant");
            String PrenumeR = request.getParameter("prenume_reclamant");
            String NumeP = request.getParameter("nume_parat");
            String PrenumeP = request.getParameter("prenume_parat");
            String data = request.getParameter("data_proces");
            String obiect = request.getParameter("obiectul_cauzei");

            String[] valori = {NumeR, PrenumeR, NumeP, PrenumeP, data, obiect};
            String[] campuri = {"nume_reclamant", "prenume_reclamant", "nume_parat", "prenume_parat", "data_proces", "obiectul_cauzei"};
            jb.modificaTabela("procese", "idproces", aux, campuri, valori);
            jb.disconnect();
        %>
	<h1 align="center">Modificarile au fost efectuate !</h1>
	<p align="center">
		<a                   class="u-align-center u-border-none u-btn u-button-style u-custom-color-4 u-hover-custom-color-2 u-btn-1"
		 href="index.html"><b>Home</b></a> <br />
</body>
</html>
