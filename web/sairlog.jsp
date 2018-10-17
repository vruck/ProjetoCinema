<%-- 
    Document   : sairlog
    Created on : 11/04/2018, 13:07:38
    Author     : vruck
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page
            
                     
        </title>
        <%
                     HttpSession sessao = request.getSession();
                     sessao.removeAttribute("Codigo");    
                     sessao.removeAttribute("nome");
                     response.sendRedirect("index.jsp");             
        %>
    </head>
    <body>
        <h1>Aguarde.....</h1>
    </body>
</html>
