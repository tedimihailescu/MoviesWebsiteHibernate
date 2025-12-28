
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
        <title>Filme</title>
        <link href="css/adaugah.css" rel="stylesheet" type="text/css">
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
        <div align="center" id="add">
            <h1> Adauga nominalizare:</h1>
            <br/>
            <form action="NominalizariController" method="GET">
                <table>
                    <tr>
                        <td> Film: </td>
                        <td>
                            <select name="idfilm">
                                <c:forEach items="${listaFilme}" var="filme">
                                    <option value="${filme.idfilm}">${filme.idfilm}, ${filme.titlu}, ${filme.anAparitie}, ${filme.regizor}, ${filme.durataMinute}, ${filme.notaImdb}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td> Categorie: </td>
                        <td>
                            <select name="idcategorie">
                                <c:forEach items="${listaCategorii}" var="categorii">
                                    <option value="${categorii.idcategorie}">${categorii.idcategorie}, ${categorii.numeCategorie}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td> Titlu Nominalizare: </td>
                        <td><input type="text" name="titluNominalizare" required="required"></td>
                    </tr>
                </table>
                <br/>
                <input type="submit" name="adaugaNominalizare" value="Adauga">
            </form>
        </div>
        <div align="center">
	        <table>
				<tr>
					<td><form action="NominalizariController" method="POST">
	            		<p align="center"><input type="submit" name="afiseazaNominalizare" value="Nominalizari"> &nbsp;<br>
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
