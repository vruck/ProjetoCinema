<%-- 
    Document   : index
    Created on : 07/04/2018, 20:24:50
    Author     : vruck
--%>

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
            String msg="";
            if(request.getParameter("msg") != null){
                msg = request.getParameter("msg");
            }
            
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
                
                <center> <h1>Seja Bem Vindo</h1></center>
                <div class="row">
                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3 ">
                            <label for="txtlogin" name="txtlogin">Login</label>
                            <input type="text" name="txtlogin" value=""  class="form-control" id="txtnome" maxlength="40"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3  ">
                            <label for="txtSenha" name="txtSenha">Senha</label>
                            <input type="password" name="txtSenha" value=""  class="form-control" id="txtnome" maxlength="40"/>
                        </div>
                    </div>
                </div>
               
                <div class="row">
                    <span class="text-info"><%=msg%></span>
                </div>
                <div class="row">
                    <div class="form-group">
                        <br/>
                        <div class="col-md-6 col-md-offset-3  ">
                            <input type="submit" value="Acessar" name="btnacessar" class=" form-control btn btn-primary" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <br/>
                        <div class="col-md-6 col-md-offset-3  ">
                            <a href="cadastrarcliente.jsp">Novo Cadastro</a>
                        </div>
                    </div>
                </div>
               <div class="row">
                    <div class="form-group">
                        <br/>
                        <div class="col-md-6 col-md-offset-3">
                            <a href="index.jsp"><img src="img/logintestebanner.png" alt="" class="img-responsive"/></a>
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
