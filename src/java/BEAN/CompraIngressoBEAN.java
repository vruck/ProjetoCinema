/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BEAN;

import java.util.Date;

/**
 *
 * @author vruck
 */
public class CompraIngressoBEAN {
    private int codigocompraingresso;
    private int ID_ingresso;
    private int Comp_quantidade;
    private float Comp_valorTotal;
    private int ID_pessoas;
    private Date Comp_dataDacompra;
    private int ID_cardCodigo;

    public CompraIngressoBEAN(int codigocompraingresso, int ID_ingresso, int Comp_quantidade, float Comp_valorTotal, int ID_pessoas, Date Comp_dataDacompra, int ID_cardCodigo) {
        this.codigocompraingresso = codigocompraingresso;
        this.ID_ingresso = ID_ingresso;
        this.Comp_quantidade = Comp_quantidade;
        this.Comp_valorTotal = Comp_valorTotal;
        this.ID_pessoas = ID_pessoas;
        this.Comp_dataDacompra = Comp_dataDacompra;
        this.ID_cardCodigo = ID_cardCodigo;
    }

    
    public CompraIngressoBEAN() {
    }

    public int getCodigocompraingresso() {
        return codigocompraingresso;
    }

    public void setCodigocompraingresso(int codigocompraingresso) {
        this.codigocompraingresso = codigocompraingresso;
    }

    public int getID_ingresso() {
        return ID_ingresso;
    }

    public void setID_ingresso(int ID_ingresso) {
        this.ID_ingresso = ID_ingresso;
    }

    public int getComp_quantidade() {
        return Comp_quantidade;
    }

    public void setComp_quantidade(int Comp_quantidade) {
        this.Comp_quantidade = Comp_quantidade;
    }

    public float getComp_valorTotal() {
        return Comp_valorTotal;
    }

    public void setComp_valorTotal(float Comp_valorTotal) {
        this.Comp_valorTotal = Comp_valorTotal;
    }

    public int getID_pessoas() {
        return ID_pessoas;
    }

    public void setID_pessoas(int ID_pessoas) {
        this.ID_pessoas = ID_pessoas;
    }

    public Date getComp_dataDacompra() {
        return Comp_dataDacompra;
    }

    public void setComp_dataDacompra(Date Comp_dataDacompra) {
        this.Comp_dataDacompra = Comp_dataDacompra;
    }

    public int getID_cardCodigo() {
        return ID_cardCodigo;
    }

    public void setID_cardCodigo(int ID_cardCodigo) {
        this.ID_cardCodigo = ID_cardCodigo;
    }
    
    
}
