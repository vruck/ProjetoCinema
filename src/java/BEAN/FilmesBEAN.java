/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BEAN;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author vruck
 */
public class FilmesBEAN {

    private int fil_codigo;
    private String fil_titulo;
    private String fil_descricao;
    private int fil_idade;
    private String fil_imagem;
    private String fil_duracao;
    private String fil_datedelancamento;
    private Date fil_dataLancamento;
    private String fil_filmeTipo;

     public String getDatanscimentoString() {
       return (new SimpleDateFormat("dd/MM/YYYY")).format(fil_dataLancamento);
       
    }
    public Date getFil_dataLancamento() {
        return fil_dataLancamento;
    }

    public void setFil_dataLancamento(Date fil_dataLancamento) {
        this.fil_dataLancamento = fil_dataLancamento;
    }

    public int getFil_codigo() {
        return fil_codigo;
    }

    public void setFil_codigo(int fil_codigo) {
        this.fil_codigo = fil_codigo;
    }

    public String getFil_titulo() {
        return fil_titulo;
    }

    public void setFil_titulo(String fil_titulo) {
        this.fil_titulo = fil_titulo;
    }

    public String getFil_descricao() {
        return fil_descricao;
    }

    public void setFil_descricao(String fil_descricao) {
        this.fil_descricao = fil_descricao;
    }

    public int getFil_idade() {
        return fil_idade;
    }

    public void setFil_idade(int fil_idade) {
        this.fil_idade = fil_idade;
    }

    public String getFil_imagem() {
        return fil_imagem;
    }

    public void setFil_imagem(String fil_imagem) {
        this.fil_imagem = fil_imagem;
    }

    public String getFil_duracao() {
        return fil_duracao;
    }

    public void setFil_duracao(String fil_duracao) {
        this.fil_duracao = fil_duracao;
    }

    public String getFil_datedelancamento() {
      return (new SimpleDateFormat("yyyy-MM-dd")).format(fil_dataLancamento);
    }

    public void setFil_datedelancamento(String fil_datedelancamento) {
        this.fil_datedelancamento = fil_datedelancamento;
       
    }

    public String getFil_filmeTipo() {
        return fil_filmeTipo;
    }

    public void setFil_filmeTipo(String fil_filmeTipo) {
        this.fil_filmeTipo = fil_filmeTipo;
    }

    public FilmesBEAN() {
    }

    public FilmesBEAN(int fil_codigo, String fil_titulo, String fil_descricao, int fil_idade, String fil_imagem, String fil_duracao, String fil_filmeTipo ,Date fil_datalancamento) {
        this.fil_codigo = fil_codigo;
        this.fil_titulo = fil_titulo;
        this.fil_descricao = fil_descricao;
        this.fil_idade = fil_idade;
        this.fil_imagem = fil_imagem;
        this.fil_duracao = fil_duracao;
      
        this.fil_filmeTipo = fil_filmeTipo;
        this.fil_dataLancamento = fil_datalancamento;
    }

}
