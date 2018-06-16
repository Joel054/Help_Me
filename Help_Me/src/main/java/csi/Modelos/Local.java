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
public class Local {
    private int id;
    private String nome;
    private String cidade;
    private float latitude;
    private float longitude;

    public Local() {
    }

    public Local(int id) {
        this.id = id;
    }

    public Local(int id, String nome, String cidade, float latitude, float longitude) {
        this.id = id;
        this.nome = nome;
        this.cidade = cidade;
        this.latitude = latitude;
        this.longitude = longitude;
    }

    public float getLongitude() {
        return longitude;
    }

    public void setLongitude(float longitude) {
        this.longitude = longitude;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public float getLatitude() {
        return latitude;
    }

    public void setLatitude(float latitude) {
        this.latitude = latitude;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }
    
}
