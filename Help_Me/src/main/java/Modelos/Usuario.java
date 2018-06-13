/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import com.mycompany.help_me.CRUD.AjudaCRUD;
import com.mycompany.help_me.CRUD.LocalCRUD;
import java.util.List;

/**
 *
 * @author Clecio
 */
public class Usuario {
    private int id = -1;
    private String nome;
    private int idade;
    private int likes;
    private int deslikes;
    private String linkFacebook;
    private List<Ajuda> ajudas;
    private List<Local> locais;
    public Usuario() {
    }

    public Usuario(int id) throws Exception {
        setId(id);
    }

    public Usuario(String linkFacebook) {
        this.linkFacebook = linkFacebook;
    }
    
    

    public Usuario(int id, String nome, int idade, int likes, int deslikes, String linkFacebook) throws Exception {
        setId(id);
        this.nome = nome;
        this.idade = idade;
        this.likes = likes;
        this.deslikes = deslikes;
        this.linkFacebook = linkFacebook;
    }

    public void setPerfilAll() throws Exception{
        setAjudas();
        setLocais();
    }
    public int getId() {
        return id;
    }

    public void setId(int id) throws Exception {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public int getDeslikes() {
        return deslikes;
    }

    public void setDeslikes(int deslikes) {
        this.deslikes = deslikes;
    }

    public String getLinkFacebook() {
        return linkFacebook;
    }

    public void setLinkFacebook(String linkFacebook) {
        this.linkFacebook = linkFacebook;
    }

    public List<Ajuda> getAjudas() {
        return ajudas;
    }

    public void setAjudas(List<Ajuda> ajudas) {
        this.ajudas = ajudas;
    }

    public List<Local> getLocais() {
        return locais;
    }

    public void setLocais(List<Local> locais) {
        this.locais = locais;
    }

    public void setLocais() throws Exception {
        LocalCRUD lc = new LocalCRUD();
        locais = lc.ListaLocais(id);
    }
    public void setAjudas() throws Exception{
        AjudaCRUD ac = new AjudaCRUD();
        ajudas = ac.ListaAjudas(id);
    }
}
