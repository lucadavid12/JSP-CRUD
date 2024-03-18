package db;

import java.sql.*;


public class JavaBean {

	String error;
	Connection con;

	public JavaBean() {
	}

	public void connect() throws ClassNotFoundException, SQLException, Exception {
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/david_luca?useSSL=false", "root", "StelutaDeMare12!");
		} 
		catch (ClassNotFoundException cnfe) 
		{
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} 
		catch (SQLException cnfe) 
		{
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} 
		catch (Exception e) 
		{
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
			throw new Exception(error);
		}
	} // connect()

	public void connect(String bd) throws ClassNotFoundException, SQLException, Exception {
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + bd, "root", "parola");
		} 
		catch (ClassNotFoundException cnfe) 
		{
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} 
		catch (SQLException cnfe) 
		{
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} 
		catch (Exception e) 
		{
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
			throw new Exception(error);
		}
	} // connect(String bd)

	public void connect(String bd, String ip) throws ClassNotFoundException, SQLException, Exception {
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://" + ip + ":3306/" + bd, "root", "parola");
		} 
		catch (ClassNotFoundException cnfe) 
		{
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} 
		catch (SQLException cnfe) 
		{
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} 
		catch (Exception e) 
		{
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
			throw new Exception(error);
		}
	} // connect(String bd, String ip)

	public void disconnect() throws SQLException {
		try 
		{
			if (con != null) 
			{
				con.close();
			}
		} 
		catch (SQLException sqle) 
		{
			error = ("SQLException: Nu se poate inchide conexiunea la baza de date.");
			throw new SQLException(error);
		}
	} // disconnect()

	public void adaugaJudecator(String Nume, String Prenume)throws SQLException, Exception {
		if (con != null) 
		{
			try 
			{
				// creaza un "prepared SQL statement"
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("insert into `david_luca`.`judecatori`(nume_judecator, prenume_judecator) values('" + Nume + "', '" + Prenume + "');");

			} 
			catch (SQLException sqle) 
			{
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} 
		else 
		{
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of adaugaPacient()

	public void adaugaProces(String NumeR, String PrenumeR, String NumeP, String PrenumeP, String Data, String Obiectul) throws SQLException, Exception
	{
		if(con != null)
		{
			try 
			{
				// create a prepared SQL statement
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("insert into `david_luca`.`procese`(nume_reclamant, prenume_reclamant, nume_parat, prenume_parat, data_proces, obiectul_cauzei) values('" + NumeR + "', '" + PrenumeR + "', '" + NumeP + "', '" + PrenumeP + "', '" + Data + "', '" + Obiectul + "');");
			} 
			catch (SQLException sqle) 
			{
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		}
		else
		{
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	}
	
	public void adaugaDosar(int id_p, int id_j, String Nr, String Denumire, String Status) throws SQLException, Exception 
	{
		if(con != null)
			try 
			{
				System.out.println(id_p);
				System.out.println(id_j);
				System.out.println(Nr);
				System.out.println(Denumire);
				System.out.println(Status);
				
				// create a prepared SQL statement
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("insert into `david_luca`.`dosar`(idproces, idjudecator, nr_dosar, denumire_dosar, status) values('" + id_p + "', '" + id_j + "', '" + Nr + "', '" + Denumire + "', '" + Status + "');");
			} 
			catch (SQLException sqle) 
			{
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		else
		{
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} 

	public ResultSet vedeTabela(String tabel) throws SQLException, Exception {
		ResultSet rs = null;
		try 
		{
			String queryString = ("select * from `david_luca`.`" + tabel + "`;");
			Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
			rs = stmt.executeQuery(queryString);
		} 
		catch (SQLException sqle) 
		{
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} 
		catch (Exception e) 
		{
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // vedeTabela()

	public ResultSet vedeDosar() throws SQLException, Exception {
		ResultSet rs = null;
		try
		{
			String queryString = ("select c.iddosar, a.nume_judecator , a.prenume_judecator , b.nume_reclamant, b.prenume_reclamant, b.nume_parat, b.prenume_parat, b.data_proces, b.obiectul_cauzei, c.idjudecator, c.idproces , c.nr_dosar, c.status, c.denumire_dosar from judecatori a, procese b, dosar c where a.idjudecator = c.idjudecator and b.idproces = c.idproces;");
			Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
			rs = stmt.executeQuery(queryString);
		} 
		catch (SQLException sqle)
		{
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} 
		catch (Exception e)
		{
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} 
	

	public void stergeT(String tabela, String denumirePK, String[] id) throws SQLException, Exception 
	{
		if (con != null) 
		{
			try 
			{
				// create a prepared SQL statement
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("delete from " + tabela + " where " + denumirePK + " = '" + id + "';");
			} 
			catch (SQLException sqle)
			{
				error = "ExceptieSQL: Stergere nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} 
		else 
		{
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} 
	
	public void stergeDateTabela(String[] primaryKeys, String tabela, String dupaID) throws SQLException, Exception {
		if (con != null) {
			try 
			{
				// creaza un "prepared SQL statement"
				long aux;
				PreparedStatement delete;
				delete = con.prepareStatement("DELETE FROM " + tabela + " WHERE " + dupaID + "=?;");
				for (int i = 0; i < primaryKeys.length; i++) 
				{
					aux = java.lang.Long.parseLong(primaryKeys[i]);
					delete.setLong(1, aux);
					delete.execute();
				}
			} 
			catch (SQLException sqle) 
			{
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			} 
			catch (Exception e) 
			{
				error = "A aparut o exceptie in timp ce erau sterse inregistrarile.";
				throw new Exception(error);
			}
		} 
		else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of stergeDateTabela()

	public void stergeTabela(String tabela) throws SQLException, Exception {
		if (con != null) 
		{
			try 
			{
				// creaza un "prepared SQL statement"
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("delete from " + tabela + ";");
			} 
			catch (SQLException sqle) 
			{
				error = "ExceptieSQL: Stergere nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} 
		else 
		{
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of stergeTabela()

	public void modificaTabela(String tabela, String IDTabela, int ID, String[] campuri, String[] valori) throws SQLException, Exception {
		String update = "update " + tabela + " set ";
		String temp = "";
		if (con != null) 
		{
			try 
			{
				for (int i = 0; i < campuri.length; i++) 
				{
					if (i != (campuri.length - 1)) 
					{
						temp = temp + campuri[i] + "='" + valori[i] + "', ";
					} 
					else 
					{
						temp = temp + campuri[i] + "='" + valori[i] + "' where " + IDTabela + " = '" + ID + "';";
					}
				}
				update = update + temp;
				// creaza un "prepared SQL statement"
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate(update);
			} 
			catch (SQLException sqle) 
			{
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		}
		else 
		{
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of modificaTabela()
	
	public void schimbare(String sql)throws SQLException, Exception 
	{
		if(con != null)
		{
			try
			{
				Statement stmt = con.createStatement();
				stmt.execute(sql);
			}
			catch (SQLException sqle) 
			{
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		}
		else
		{
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	}

	public ResultSet intoarceLinie(String tabela, int ID) throws SQLException, Exception {
		ResultSet rs = null;
		try 
		{
			// Executa interogarea
			String queryString = ("SELECT * FROM " + tabela + " where idpacient=" + ID + ";");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(queryString); //sql exception
		} 
		catch (SQLException sqle) 
		{
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} 
		catch (Exception e) 
		{
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // end of intoarceLinie()

	public ResultSet intoarceLinieDupaId(String tabela, String denumireId, int ID) throws SQLException, Exception {
		ResultSet rs = null;
		try 
		{
			// Executa interogarea
			String queryString = ("SELECT * FROM " + tabela + " where " + denumireId + "=" + ID + ";");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(queryString); //sql exception
		}
		catch (SQLException sqle) 
		{
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} 
		catch (Exception e) 
		{
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // end of intoarceLinieDupaId()

	
	public ResultSet intoarceDosarId(int ID) throws SQLException, Exception {
		ResultSet rs = null;
		try 
		{
			// Executa interogarea
			String queryString = ("select c.iddosar, a.nume_judecator , a.prenume_judecator , b.nume_reclamant, b.prenume_reclamant, b.nume_parat, b.prenume_parat, b.data_proces, b.obiectul_cauzei, c.idjudecator, c.idproces , c.nr_dosar, c.status, c.denumire_dosar from judecatori a, procese b, dosar c where a.idjudecator = c.idjudecator and b.idproces = c.idproces AND iddosar = '" + ID + "';");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(queryString); //sql exception
		} 
		catch (SQLException sqle) 
		{
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} 
		catch (Exception e) 
		{
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	}
	 // end of intoarceLinieDupaId() 
	
}
