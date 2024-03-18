<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Dosar:</title>
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
		<a href="nou_Dosar.jsp"><b>Adauga un nou Dosar:.</b></a> <a
			href="index.html"><b>Home</b></a>
	</p>
	<%
	
	
			jb.connect();

			String NumeJ, PrenumeJ;
			String NumeR, PrenumeR, NumeP, PrenumeP, Data, Obiect;
			String Nr_dosar, Denumire, Status;
			
			
			int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
          	ResultSet rs = jb.intoarceDosarId(aux);
			
			rs.first();
			
            int id1 = rs.getInt("idproces");
			int id2 = rs.getInt("idjudecator");

			NumeJ = rs.getString("nume_judecator");
			PrenumeJ = rs.getString("prenume_judecator");
			
			NumeR = rs.getString("nume_reclamant");
			PrenumeR = rs.getString("prenume_reclamant");
			NumeP = rs.getString("nume_parat");
			PrenumeP = rs.getString("nume_parat");
			Data = rs.getString("data_proces");
			Obiect =  rs.getString("obiectul_cauzei");
			
			Nr_dosar = rs.getString("nr_dosar");
			Denumire = rs.getString("denumire_dosar");
			Status = rs.getString("status");
			
			ResultSet rs1 = jb.vedeTabela("procese");
			ResultSet rs2 = jb.vedeTabela("judecatori");
            int idproces, idjudecator;

			
		  %>
        <form action="m2_Dosar.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdDosar:</td>
                    <td> <input type="text" name="iddosar" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">IdProces:</td>
                    <td> 
                        <SELECT NAME="idproces">
                            <%
                            while(rs1.next()){
                                 idproces = rs1.getInt("idproces");
                                 NumeR = rs1.getString("nume_reclamant");
                                 PrenumeR = rs1.getString("prenume_reclamant");
                                 NumeP = rs1.getString("nume_parat");
                                 PrenumeP = rs1.getString("prenume_parat");
                                 Data = rs1.getString("data_proces");
                                 Obiect = rs1.getString("obiectul_cauzei");
                                    if (idproces != id1) {
                            %>
                            <OPTION VALUE="<%= idproces%>"><%= idproces%>, <%= NumeR%>, <%= PrenumeR%>, <%= NumeP%>, <%= PrenumeP%>, <%= Data%>, <%= Obiect%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION VALUE="yes"><%= idproces%>, <%= NumeR%>, <%= PrenumeR%>, <%= NumeP%>, <%= PrenumeP%>, <%= Data%>, <%= Obiect%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">idjudecator:</td>
                    <td> 
                        <SELECT NAME="idjudecator">
                            <%
                                while (rs2.next()) {
                                	idjudecator = rs2.getInt("idjudecator");
                                	NumeJ = rs2.getString("nume_judecator");
                                	PrenumeJ = rs2.getString("prenume_judecator");
                            if (idjudecator != id2) {
                            %>
                            <OPTION VALUE="<%= idjudecator%>"><%= idjudecator%>, <%= NumeJ%>, <%= PrenumeJ%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION VALUE="yes"><%= idjudecator%>, <%= NumeJ%>, <%= PrenumeJ%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">Numarul dosarului:</td>
                    <td> <input type="text" name="nr_dosar" size="30" value="<%= Nr_dosar%>"/></td>
                </tr>
                <tr>
                    <td align="right">Denumirea dosarului:</td>
                    <td> <input type="text" name="denumire_dosar" size="30" value="<%= Denumire%>"/></td>
                </tr>
                <tr>
                    <td align="right">Status:</td>
                    <td> <input type="text" name="status" size="30" value="<%= Status%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center"">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
</html>

