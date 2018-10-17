<%-- 
    Document   : detalhes
    Created on : 20/04/2018, 21:25:56
    Author     : gabrielvruck
--%>

<%@page import="DAO.SessaoDAO"%>
<%@page import="BEAN.SessaoBEAN"%>
<%@page import="java.util.List"%>
<%@page import="DAO.FilmesDAO"%>
<%@page import="BEAN.FilmesBEAN"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/Estilo.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.12/css/all.css" integrity="sha384-G0fIWCsCzJIMAVNQPfjH08cyYaUtMwjJwqiRKxxE/rx96Uroj1BtIQ6MLJuheaO9" crossorigin="anonymous">


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
            int fil_idade = 0;
            String Fil_titulo = "", Fil_descricao = "", Fil_imagem = "", Fil_duracao = "", fil_datalancamento = "";
            int codigo = Integer.parseInt(request.getParameter("codigofil"));
            if (request.getParameter("codigofil") != null) {
              
                FilmesBEAN fil = (new FilmesDAO()).selecionarcodigo(codigo);
                if (fil != null) {
                    Fil_titulo = fil.getFil_titulo();
                    Fil_descricao = fil.getFil_descricao();
                    Fil_imagem = fil.getFil_imagem();
                    Fil_duracao = fil.getFil_duracao();
                    fil_idade = fil.getFil_idade();
                    fil_datalancamento = fil.getDatanscimentoString();
                }

            }
            List<SessaoBEAN> ListarHorarioedataDisponiveis = (new SessaoDAO().selecionar(codigo));
        %>
    </head>
    <body>
        <!-- COMEÇO DO MENU-->
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp">VRUCKCOM</a>
                </div>
                <ul class="nav navbar-nav">

                </ul>
                <ul class="nav navbar-nav navbar-right">

                    <li><a href="index.jsp"><span class="glyphicon glyphicon-log-in"></span> Voltar para pagina inicial</a></li>
                </ul>
            </div>
        </nav>

        <!-- FIM DO MENU-->
        <div class="container-fluid">
            <form name="form1" method="POST" action="SrvCinema" id="MenuLogin">

                <div class="row "> 
                    <div class="col-md-4">
                        <img src="img/<%=Fil_imagem%>"  class="img-responsive" alt=""/>
                    </div>
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="txtdescricao">Titulo</label>
                            <input type="text" name="txtdescricao" value="<%=Fil_titulo%>" class="form-control" disabled/>
                        </div>
                        <div class="form-group">
                            <label for="txtdescricao">Descrição</label>
                            <textarea name="txtdescricao" rows="4" cols="20" class="form-control" disabled>
"<%=Fil_descricao%>"            <%=Fil_descricao%>
                            </textarea>
                        </div>
                        <div class="form-group">
                            <label for="txtdescricao">duração do filme</label>
                            <input type="text" name="txtdescricao" value="<%=Fil_duracao%>" class="form-control" disabled/>
                        </div>
                        <div class="form-group">
                            <label for="txtdescricao">Data de lançamento</label>
                            <input type="text" name="txtdatalancamento" value="<%=fil_datalancamento%>" class="form-control" disabled/>
                        </div>
                        <div class="form-group">
                            <label for="txtdescricao">Idade recomendada para assistir o filme</label>
                            <input type="text" name="txtdescricao" value="<%=fil_idade%>" class="form-control" disabled/>
                        </div>
                        <div class="form-group">

                            <a href="login.jsp" class="btn btn-primary form-control">Logar</a>
                        </div>
                        <div class="form-group">
                            <img src="img/testeeee.png" alt="" class="img img-responsive"/>
                        </div>
                       
                    </div>

                    <div class="col-md-12">
                        <div class="row thumbnail">
                            <div id="DiasDisponiveis" class="tab-pane fade in active" >
                                <%  for (SessaoBEAN elem : ListarHorarioedataDisponiveis) {
                                %>
                                <div class="item  col-xs-4 col-lg-4">
                                    <div class=" row thumbnail">
                                        <div class="">
                                            <h1 class="form-control">Programação </h1>  
                                            <div class="form-group">

                                                <label for="txthorarioinicial" class="form-control">Horário Disponivel</label>
                                                <h1  name="txthorarioinicial" class="group inner list-group-item-text fas fa-stopwatch form-control"> <%=elem.getSes_horainicial()%></h1>


                                                <label for="txtdatainicial" class="form-control">Data Disponivel</label>
                                                <h1 name="txtdatainicial" class="group inner list-group-item-heading fas fa-calendar-alt form-control"> <%=elem.getData_ses()%></h1>


                                                <div class="row">
                                                    <div class="col-xs-12 col-md-12">
                                                        <a class="btn btn-success" href="compraIgresso.jsp?codigosessao=<%=elem.getIdsessao()%>">Comprar Ingresso</a>
                                                    </div>
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




            </form>
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
