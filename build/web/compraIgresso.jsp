<%-- 
    Document   : detalhes
    Created on : 20/04/2018, 21:25:56
    Author     : gabrielvruck
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="DAO.PessoasDAO"%>
<%@page import="BEAN.PessoasBEAN"%>
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
            int codigo = 0;
            String nome = "", cpf = "";
            if (session.getAttribute("Codigo") != null) {
                session.setAttribute("sessao",null);
                codigo = Integer.parseInt((session.getAttribute("Codigo").toString()));
                if (request.getParameter("codigosessao") != null) {

                } else {
                    response.sendRedirect("index.jsp");
                }
            } else {
                  session.setAttribute("sessao", request.getParameter("codigosessao"));
                response.sendRedirect("login.jsp");
            }

            Date dataHoraAtual = new Date();
            String data = new SimpleDateFormat("dd/MM/yyyy").format(dataHoraAtual);

            PessoasBEAN cli = (new PessoasDAO()).selecionar(codigo);
            if (cli != null) {
                nome = cli.getNome();
                cpf = cli.getCpf();

            }

            List<SessaoBEAN> CompraIngresso = (new SessaoDAO().selecionarSessaoIngresso(Integer.parseInt(request.getParameter("codigosessao"))));
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
                <div class="row thumbnail">
                    <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 "> 
                        <div class="">
                            <% for (SessaoBEAN elem : CompraIngresso) {
                            %>
                            <div class="col-md-4 " style="height:250px">
                                <center>
                                    <h3  class="form-control"><%=elem.getFil_titulo()%></h3>
                                    <p><img src="img/<%=elem.getFil_imagem()%> " class="img-rounded img-responsive" style="height:180px" alt=""/></p>
                                </center>
                            </div>
                            <div class="col-md-4  " style="height:250px">
                                <input type="hidden" id="valoringresso" value="<%=elem.getIn_valor()%>">
                                <center> <label>Valor do Ingresso unico</label>
                                    <p  class="form-control">R$<%=elem.getIn_valor()%></p> 
                                    <label>Horario do filme</label>
                                    <p  class="form-control"> <%=elem.getSes_horainicial()%></p>
                                    <label>Idade permitida para poder assistir o filme</label>
                                    <p class="form-control">  <%=elem.getFil_idade()%> Anos</p>
                                </center>
                                <input type="hidden" id="codigoingrsso" name="codigoingrsso" value="<%=elem.getCodigoingre()%>">  


                                <%
                                    int codigoingresso = elem.getCodigoingre();
                                    session.setAttribute("codigoIngresso", codigoingresso);
                                %>
                            </div>

                            <div class="col-md-4 " style="height:250px">
                                <center>
                                    </br>
                                    </br>
                                    </br>
                                    <label>Quantidade de ingresso</label>
                                    </br>
                                    <select name="qtdIngresso" class="form-control" id="qtdIngresso">
                                        <option value="">Selecione quantidade de ingresso desejavel</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                    </select>
                                    </br>
                                    </br>
                                    </br>
                                </center>
                            </div>



                            <%
                                }
                            %>

                        </div>
                    </div>
                </div>
                <div class="row thumbnail">

                </div>  


                <section id="confirmaCompra" >
                    <div class="row thumbnail">
                        <div class="col-md-6 col-md-offset-3">
                            <div class="form-group ">
                                <h1>Para poder finalizar a compra é necessario  dados do seu cartão</h1>
                            </div>
                            <div class="form-group col-md-3 ">
                                <label for="txtnome">Nome</label>
                                <input type="text" name="txtnome" value="<%=nome%>" class="form-control"  readonly="true"/>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="txtcpf">CPF</label>
                                <input type="text" name="txtcpf" value="<%=cpf%>" class="form-control" readonly="true"/>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="txtdatadacompra">Data Da Compra</label>
                                <input type="text" name="txtdatadacompra" value="<%=data%>" class="form-control" readonly="true"/>
                            </div>

                            <div class="form-group col-md-3">
                                <label for="txtvalortotal">Valor Total</label>
                                <input type="text" id="txtvalortotal" name="txtvalortotal" value="" class="form-control" readonly="true" />
                            </div>
                        </div>
                    </div>  
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <div class="form-group col-md-6">
                                <label for="txtnomecartao">Nome</label>
                                <input type="text" name="txtnomecartao" value="" class="form-control" MaxLength="40"  />
                            </div>
                            <div class="form-group col-md-6">
                                <label for="txtnumerocartao">Numero do cartão</label>
                                <input type="text" name="txtnumerocartao" value="" class="form-control" onkeyup="somenteNumeros(this);" MaxLength="16"/>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="txtcodigodeseguranca">Codigo de segurança</label>
                                <input type="text" name="txtcodigodeseguranca" value="" class="form-control" onkeyup="somenteNumeros(this);" MaxLength="3"/>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="txtdatadevalidar">Mes</label>
                                <select name="ddpMes" class="form-control" id="ddpMes">
                                    <option value="">Selecione o mes de vencimento</option>
                                    <option value="1">janeiro</option>
                                    <option value="2">feveiro</option>
                                    <option value="3">março</option>
                                    <option value="4">abril</option>
                                    <option value="5">maio</option>
                                    <option value="6">junho</option>
                                    <option value="7">julho</option>
                                    <option value="8">agosto</option>
                                    <option value="9">setembro</option>
                                    <option value="10">outubro</option>
                                    <option value="11">novembro</option>
                                    <option value="12">dezembro</option>

                                </select>

                            </div>
                            <div class="form-group col-md-3">
                                <label for="txtdatadevalidar">Ano</label>
                                <select name="ddpAno" class="form-control" id="ddpAno">
                                    <option value="">Selecione o ano de vencimento</option>
                                    <option value="2018">2018</option>
                                    <option value="2019">2019</option>
                                    <option value="2020">2020</option>
                                    <option value="2021">2021</option>
                                    <option value="2022">2022</option>
                                    <option value="2023">2023</option>
                                    <option value="2024">2024</option>
                                    <option value="2025">2025</option>
                                    <option value="2026">2026</option>
                                    <option value="2027">2027</option>
                                    <option value="2028">2028</option>
                                    <option value="2029">2029</option>
                                </select>
                            </div>
                        </div
                        <div class="col-md-2 col-md-offset-3 form-group">

                            <input type="submit" value="Confirma compra" name="btnConfirma" class="btn btn-primary form-control" />

                        </div>
                    </div>

                </section>

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
        <script>
                                    function numberToReal(numero) {
                                        var numero = numero.toFixed(2).split('.');
                                        numero[0] = "R$ " + numero[0].split(/(?=(?:...)*$)/).join('.');
                                        return numero.join('.');
                                    }

                                    $("#qtdIngresso").change(function () {
                                        var qtde = $("#qtdIngresso").val();
                                        var valor = $("#valoringresso").val();
                                        $("#txtvalortotal").val(numberToReal(qtde * valor));
                                    });
        </script>
        <script>
            function somenteNumeros(num) {
                var er = /[^0-9.]/;
                er.lastIndex = 0;
                var campo = num;
                if (er.test(campo.value)) {
                    campo.value = "";
                }
            }
        </script>
    </body>
</html>
