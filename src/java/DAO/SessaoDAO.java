/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import BEAN.FilmesBEAN;
import BEAN.SessaoBEAN;
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
public class SessaoDAO {
    
    
    public  List<SessaoBEAN> selecionar(int codigofilme) throws SQLException {

        Connection con = ConnectionFactory.getConnection();
        List<SessaoBEAN> lista = new ArrayList<SessaoBEAN>();
        SessaoBEAN SESSAO = null;
        PreparedStatement ps = con.prepareStatement("select * " + "from sessao  where ID_Filme = ?  ");
        ps.setInt(1, codigofilme);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            SESSAO = new SessaoBEAN(rs.getInt("idsessao"),rs.getInt("ID_Filme"),rs.getTime("ses_horaInicial"), 
                    rs.getInt("ID_Sala"), rs.getString("ses_Status"), rs.getDate("ses_data"));

            lista.add(SESSAO);
        }
        rs.close();
        ps.close();
        con.close();
        return lista;
    }
    
    
    public  List<SessaoBEAN> selecionarSessaoIngresso(int codigosessao) throws SQLException {

        Connection con = ConnectionFactory.getConnection();
        List<SessaoBEAN> lista = new ArrayList<SessaoBEAN>();
        SessaoBEAN SESSAO = null;
        PreparedStatement ps = con.prepareStatement("select * " + "from view_sessaoingresso  where idsessao = ?  ");
        ps.setInt(1, codigosessao);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            SESSAO = new SessaoBEAN(rs.getInt("idIngresso"),rs.getFloat("in_valor"),rs.getTime("ses_horainicial"),rs.getInt("idsessao"), rs.getInt("ID_Filme"),rs.getString("ses_Status"), rs.getString("Fil_titulo"),rs.getString("Fil_descricao") , rs.getInt("Fil_idade"), rs.getString("Fil_imagem"));
            lista.add(SESSAO);
        }
        rs.close();
        ps.close();
        con.close();
        return lista;
    }
}
