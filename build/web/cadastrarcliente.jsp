<%-- 
    Document   : cadastrarcliente
    Created on : 08/04/2018, 15:29:22
    Author     : vruck
--%>

<%@page import="DAO.PessoasDAO"%>
<%@page import="BEAN.PessoasBEAN"%>
<%@page import="BEAN.PessoasBEAN"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/Estilo.css" rel="stylesheet" type="text/css"/>

        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/javascript" src="js/jquery.mask.min.js"></script>
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
            String msg = "";
            if (request.getParameter("msg") != null) {
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
            <form name="form1" method="POST" action="SrvCinema" id="MenuLogin" >

                <div class="row">
                    <div class="form-group">
                        <input type="hidden" id="txtcodigo" name="txtcodigo" value="">
                        <center>  <h1>Criar Conta</h1></center> 
                        <div class="col-md-6 col-md-offset-3  ">
                            <div class="col-md-6 col-md-offset-3"><img src="img/Teste.png" alt="" class="img-responsive"/></div>


                            <div class="col-md-6 col-md-offset-3  ">
                                <label for="txtnome" name="txtnome">Nome</label>
                                <input type="text" name="txtnome" value="" placeholder="nome e sobrenome"  class="form-control" id="txtnome" maxlength="80"/>
                            </div>
                            <div class="col-md-6 col-md-offset-3  ">
                                <label for="txtcpf" name="txtcpf">CPF</label>
                                <input type="text" name="txtcpf" value=""  placeholder="ex:xxx.xxx.xxx-xx (não coloque letra)" class="form-control" id="txtnome" maxlength="14" onkeydown="javascript: fMasc( this, mCPF );"/>
                            </div>
                            <div class="col-md-6  col-md-offset-3 ">
                                <label for="txtrg" name="txtrg">RG</label>
                                <input type="text" name="txtrg" value=""  placeholder="ex:xx.xxx.xxx-x (não coloque letra)" class="form-control" id="txtnome" maxlength="12" onkeyup="somenteNumeros(this);"/>
                            </div>
                            <div class="col-md-6 col-md-offset-3  ">
                                <label for="txttelefone" name="txttelefone">Telefone</label>
                                <input type="text" name="txttelefone" value=""  placeholder="exemplo:018996670054" class="form-control" id="txtnome" maxlength="14"  onkeydown="javascript: fMasc( this, mTel );"/>
                            </div>
                            <div class="col-md-6  col-md-offset-3 ">
                                <label for="txtlogin" name="txtlogin">Login</label>
                                <input type="text" name="txtlogin" value="" placeholder="pode conter numero e letra" class="form-control" id="txtnome" maxlength="40"/>
                            </div>
                            <div class="col-md-6 col-md-offset-3 ">
                                <label for="txtSenha" name="txtSenha">Senha</label>
                                <input type="password" name="txtSenha" value="" placeholder="pode conter numero e letra" class="form-control" id="txtnome" maxlength="40"/>
                            </div>



                            <div class="col-md-6 col-md-offset-3  ">
                                <input type="submit" value="Salvar Dados" name="btnsalvar" class=" form-control btn btn-primary" />
                            </div>


                            <div class="row">
                                <span class="text-info"><%=msg%></span>
                            </div>
                        </div>
                    </div>
                </div>






            </form>
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
             <script type="text/javascript">
        function fMasc(objeto, mascara) {
            obj = objeto
            masc = mascara
            setTimeout("fMascEx()", 1)
        }
        function fMascEx() {
            obj.value = masc(obj.value)
        }
        function mTel(tel) {
            tel = tel.replace(/\D/g, "")
            tel = tel.replace(/^(\d)/, "($1")
            tel = tel.replace(/(.{3})(\d)/, "$1)$2")
            if (tel.length == 9) {
                tel = tel.replace(/(.{1})$/, "-$1")
            } else if (tel.length == 10) {
                tel = tel.replace(/(.{2})$/, "-$1")
            } else if (tel.length == 11) {
                tel = tel.replace(/(.{3})$/, "-$1")
            } else if (tel.length == 12) {
                tel = tel.replace(/(.{4})$/, "-$1")
            } else if (tel.length > 12) {
                tel = tel.replace(/(.{4})$/, "-$1")
            }
            return tel;
        }
        function mCNPJ(cnpj) {
            cnpj = cnpj.replace(/\D/g, "")
            cnpj = cnpj.replace(/^(\d{2})(\d)/, "$1.$2")
            cnpj = cnpj.replace(/^(\d{2})\.(\d{3})(\d)/, "$1.$2.$3")
            cnpj = cnpj.replace(/\.(\d{3})(\d)/, ".$1/$2")
            cnpj = cnpj.replace(/(\d{4})(\d)/, "$1-$2")
            return cnpj
        }
        function mCPF(cpf) {
            cpf = cpf.replace(/\D/g, "")
            cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
            cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
            cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2")
            return cpf
        }
        function mCEP(cep) {
            cep = cep.replace(/\D/g, "")
            cep = cep.replace(/^(\d{2})(\d)/, "$1.$2")
            cep = cep.replace(/\.(\d{3})(\d)/, ".$1-$2")
            return cep
        }
        function mNum(num) {
            num = num.replace(/\D/g, "")
            return num
        }
    </script>

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