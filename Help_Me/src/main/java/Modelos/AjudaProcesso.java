/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import Controllers.SetingValues.StatusAjuda;
import com.mycompany.help_me.CRUD.UsuarioCRUD;
/**
 *
 * @author Clecio
 */
public class AjudaProcesso {
    private int id;
    private int idAjudado;
    private int idAjudante;
    private int idAjuda;
    private StatusAjuda status;
    private Usuario ajudado;
    private Usuario ajudante;
    public AjudaProcesso() {
    }

    public AjudaProcesso(int id) {
        this.id = id;
        
    }

    public AjudaProcesso(int id, int idAjudado, int idAjudante, int idAjuda, String status) throws Exception {
        this.id = id;
        setIdAjudado(idAjudado);
        setIdAjudante(idAjudante);
        this.idAjuda = idAjuda;
        setStatus(status);
    }

    public int getIdAjuda() {
        return idAjuda;
    }

    public void setIdAjuda(int idAjuda) throws Exception {
        this.idAjuda = idAjuda;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdAjudado() {
        return idAjudado;
    }

    public void setIdAjudado(int idAjudado) throws Exception {
        this.idAjudado = idAjudado;
        UsuarioCRUD uc = new UsuarioCRUD();
        ajudado = uc.GetUsuario(idAjudado);
    }

    public int getIdAjudante() {
        return idAjudante;
    }

    public void setIdAjudante(int idAjudante) throws Exception {
        this.idAjudante = idAjudante;
        UsuarioCRUD uc = new UsuarioCRUD();
        ajudante = uc.GetUsuario(idAjudante);
    }

    public String getStatus() {
        return status.toString();
    }

    public void setStatus(String status) {
        this.status =StatusAjuda.valueOf(status);
    }

    public Usuario getAjudado() {
        return ajudado;
    }

    public void setAjudado(Usuario ajudado) {
        this.ajudado = ajudado;
    }

    public Usuario getAjudante() {
        return ajudante;
    }

    public void setAjudante(Usuario ajudante) {
        this.ajudante = ajudante;
    }
    
}
