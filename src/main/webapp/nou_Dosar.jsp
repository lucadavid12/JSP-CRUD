<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga Dosar</title>
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
            int idjudecator, idproces;
            String id1, id2;
            
            String NumeJ, PrenumeJ;
			String NumeR, PrenumeR, NumeP, PrenumeP, Data, Obiect;
			String Nr_dosar, Denumire, Status;
            
            id1 = request.getParameter("idproces");
            id2 = request.getParameter("idjudecator");
            
            Nr_dosar = request.getParameter("nr_dosar");
            Denumire = request.getParameter("denumire_dosar");
            Status = request.getParameter("status");
           
            if (id1 != null && id2 != null) {
                jb.connect();
                jb.adaugaDosar(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), Nr_dosar, Denumire, Status);
                jb.disconnect();
        %>
	<p>Datele au fost adaugate.</p>
	<%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("procese");
        ResultSet rs2 = jb.vedeTabela("judecatori");
        %>
	<h1>Suntem in tabela dosar.</h1>
	<form action="nou_Dosar.jsp" method="post">
		<table>
			<tr>
				<td align="right">Id Proces:</td>
				<td>Selectati Procesul in cauza: <SELECT NAME="idproces">
						<%
                                    while(rs1.next()){
                                    	 idproces = rs1.getInt("idproces");
                                         NumeR = rs1.getString("nume_reclamant");
                                         PrenumeR = rs1.getString("prenume_reclamant");
                                         NumeP = rs1.getString("nume_parat");
                                         PrenumeP = rs1.getString("prenume_parat");
                                         Data = rs1.getString("data_proces");
                                         Obiect = rs1.getString("obiectul_cauzei");
                                %>
						<OPTION VALUE="<%= idproces%>"><%= idproces%>,<%= NumeR%>,<%= PrenumeR%>,<%= NumeP%>,<%= PrenumeP%>,<%= Data%>,<%= Obiect%>,</OPTION>
						<%
                                    }
                                %>
				</SELECT>

				</td>
			</tr>
			<tr>
				<td align="right">Id Judecator:</td>
				<td>Selectati Judecatorul: <SELECT NAME="idjudecator">
						<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
						<%
                                    while(rs2.next()){
                                    	 idjudecator = rs2.getInt("idjudecator");
                                         NumeJ = rs2.getString("nume_judecator");
                                         PrenumeJ = rs2.getString("prenume_judecator");
                                %>
						<OPTION VALUE="<%= idjudecator%>"><%= idjudecator%>,<%= NumeJ%>,<%= PrenumeJ%></OPTION>
						<%
                                    }
                                %>
				</SELECT>
				</td>
			</tr>
			<tr>
				<td align="right">Numarul dosarului:</td>
				<td><input type="text" name="nr_dosar" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Denumirea dosarului:</td>
				<td><input type="text" name="denumire_dosar" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Status:</td>
				<td><input type="text" name="status" size="30" /></td>
			</tr>
		</table>
		<input type="submit" value="Adauga Dosar" />
	</form>
	<%
            }
        %>
	<br />
	<a href="index.html"><b>Home</b></a>
	<br />
</body>
</html>
