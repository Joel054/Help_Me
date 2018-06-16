/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package csi.Modelos;

/**
 *
 * @author Clecio
 */
public class LocalUsuario {
    private int id;
    private int idUsuario;
    private int idLocal;

    public LocalUsuario() {
    }

    public LocalUsuario(int id) {
        this.id = id;
    }

    public LocalUsuario(int id, int idUsuario, int idLocal) {
        this.id = id;
        this.idUsuario = idUsuario;
        this.idLocal = idLocal;
    }

    public int getIdLocal() {
        return idLocal;
    }

    public void setIdLocal(int idLocal) {
        this.idLocal = idLocal;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
}
