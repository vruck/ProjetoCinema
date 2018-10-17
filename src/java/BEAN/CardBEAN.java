/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BEAN;

/**
 *
 * @author vruck
 */
public class CardBEAN {
    private int codigocartao;

    public CardBEAN(int codigocartao) {
        this.codigocartao = codigocartao;
    }
    
    private String numerodocartao;
    private String nomecartao;
    private int codigoseguranca;
    private int cardmes;
    private int cardanos;

    public CardBEAN(int codigocartao ,String numerodocartao, String nomecartao, int codigoseguranca, int cardmes, int cardanos) {
       this.codigocartao = codigocartao;
        this.numerodocartao = numerodocartao;
        this.nomecartao = nomecartao;
        this.codigoseguranca = codigoseguranca;
        this.cardmes = cardmes;
        this.cardanos = cardanos;
    }

    public CardBEAN() {
    }

    public int getCodigocartao() {
        return codigocartao;
    }

    public void setCodigocartao(int codigocartao) {
        this.codigocartao = codigocartao;
    }

    public String getNumerodocartao() {
        return numerodocartao;
    }

    public void setNumerodocartao(String numerodocartao) {
        this.numerodocartao = numerodocartao;
    }

    public String getNomecartao() {
        return nomecartao;
    }

    public void setNomecartao(String nomecartao) {
        this.nomecartao = nomecartao;
    }

    public int getCodigoseguranca() {
        return codigoseguranca;
    }

    public void setCodigoseguranca(int codigoseguranca) {
        this.codigoseguranca = codigoseguranca;
    }

    public int getCardmes() {
        return cardmes;
    }

    public void setCardmes(int cardmes) {
        this.cardmes = cardmes;
    }

    public int getCardanos() {
        return cardanos;
    }

    public void setCardanos(int cardanos) {
        this.cardanos = cardanos;
    }
    
    
}
