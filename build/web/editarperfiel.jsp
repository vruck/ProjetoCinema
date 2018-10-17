<%-- 
    Document   : editarperfiel
    Created on : 08/04/2018, 14:33:05
    Author     : vruck
--%>

<%@page import="DAO.PessoasDAO"%>
<%@page import="BEAN.PessoasBEAN"%>
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
            String msg = "";
            if (request.getParameter("msg") != null) {
                msg = request.getParameter("msg");
            }
            int codigo = 0;
            String nome = "", cpf = "", rg = "", telefone = "", login = "", senha = "";
            if (session.getAttribute("Codigo") != null) {
                //existe a sessao do codigo
                codigo = Integer.parseInt((session.getAttribute("Codigo").toString()));

                PessoasBEAN cli = (new PessoasDAO()).selecionar(codigo);
                if (cli != null) {
                    nome = cli.getNome();
                    cpf = cli.getCpf();
                    rg = cli.getRg();
                    telefone = cli.getTelefone();
                    login = cli.getLogin();
                    senha = cli.getSenha();
                }

            } else {
                response.sendRedirect("login.jsp");
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

                
                <div class="col-md-6 col-md-offset-3" >
                    <h1>Editar Perfil </h1>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-md-12 col-md-offeset-3 ">
                                <img src="img/EditarPerfil.png" alt="" class="img-responsive"/>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="form-group">
                            <input type="hidden" id="txtcodigo" name="txtcodigo" value="<%=codigo%>">
                            <div class="col-md-12 col-md-offeset-3 ">
                                <label for="txtnome" name="txtnome">Nome</label>
                                <input type="text" name="txtnome" value="<%=nome%>"  class="form-control"   MaxLength="50"/>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <div class="col-md-12 col-md-offeset-3 ">
                                <label for="txtcpf" name="txtcpf">CPF</label>
                                <input type="text" name="txtcpf" value="<%=cpf%>"  class="form-control" MaxLength="14"  onkeydown="javascript: fMasc( this, mCPF );"/>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <div class="col-md-12 col-md-offeset-3 ">
                                <label for="txtrg" name="txtrg">RG</label>
                                <input type="text" name="txtrg" value="<%=rg%>"  class="form-control"  MaxLength="12" onkeyup="somenteNumeros(this);"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-md-12 col-md-offeset-3 ">
                                <label for="txttelefone" name="txttelefone">Telefone</label>
                                <input type="text" name="txttelefone" value="<%=telefone%>"  class="form-control"  onkeydown="javascript: fMasc( this, mTel );"  MaxLength="14"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-md-12 col-md-offeset-3 ">
                                <label for="txtlogin" name="txtlogin">Login</label>
                                <input type="text" name="txtlogin" value="<%=login%>"  class="form-control"  MaxLength="30"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-md-12 col-md-offeset-3 ">
                                <label for="txtSenha" name="txtSenha">Senha</label>
                                <input type="text" name="txtSenha" value="<%=senha%>"  class="form-control"  MaxLength="30"/>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        
                        <span class="text-info alert"> <%=msg%></span>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <br/>
                            <div class="col-md-12 col-md-offeset-3 ">
                                <input type="submit" value="salvar dados Alterado" name="btnalterar" class=" form-control btn btn-primary" />
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