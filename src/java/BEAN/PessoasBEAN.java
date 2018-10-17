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
public class PessoasBEAN {

    private int cod_pessoas;
    private String nome;
    private String cpf;
    private String rg;
    private String telefone;
    private String login;
    private String senha;

    public int getCod_pessoas() {
        return cod_pessoas;
    }

    public void setCod_pessoas(int cod_pessoas) {
        this.cod_pessoas = cod_pessoas;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public PessoasBEAN() {
    }

    public PessoasBEAN(int cod_pessoas, String nome, String cpf, String rg, String telefone, String login, String senha) {
        this.cod_pessoas = cod_pessoas;
        this.nome = nome;
        this.cpf = cpf;
        this.rg = rg;
        this.telefone = telefone;
        this.login = login;
        this.senha = senha;
    }

}
