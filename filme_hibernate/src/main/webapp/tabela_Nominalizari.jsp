
<%@page import="DAOImpl.FilmeDaoImpl"%>
<%@page import="DAOImpl.CategoriiDaoImpl"%>
<%@page import="pojo.Filme"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Categorii"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nominalizare</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeNominalizare").hide();
                $("#modificaNominalizare").hide();

                $("#update").click(function () {
                    $("#modificaNominalizare").show();
                    $("#stergeNominalizare").hide();
                });
                $("#delete").click(function () {
                    $("#stergeNominalizare").show();
                    $("#modificaNominalizare").hide();
                });
            });
        </script>
        <link href="css/tabelaNominalizarih.css" rel="stylesheet" type="text/css">

    </head>
    <body>
    <div>
    	<hr>
    	<hr>
        <%
			FilmeDaoImpl filmDaoImpl = new FilmeDaoImpl();
        	CategoriiDaoImpl categorieDaoImpl = new CategoriiDaoImpl();
        	List<Categorii> listaCategorii = new ArrayList();
        	listaCategorii = categorieDaoImpl.afiseazaCategorie();
        	List<Filme> listaFilme = new ArrayList();
        	listaFilme = filmDaoImpl.afiseazaFilm();
        	request.setAttribute("listaCategorii", listaCategorii);
        	request.setAttribute("listaFilme", listaFilme);
		%>
        <h1 align="center"> Tabela Nominalizari:</h1> 
        <table border="1" align="center">
            <tr>
                <td><b>IdNominalizare:</b></td>
                <td><b>IdFilm:</b></td>
                <td><b>Titlu:</b></td>
                <td><b>An Aparitie:</b></td>
                <td><b>Regizor:</b></td>
                <td><b>Durata Minute:</b></td>
                <td><b>Nota IMDb:</b></td>
                <td><b>IdCategorie:</b></td>
                <td><b>Nume Categorie:</b></td>
                <td><b>Titlu Nominalizare:</b></td>
            </tr>
            <c:forEach var="nominalizare" items="${listaNominalizari}">
                <tr>
                    <td>${nominalizare.idnominalizare}</td>
                    <td>${nominalizare.filme.idfilm}</td>
                    <td>${nominalizare.filme.titlu}</td>
                    <td>${nominalizare.filme.anAparitie}</td>
                    <td>${nominalizare.filme.regizor}</td>
                    <td>${nominalizare.filme.durataMinute}</td>
                    <td>${nominalizare.filme.notaImdb}</td>
                    <td>${nominalizare.categorii.idcategorie}</td>
                    <td>${nominalizare.categorii.numeCategorie}</td>
                    <td>${nominalizare.titluNominalizare}</td>
                </tr>
            </c:forEach>
        </table>
        <br/>
        <form action="NominalizariController" method="POST">
            <div align="center">
            
                Modifica: <input type="radio" id="update" name="modifica_sterge" onclick="document.getElementById('titluNominalizare').disabled = false;
                        document.getElementById('idcategorie').disabled = false;
                        document.getElementById('idfilm').disabled = false;"> Sterge: <input type="radio" id="delete" name="modifica_sterge" onclick="document.getElementById('titluNominalizare').disabled = true;
                        document.getElementById('idcategorie').disabled = true;
                        document.getElementById('idfilm').disabled = true;"><br><br>
                idnominalizare:
                <select name="idnominalizare">
                    <c:forEach items="${listaNominalizari}" var="nominalizare">
                        <option value="${nominalizare.idnominalizare}">${nominalizare.idnominalizare}</option>
                    </c:forEach>
                </select>
                <br><br>
                <table>
            		<tr>
            			<td align="right"> Idfilm:</td>
            			<td> <select name="idfilm" id="idfilm">
                    			<c:forEach items="${listaFilme}" var="film">
                        			<option value="${film.idfilm}">${film.idfilm}, ${film.titlu}, ${film.anAparitie} ${film.regizor}, ${film.durataMinute}, ${film.notaImdb}</option>
                    			</c:forEach>
                			</select>
                		</td>
            		</tr>
            		<tr>
            			<td align="right"> Idcategorie:</td>
            			<td> <select name="idcategorie" id="idcategorie">
                    			<c:forEach items="${listaCategorii}" var="categorie">
                        			<option value="${categorie.idcategorie}">${categorie.idcategorie}, ${categorie.numeCategorie}</option>
                    			</c:forEach>
                			</select>
                		</td>
            		</tr>
            		<tr>
            			<td align="right">Modifica Titlu Nominalizare:</td>
            			<td> <input id="titluNominalizare" type="text" name="titluNominalizare" required="required"></td>
            		</tr>
            	</table>
            	<br/>
                <button type="submit" id="modificaNominalizare" name="modificaNominalizare"> Modifica</button>
                <button type="submit" id="stergeNominalizare" name="stergeNominalizare"> Sterge </button>
                <br/>
            </div>
        </form>
        <div align="center">
	        <table>
				<tr>
					<td><form action="adauga_Nominalizare.jsp" method="POST">
	            		<p align="center"><input type="submit" value="Adauga nominalizare"> &nbsp;<br>
	        			</p></form>
	        		</td>
	        		<td><form action="index.html" method="POST">
	            		<p align="center"><input type="submit" value="Home"> &nbsp; <br>
	        			</p></form>
	        		</td>
				</tr>
			</table>
        </div>
        <hr>
        <hr>
    </div>
    </body>
</html>
