<%-- 
    Document   : index
    Created on : 08/04/2018, 14:27:00
    Author     : vruck
--%>

<%@page import="DAO.FilmesDAO"%>
<%@page import="BEAN.FilmesBEAN"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/Estilo.css" rel="stylesheet" type="text/css"/>
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Bootstrap 101 Template</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <%
            String msg = "", nomeconnectado = "";

            if (request.getParameter("msg") != null) {
                msg = request.getParameter("msg");
            }
            if (session.getAttribute("Codigo") != null) {
                nomeconnectado = (String) session.getAttribute("nome");
            }
            if (session.getAttribute("nome") != null) {

            }

            List<FilmesBEAN> listarFilmesBreve = (new FilmesDAO().selecionar("EM BREVE"));
            List<FilmesBEAN> listarFilmesCartaz = (new FilmesDAO().selecionar("EM CARTAZ"));
            String imagem = "", descricao = "", titulo = "";
            FilmesBEAN noticia = (new FilmesDAO()).selecionarfilmenoticia("Noticia.jpg");
            if (noticia != null) {
                imagem = noticia.getFil_imagem();
                descricao = noticia.getFil_descricao();
                titulo = noticia.getFil_titulo();
            }

        %>
    </head>
    <body>


        <!-- SLIDER -->

        <!-- // SLIDER -->
        <!-- COMEÇO DO MENU-->
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp">VRUCKCOM</a>
                </div>
                <ul class="nav navbar-nav">
                    <!--
                 <li class="active"><a href="index.jsp">Pagina Inicial</a></li>
           
                 <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
                     <ul class="dropdown-menu">
                         <li><a href="#">Page 1-1</a></li>
                         <li><a href="#">Page 1-2</a></li>
                         <li><a href="#">Page 1-3</a></li>
                     </ul>
                 </li>
                 <li><a href="#">Page 2</a></li>
                    -->
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="editarperfiel.jsp"><span class="glyphicon glyphicon-user"> <%=nomeconnectado%></span>  Editar</a></li>
                    <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    <li><a href="sairlog.jsp"><span class="glyphicon glyphicon-log-in"></span> Sair</a></li>
                </ul>
            </div>
        </nav>

        <!-- FIM DO MENU-->
        <!-- COMEÇANDO CONTEUDO -->


        <div class="container">
            <div class="row">
                <div id="NOTICIA" class="col-md-3">
                    <button type="button" class="btn btn-default ribbon">Novidade</button>
                </div>
            </div>
            <br/>
            <div class="row">
                <div id="teste" class="col-md-6 col-lg-6 col-sm-6 img-thumbnail"><img src="img/<%=imagem%>" alt="" class="img-responsive"/></div>

                <div class="col-md-6 col-lg-6 col-sm-6">
                    <h1><%=titulo%></h1>
                    <p><%=descricao%></p>
                    <button type="button" class="btn btn-info btn-cons">LER A NOTÍCIA</button>
                </div>

            </div>
        </div> 




        <div class="container-fluid">
            <!-- SLIDER -->
            <div class="divslider">
                <div class="container">
                    <div class="col-xs-12">
                        <div id="sliderprincipal" class="carousel slide" data-ride="carousel">

                            <!-- IMAGENS DO CAROUSEL -->
                            <div class="carousel-inner" role="listbox">
                                <div class="item active">
                                    <img src="img/testefilmes.png" alt="Imagem slider 1">
                                </div>
                            </div>  
                            <!-- AS BOLINHAS MARCADORAS QUE FICAM EM SOBRE AS IMAGENS -->
                        </div>
                    </div>
                </div>
            </div>      
            <!-- // SLIDER -->
        </div>

        <div class="container">
            <div class="row">

                <ul class="nav nav-tabs">
                    <li class="nav-item" >
                        <a class="nav-link active" href="#EMCARTAZ" data-toggle="tab" role="tab" aria-expanded="true">EM CARTAZ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#EMBREVE" data-toggle="tab" role="tab" aria-expanded="false">EM BREVE</a>
                    </li>

                </ul>
                <!-- //
                   <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter hdpe">
                       <img src="img/Noticia.jpg " Width="365 " Height="365"  img-thumbnail >  
                       <div class="form-group">
                           
                           <button type="button" class="btn btn-info btn-cons">LER A NOTÍCIA</button>
                            <button type="button" class="btn btn-info btn-cons">COMPRAR INGRESSO</button>
                       </div> 
                   </div>
                -->
            </div>
        </div>
        </br>
        <div class="container">
            <div class="row">


                <div class="tab-content " >
                    <div id="EMCARTAZ" class="tab-pane fade in active" >
                        <%  for (FilmesBEAN elem : listarFilmesCartaz) {
                        %>
                        <div class="item  col-xs-4 col-lg-4">
                            <div class="thumbnail">
                                <img class="group list-group-image" src="img/<%=elem.getFil_imagem()%>"alt="" />

                                <div class="caption">
                                    <h4 class="group inner list-group-item-heading"><%=elem.getFil_titulo()%></h4>
                                    <p class="group inner list-group-item-text" maxlength="168"><%=elem.getFil_descricao()%></p>
                                    <div class="row">
                                        <div class="col-xs-12 col-md-6">
                                            <a class="btn btn-info btn-cons" href="detalhes.jsp?codigofil=<%=elem.getFil_codigo()%>">Ler Detalhe e comprar ingresso</a>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>


                        <%
                            }
                        %>

                    </div>

                    <div id="EMBREVE" class="tab-pane fade" >

                        <%  for (FilmesBEAN elem : listarFilmesBreve) {
                        %>
                        <div class="item  col-xs-4 col-lg-4">
                            <div class="thumbnail">
                                <img class="group list-group-image" src="img/<%=elem.getFil_imagem()%>"alt="" />

                                <div class="caption">
                                    <h4 class="group inner list-group-item-heading"><%=elem.getFil_titulo()%></h4>
                                    <p class="group inner list-group-item-text" maxlength="168" ><%=elem.getFil_descricao()%></p>
                                    <div class="row">
                                        <div class="col-xs-12 col-md-6">
                                            <a class="btn btn-info btn-cons" href="#">Ler Detalhe e comprar ingresso</a>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>


                        <%
                            }
                        %>


                    </div>

                </div>
            </div>

        </div>

        <!-- RODAPÉ -->
        <footer id="rodape" class="row">
            &copy 2017 - Gabriel da cruz vruck
        </footer>
        <!-- // RODAPÉ -->  
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
