/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;


import BEAN.CompraIngressoBEAN;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author vruck
 */
public class CompraIngressoDAO {
    public void inserir(CompraIngressoBEAN CompraIngresso) throws SQLException {
        try {
            Connection con = ConnectionFactory.getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("insert into "
                    + "compraingresso (ID_ingresso,Comp_quantidade,Comp_valorTotal,ID_pessoas,Comp_dataDacompra,ID_cardCodigo )"
                    + "values(?,?,?,?,?,?)");
            //passagem de valores de  parametro;
            ps.setInt(1, CompraIngresso.getID_ingresso());
            ps.setInt(2, CompraIngresso.getComp_quantidade());
            ps.setFloat(3, CompraIngresso.getComp_valorTotal());
            ps.setInt(4, CompraIngresso.getID_pessoas());
            ps.setDate(5, new java.sql.Date(CompraIngresso.getComp_dataDacompra().getTime()));
            ps.setInt(6, CompraIngresso.getID_cardCodigo());

            //Executar
            ps.execute();
            //fechar comando e conexao
            ps.close();
            con.close();
        } catch (SQLException ex) {

        }

    }
}
