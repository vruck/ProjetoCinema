/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import BEAN.CardBEAN;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author vruck
 */
public class CardDAO {

    public void inserir(CardBEAN card) throws SQLException {
        try {
            Connection con = ConnectionFactory.getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("insert into "
                    + "card_compra (card_numerodocartao,card_nome,card_codigoSeguranca,card_mes,card_ano )"
                    + "values(?,?,?,?,?)");
            //passagem de valores de  parametro;
              
            ps.setString(1, card.getNumerodocartao());
            ps.setString(2, card.getNomecartao());
            ps.setInt(3, card.getCodigoseguranca());
            ps.setInt(4, card.getCardmes());
            ps.setInt(5, card.getCardanos());

            //Executar
            ps.execute();
            //fechar comando e conexao
            ps.close();
            con.close();
        } catch (SQLException ex) {

        }

    }
    public CardBEAN BuscarUltimacodigoInserido(CardBEAN card) throws SQLException {
        
            Connection con = ConnectionFactory.getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("Select max(id) as codigo from cinema.card_compra");
            //passagem de valores de  parametro;
             ResultSet rs = ps.executeQuery();
             if (rs.next()) {
                 int codigo = rs.getInt("codigo");
                card = new CardBEAN(codigo);

            }
             
            //Executar
       
            //fechar comando e conexao
            ps.close();
            con.close();
            return card;
        

    }
    public int BuscarUltimacodigoInserido2() throws SQLException {
        int codigo = 0;
            Connection con = ConnectionFactory.getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("Select max(id) as codigo from cinema.card_compra");
            //passagem de valores de  parametro;
             ResultSet rs = ps.executeQuery();
             if (rs.next()) {
                 codigo = rs.getInt("codigo");
            }
             
            //Executar
       
            //fechar comando e conexao
            ps.close();
            con.close();
            return codigo;
        

    }
    
    

}
