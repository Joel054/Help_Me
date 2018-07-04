/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package csi.Modelos;

import csi.com.mycompany.help_me.CRUD.AjudaCRUD;
import csi.com.mycompany.help_me.CRUD.LocalCRUD;
import java.util.List;

/**
 *
 * @author Clecio
 */
public class Usuario {
    private String id = "-1";
    private String nome;
    private String foto;
    private String linkFacebook;
    private String urlFacebook;
    private String telefone;
    private List<Ajuda> ajudas;
    private List<Local> locais;
    public Usuario() {
    }

    public Usuario(String id) throws Exception {
        setId(id);
    }
    
    

    public Usuario(String id, String nome, String linkFacebook) throws Exception {
        setId(id);
        this.nome = nome;
        this.linkFacebook = linkFacebook;
    }

    public void setPerfilAll() throws Exception{
        setAjudas();
        setLocais();
    }
    public String getId() {
        return id;
    }

    public void setId(String id) throws Exception {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
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
    
    
    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getUrlFacebook() {
        return urlFacebook;
    }

    public void setUrlFacebook(String urlFacebook) {
        this.urlFacebook = urlFacebook;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
    
}
