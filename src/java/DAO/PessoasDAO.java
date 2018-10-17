/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import BEAN.PessoasBEAN;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vruck
 */
public class PessoasDAO {

    public void inserir(PessoasBEAN cli) throws SQLException {
        try {
            Connection con = ConnectionFactory.getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("insert into "
                    + "pessoas (Pes_nome,Pes_cpf,Pes_rg,Pes_telefone,pes_login , Pes_senha)"
                    + "values(?,?,?,?,?,?)");
            //passagem de valores de  parametro;
            ps.setString(1, cli.getNome());
            ps.setString(2, cli.getCpf());
            ps.setString(3, cli.getRg());
            ps.setString(4, cli.getTelefone());
            ps.setString(5, cli.getLogin());
            ps.setString(6, cli.getSenha());
            //Executar
            ps.execute();
            //fechar comando e conexao
            ps.close();
            con.close();
        } catch (SQLException ex) {

        }

    }

    public void alterar(PessoasBEAN cli) throws SQLException {
        try {
            Connection con = ConnectionFactory.getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("update  "
                    + "pessoas set Pes_nome=?,Pes_cpf=?,Pes_rg=?,Pes_telefone=?,pes_login=? , Pes_senha=? "
                    + "where idPessoas=?");
            //passagem de valores de  parametro;
            ps.setString(1, cli.getNome());
            ps.setString(2, cli.getCpf());
            ps.setString(3, cli.getRg());
            ps.setString(4, cli.getTelefone());
            ps.setString(5, cli.getLogin());
            ps.setString(6, cli.getSenha());
            ps.setInt(7, cli.getCod_pessoas());
            //Executar
            ps.execute();
            //fechar comando e conexao
            ps.close();
            con.close();
        } catch (SQLException ex) {

        }

    }

    public void Excluir(int codigo) throws SQLException {
        try {
            Connection con = ConnectionFactory.getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("delete  "
                    + "from pessoas"
                    + "where idPessoas=?");
            //passagem de valores de  parametro;
            ps.setInt(1, codigo);

            //Executar
            ps.execute();
            //fechar comando e conexao
            ps.close();
            con.close();
        } catch (SQLException ex) {

        }
    }

    public PessoasBEAN selecionar(int codigo) throws SQLException {
        Connection con = ConnectionFactory.getConnection();
        PessoasBEAN cli = null;

        PreparedStatement ps = con.prepareStatement("select * "
                + "from pessoas where idPessoas = ?");
        ps.setInt(1, codigo);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            cli = new PessoasBEAN(codigo, rs.getString("Pes_nome"), rs.getString("Pes_cpf"), rs.getString("Pes_rg"), rs.getString("Pes_telefone"), rs.getString("pes_login"), rs.getString("Pes_senha"));

        }
        ps.close();
        con.close();
        return cli;
    }

    public List<PessoasBEAN> selecionar(String nome) throws SQLException {

        Connection con = ConnectionFactory.getConnection();
        List<PessoasBEAN> lista = new ArrayList<PessoasBEAN>();
        PessoasBEAN cli = null;
        PreparedStatement ps = con.prepareStatement("select * " + "from pessoas where Pes_nome like ? order by Pes_nome ");
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            cli = new PessoasBEAN(rs.getInt("idPessoas"), rs.getString("Pes_nome"), rs.getString("Pes_cpf"), rs.getString("Pes_rg"), rs.getString("Pes_telefone"), rs.getString("pes_login"), rs.getString("Pes_senha"));

            lista.add(cli);
        }
        rs.close();
        ps.close();
        con.close();
        return lista;
    }

    public PessoasBEAN Logar(String login, String senha) throws SQLException {
        Connection con = ConnectionFactory.getConnection();
        PessoasBEAN cli = null;

        PreparedStatement ps = con.prepareStatement("select * "
                + "from pessoas where pes_login = ? && Pes_senha = ? ");
        ps.setString(1, login);
        ps.setString(2, senha);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            cli = new PessoasBEAN(rs.getInt("idPessoas"), rs.getString("Pes_nome"), rs.getString("Pes_cpf"), rs.getString("Pes_rg"), rs.getString("Pes_telefone"), rs.getString("pes_login"), rs.getString("Pes_senha"));

        }
        ps.close();
        con.close();
        return cli;
    }

    public PessoasBEAN LogarValidar(String login, String senha) throws SQLException {
        Connection con = ConnectionFactory.getConnection();
        PessoasBEAN cli = null;

        PreparedStatement ps = con.prepareStatement("select * "
                + "from pessoas where pes_login = ? and Pes_senha = ? ");
        ps.setString(1, login);
        ps.setString(2, senha);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            cli = new PessoasBEAN(rs.getInt("idPessoas"), rs.getString("Pes_nome"), rs.getString("Pes_cpf"), rs.getString("Pes_rg"), rs.getString("Pes_telefone"), rs.getString("pes_login"), rs.getString("Pes_senha"));

        }
        ps.close();
        con.close();
        return cli;
    }

    public PessoasBEAN validarCPFDuplicado(String cpf) throws SQLException {
        Connection con = ConnectionFactory.getConnection();
        PessoasBEAN cli = null;

        PreparedStatement ps = con.prepareStatement("select * "
                + "from pessoas where Pes_cpf = ?  ");
        ps.setString(1, cpf);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            cli = new PessoasBEAN(rs.getInt("idPessoas"), rs.getString("Pes_nome"), rs.getString("Pes_cpf"), rs.getString("Pes_rg"), rs.getString("Pes_telefone"), rs.getString("pes_login"), rs.getString("Pes_senha"));

        }
        ps.close();
        con.close();
        return cli;
    }

}
