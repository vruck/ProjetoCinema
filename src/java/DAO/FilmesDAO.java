/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import BEAN.FilmesBEAN;
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
public class FilmesDAO {
     public void inserir(FilmesBEAN cli) throws SQLException {
        try {
            Connection con = ConnectionFactory.getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("insert into "
                    + "filmes (Fil_titulo,Fil_descricao,Fil_idade,Fil_imagem,Fil_duracao , Fil_DataDelancamento, Fil_filme_tipo)"
                    + "values(?,?,?,?,?,?,?)");
            //passagem de valores de  parametro;
            ps.setString(1, cli.getFil_titulo());
            ps.setString(2, cli.getFil_descricao());
            ps.setInt(3, cli.getFil_idade());
            ps.setString(4, cli.getFil_imagem());
            ps.setString(5, cli.getFil_duracao());
            ps.setDate(6, (new java.sql.Date(cli.getFil_dataLancamento().getTime())));
            ps.setString(7, cli.getFil_filmeTipo());
            //Executar
            ps.execute();
            //fechar comando e conexao
            ps.close();
            con.close();
        } catch (SQLException ex) {

        }

    }

    public void alterar(FilmesBEAN cli) throws SQLException {
        try {
            Connection con = ConnectionFactory.getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("update  "
                    + "filmes set Fil_titulo=? , Fil_descricao=? ,Fil_idade=?,Fil_imagem=?,Fil_duracao=? , Fil_DataDelancamento=?, Fil_filme_tipo=?"
                    + "where idFilmes=?");
            //passagem de valores de  parametro;
             ps.setString(1, cli.getFil_titulo());
            ps.setString(2, cli.getFil_descricao());
            ps.setInt(3, cli.getFil_idade());
            ps.setString(4, cli.getFil_imagem());
            ps.setString(5, cli.getFil_duracao());
            ps.setDate(6,  (new java.sql.Date(cli.getFil_dataLancamento().getTime())));
            ps.setString(7, cli.getFil_filmeTipo());
            ps.setInt(8, cli.getFil_codigo());
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
                    + "from filmes"
                    + "where idFilmes=?");
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
    public  List<FilmesBEAN> selecionar(String tipo) throws SQLException {

        Connection con = ConnectionFactory.getConnection();
        List<FilmesBEAN> lista = new ArrayList<FilmesBEAN>();
        FilmesBEAN fil = null;
        PreparedStatement ps = con.prepareStatement("select * " + "from filmes  where Fil_filme_tipo = ?  ");
        ps.setString(1, tipo);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            fil = new FilmesBEAN(rs.getInt("idFilmes"), rs.getString("Fil_titulo"), rs.getString("Fil_descricao"), rs.getInt("Fil_idade"), rs.getString("Fil_imagem") , rs.getString("Fil_duracao"), rs.getString("Fil_filme_tipo"), rs.getDate("Fil_DataDelancamento"));

            lista.add(fil);
        }
        rs.close();
        ps.close();
        con.close();
        return lista;
    }
    
    public  FilmesBEAN selecionarfilmenoticia(String tipo) throws SQLException {

        Connection con = ConnectionFactory.getConnection();
        
        FilmesBEAN fil = null;
        PreparedStatement ps = con.prepareStatement("select * " + "from filmes  where Fil_imagem = ?  ");
        ps.setString(1, tipo);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            fil = new FilmesBEAN(rs.getInt("idFilmes"), rs.getString("Fil_titulo"), rs.getString("Fil_descricao"), rs.getInt("Fil_idade"), rs.getString("Fil_imagem") , rs.getString("Fil_duracao"), rs.getString("Fil_filme_tipo"), rs.getDate("Fil_DataDelancamento"));

           
        }
        rs.close();
        ps.close();
        con.close();
        return fil;
    }
    
    public  FilmesBEAN selecionarcodigo(int codigo) throws SQLException {

        Connection con = ConnectionFactory.getConnection();
        
        FilmesBEAN fil = null;
        PreparedStatement ps = con.prepareStatement("select * " + "from filmes  where idFilmes = ?  ");
        ps.setInt(1, codigo);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            fil = new FilmesBEAN(rs.getInt("idFilmes"), rs.getString("Fil_titulo"), rs.getString("Fil_descricao"), rs.getInt("Fil_idade"), rs.getString("Fil_imagem") , rs.getString("Fil_duracao"), rs.getString("Fil_filme_tipo"),rs.getDate("Fil_DataDelancamento"));

           
        }
        rs.close();
        ps.close();
        con.close();
        return fil;
    }
}
