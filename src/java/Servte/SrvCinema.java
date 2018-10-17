/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servte;

import BEAN.CardBEAN;
import BEAN.CompraIngressoBEAN;
import BEAN.FilmesBEAN;
import BEAN.PessoasBEAN;
import DAO.CardDAO;
import DAO.CompraIngressoDAO;
import DAO.PessoasDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author vruck
 */
public class SrvCinema extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //PAGINA DE LOGIN
            try {
                if (request.getParameter("btnacessar") != null) {
                    String login = request.getParameter("txtlogin");
                    String senha = request.getParameter("txtSenha");

                    if (!login.equals("") && !senha.equals("")) {
                        PessoasBEAN cli = (new PessoasDAO()).Logar(login, senha);
                        if (cli != null) {
                            //SESSION
                            HttpSession sessao = request.getSession();
                            sessao.setAttribute("Codigo", cli.getCod_pessoas());
                            sessao.setAttribute("nome", cli.getNome());
                            if(sessao.getAttribute("sessao")!=null)
                                response.sendRedirect("compraIgresso.jsp?codigosessao=" + sessao.getAttribute("sessao"));
                            else
                             response.sendRedirect("index.jsp");
                        } else {
                            response.sendRedirect("login.jsp?msg=Login ou senha NÃO ENCONTRADO");
                        }

                    } else {
                        response.sendRedirect("login.jsp?msg=informar login e senha correta");
                    }
                }
            } catch (Exception ex) {

                response.sendRedirect("login.jsp?msg=ERRO! " + ex.getMessage());
            }

            try {
                //Clique Sair
//                if (request.getParameter("finalizar").equals("S")) {
//                    //Recuperar a SESSION
//                    HttpSession sessao = request.getSession();
//                    sessao.removeAttribute("codigo");
//                    sessao.removeAttribute("nome");
//                    response.sendRedirect("login.jsp");
//                }

                //CADASTRAR USUARIO
                if (request.getParameter("btnsalvar") != null) {
                    //validar
                    String nome = "", cpf = "", rg = "", telefone = "", login = "", senha = "";

                    nome = request.getParameter("txtnome");
                    cpf = request.getParameter("txtcpf");
                    rg = request.getParameter("txtrg");
                    telefone = request.getParameter("txttelefone");
                    login = request.getParameter("txtlogin");
                    senha = request.getParameter("txtSenha");

                    if (!request.getParameter("txtnome").equals("") && !request.getParameter("txtcpf").equals("")
                            && !request.getParameter("txtrg").equals("")
                            && !request.getParameter("txttelefone").equals("")
                            && !request.getParameter("txtlogin").equals("")
                            && !request.getParameter("txtSenha").equals("")) {

                        PessoasBEAN cli = new PessoasBEAN();

                        PessoasBEAN clivalidar = (new PessoasDAO().LogarValidar(login, senha));
                        PessoasBEAN cliCPFDuplicado = (new PessoasDAO().validarCPFDuplicado(cpf));

                        cli.setNome(request.getParameter("txtnome"));
                        cli.setCpf(request.getParameter("txtcpf"));
                        cli.setRg(request.getParameter("txtrg"));
                        cli.setTelefone(request.getParameter("txttelefone"));
                        cli.setLogin(request.getParameter("txtlogin"));
                        cli.setSenha(request.getParameter("txtSenha"));

                        //converter string para java.util.date
//                        FilmesBEAN fil = new FilmesBEAN();
//                        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
//                        java.util.Date data = sf.parse(request.getParameter("txtdatalancamento"));
//                        fil.setFil_dataLancamento(data);

                        if (clivalidar != null) {
                            response.sendRedirect("cadastrarcliente.jsp?msg=Login ou senha ja existe :");
                        } else {
                            if (cliCPFDuplicado != null) {
                                response.sendRedirect("cadastrarcliente.jsp?msg=CPF JA FOI USADO:");
                            } else {
                                (new PessoasDAO()).inserir(cli);
                                response.sendRedirect("cadastrarcliente.jsp?msg=Dados Salvos! :");
                            }
                        }

                        cli = null;
                        clivalidar = null;
                        cliCPFDuplicado = null;

                    } else {
                        response.sendRedirect("cadastrarcliente.jsp?msg=informar todos os campos  !");
                    }
                }
                //CADASTRAR COMPRA DE INGRESSO
                if (request.getParameter("btnConfirma") != null) {

                    if (!request.getParameter("txtnomecartao").equals("") && !request.getParameter("txtnumerocartao").equals("")
                            && !request.getParameter("txtcodigodeseguranca").equals("") && !request.getParameter("ddpMes").equals("")
                            && !request.getParameter("ddpAno").equals("")) {

                        CardBEAN card = new CardBEAN();
                        card.setNumerodocartao(request.getParameter("txtnumerocartao"));
                        card.setNomecartao(request.getParameter("txtnomecartao"));
                        card.setCodigoseguranca(Integer.parseInt(request.getParameter("txtcodigodeseguranca")));
                        card.setCardmes(Integer.parseInt(request.getParameter("ddpMes")));
                        card.setCardanos(Integer.parseInt(request.getParameter("ddpAno")));
                        
                       
                        (new CardDAO()).inserir(card);
                        
                        CardBEAN codgocartao = new CardBEAN();
                        //codgocartao = (new CardDAO()).BuscarUltimacodigoInserido(card);
                        
                        
                        card.setCodigocartao ((new CardDAO()).BuscarUltimacodigoInserido2());
                        //ou
                        //CardDAO objDAO = new CardDAO();
                        //int codigocartao = objDAO..BuscarUltimacodigoInserido2();
                        //card.setCodigocartao(codigocartao);
                        
                        int testecodigo = card.getCodigocartao();
                     
                        if (testecodigo > 0) {
                            

                            if (!request.getParameter("qtdIngresso").equals("") && !request.getParameter("txtvalortotal").equals("")
                                    && !request.getParameter("txtdatadacompra").equals("")) {
                                
                                CompraIngressoBEAN CompraIngresso = new CompraIngressoBEAN();
                                CompraIngresso.setID_cardCodigo(testecodigo);
                                HttpSession sessao = request.getSession();
                                int codigopessoas = Integer.parseInt(sessao.getAttribute("Codigo").toString());
                                CompraIngresso.setID_pessoas(codigopessoas);
                                CompraIngresso.setID_ingresso(Integer.parseInt(request.getParameter("codigoingrsso")));
                                CompraIngresso.setComp_quantidade(Integer.parseInt(request.getParameter("qtdIngresso")));
              

                                   Date agora = new Date();
                                   
                                    CompraIngresso.setComp_dataDacompra(new java.sql.Date(agora.getTime()));
                                String vr = request.getParameter("txtvalortotal");
                                vr = vr.replace("R$ ","");
                                float valortotal =  Float.parseFloat(vr);
                                CompraIngresso.setComp_valorTotal(valortotal);

                                (new CompraIngressoDAO()).inserir(CompraIngresso);
                                
                                response.sendRedirect("compradocomsucesso.jsp");
                            }

                        }
                    }

                }
                //FIM DA COMPRA DE INGRESSO
                // ALTERAR PERFIL
                if (request.getParameter("btnalterar") != null) {
                    //validar
                    String nome = "", cpf = "", rg = "", telefone = "", login = "", senha = "";
                    int codigo = 0;

                    codigo = Integer.parseInt((request.getParameter("txtcodigo")));
                    nome = request.getParameter("txtnome");
                    cpf = request.getParameter("txtcpf");
                    rg = request.getParameter("txtrg");
                    telefone = request.getParameter("txttelefone");
                    login = request.getParameter("txtlogin");
                    senha = request.getParameter("txtSenha");

                    if (!request.getParameter("txtnome").equals("") && !request.getParameter("txtcpf").equals("")
                            && !request.getParameter("txtrg").equals("")
                            && !request.getParameter("txttelefone").equals("")
                            && !request.getParameter("txtlogin").equals("")
                            && !request.getParameter("txtSenha").equals("")) {

                        PessoasBEAN cli = new PessoasBEAN();
                        PessoasBEAN clivalidar = (new PessoasDAO().LogarValidar(login, senha));
                        PessoasBEAN cliCPFDuplicado = (new PessoasDAO().validarCPFDuplicado(cpf));

                        cli.setNome(request.getParameter("txtnome"));
                        cli.setCpf(request.getParameter("txtcpf"));
                        cli.setRg(request.getParameter("txtrg"));
                        cli.setTelefone(request.getParameter("txttelefone"));
                        cli.setLogin(request.getParameter("txtlogin"));
                        cli.setSenha(request.getParameter("txtSenha"));

                        if (codigo != 0) {
                            cli.setCod_pessoas(codigo);
                            (new PessoasDAO()).alterar(cli);
                            response.sendRedirect("editarperfiel.jsp?msg=Dados Alterado com sucesso! :");

                        }

                        cli = null;
                        clivalidar = null;
                        cliCPFDuplicado = null;

                    } else {
                        response.sendRedirect("editarperfiel.jsp?msg=informar todos os campos  !");
                    }
                }
                // FINAL DE ALTERAÇÃO
            } catch (Exception ex) {
                response.sendRedirect("cadastrarcliente.jsp?msg=ERRO !" + ex.getMessage());
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
