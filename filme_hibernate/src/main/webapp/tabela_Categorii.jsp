
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorii</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeCategorie").hide();
                $("#modificaCategorie").hide();

                $("#update").click(function () {
                    $("#modificaCategorie").show();
                    $("#stergeCategorie").hide();
                });
                $("#delete").click(function () {
                    $("#stergeCategorie").show();
                    $("#modificaCategorie").hide();
                });
            });
        </script>
		<link href="css/tabelaCategoriih.css" rel="stylesheet" type="text/css">
    </head>
    <body>
    <div>
    	<hr>
    	<hr>
        <h1 align="center"> Tabela Categorii:</h1> 
        <br/>
        <table border="1" align="center">
            <tr>
                <td><b>IdCategorie:</b></td>
                <td><b>Nume Categorie:</b></td>
            </tr>
            <c:forEach var="categorie" items="${listaCategorii}">
                <tr>
                    <td>${categorie.idcategorie}</td>
                    <td>${categorie.numeCategorie}</td>              
                </tr>
            </c:forEach>
        </table>
        <br/>
        <form action="CategoriiController" method="POST">
            <p align="center">
                Modifica: <input type="radio" id="update" name="modifica_sterge" onclick="document.getElementById('numeCategorie').disabled = false;"> Sterge: <input type="radio" id="delete" name="modifica_sterge" onclick="document.getElementById('numeCategorie').disabled = true;"><br><br>
                <select name="idcategorie">
                    <c:forEach items="${listaCategorii}" var="categorie">
                        <option value="${categorie.idcategorie}">${categorie.idcategorie}</option>
                    </c:forEach>
                </select>
                <br><br>
                Modifica Nume Categorie: <input id="numeCategorie" type="text" name="numeCategorie" required="required"><br><br>
                <button type="submit" id="modificaCategorie" name="modificaCategorie"> Modifica</button>
                <button type="submit" id="stergeCategorie" name="stergeCategorie"> Sterge </button>
                <br/>
            </p>
        </form>
        <div align="center">
	        <table>
				<tr>
					<td><form action="adauga_Categorie.jsp" method="POST">
	            		<p align="center"><input type="submit" value="Adauga categorie"> &nbsp;<br>
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
