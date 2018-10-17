/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BEAN;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author vruck
 */
public class SessaoBEAN {
    private int idsessao ;
    private int id_filme ;      
    private Time ses_horainicial;
    private int id_sala;
    private String ses_status;
    private Date ses_data;
    private String data_ses;

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
    
   
    private String fil_titulo;
    private String fil_descricao;
    private int fil_idade;
    private String fil_imagem;
    private int codigoingre;
    private float in_valor;

    public float getIn_valor() {
        return in_valor;
    }

    public void setIn_valor(float in_valor) {
        this.in_valor = in_valor;
    }

    public int getCodigoingre() {
        return codigoingre;
    }

    public void setCodigoingre(int codigoingre) {
        this.codigoingre = codigoingre;
    }
    
   
    
    
    
    public String getData_ses() {
        return (new SimpleDateFormat("dd/MM/yyyy")).format(ses_data);
       
    }

    public void setData_ses(String data_ses) {
        this.data_ses = data_ses;
    }

    public SessaoBEAN() {
    }

    public SessaoBEAN(int idsessao, int id_filme, Time ses_horainicial, int id_sala, String ses_status, Date ses_data) {
        this.idsessao = idsessao;
        this.id_filme = id_filme;
        this.ses_horainicial = ses_horainicial;
        this.id_sala = id_sala;
        this.ses_status = ses_status;
        this.ses_data = ses_data;
    }

    
    public int getIdsessao() {
        return idsessao;
    }

    public void setIdsessao(int idsessao) {
        this.idsessao = idsessao;
    }

    public int getId_filme() {
        return id_filme;
    }

    public void setId_filme(int id_filme) {
        this.id_filme = id_filme;
    }

    public Time getSes_horainicial() {
        return ses_horainicial;
    }

    public void setSes_horainicial(Time ses_horainicial) {
        this.ses_horainicial = ses_horainicial;
    }

    public int getId_sala() {
        return id_sala;
    }

    public void setId_sala(int id_sala) {
        this.id_sala = id_sala;
    }

    public String getSes_status() {
        return ses_status;
    }

    public void setSes_status(String ses_status) {
        this.ses_status = ses_status;
    }

    public Date getSes_data() {
        return ses_data;
    }

    public void setSes_data(Date ses_data) {
        this.ses_data = ses_data;
    }

    
       public SessaoBEAN(int codigoingre ,float in_valor,Time ses_horainicial,int idsessao, int id_filme,  String ses_status, String fil_titulo, String fil_descricao, int fil_idade, String fil_imagem) {
        this.codigoingre = codigoingre;
        this.in_valor = in_valor;
        this.ses_horainicial = ses_horainicial;
        this.idsessao = idsessao;
        this.id_filme = id_filme;
       
        this.ses_status = ses_status;
        
        this.fil_titulo = fil_titulo;
        this.fil_descricao = fil_descricao;
        this.fil_idade = fil_idade;
        this.fil_imagem = fil_imagem;
    }      
}
