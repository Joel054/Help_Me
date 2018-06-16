<%-- 
    Document   : Cadastro
    Created on : 15/06/2018, 21:33:11
    Author     : vitor
--%>

<%@page import="Modelos.Facebook"%>
<%@page import="com.mycompany.help_me.CRUD.UsuarioCRUD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Olá</h1>
        
        <%
            String access_token=(String)request.getParameter("access_token");
            UsuarioCRUD usuario_facebook = new UsuarioCRUD();
            Facebook facebook = usuario_facebook.call_me(access_token); 
        %>
           
        Nome : <%= facebook.getNome() %> <br>
    </body>
</html>
