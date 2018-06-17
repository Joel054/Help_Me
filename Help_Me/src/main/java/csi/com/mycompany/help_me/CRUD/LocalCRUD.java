/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package csi.com.mycompany.help_me.CRUD;

import csi.Controllers.FuncoesUteis;
import csi.Modelos.Local;
import csi.conexao.ConectaMysql;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Clecio
 */
public class LocalCRUD {
    public static void main(String[] args) {
        Local l = new Local(0,"casdaasdadsa","sasdasdasdm",-29.710731f, -53.712217f);
        try {
            LocalCRUD lc = new LocalCRUD();
            lc.InsertLocal(l,"a");
        } catch (Exception ex) {
            Logger.getLogger(LocalCRUD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public LocalCRUD() {
    }
    public void InsertLocal(Local local,String idUsuario) throws Exception{
        local.setCidade(FuncoesUteis.GetCidade(local.getLatitude(),local.getLongitude()));
        String sql = "SELECT insertLocal(?,?,?,?,?);";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setString(1, local.getNome());
        stmt.setString(2, local.getCidade());
        stmt.setFloat(3, local.getLatitude());
        stmt.setFloat(4, local.getLongitude());
        stmt.setString(5, idUsuario);
        stmt.execute();
        stmt.close();
        conecta.close();
    }
    
    public void DeleteLocal(int idLocal) throws SQLException, Exception{
        String sql = "DELETE from _local where id =?";
        
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setInt(1, idLocal);
        stmt.executeUpdate();
        stmt.close();
        conecta.close();
    }
    
    public Local GetLocal(int id) throws Exception{
        String sql = "select * from _local where id =?";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        Local local = new Local();
        while(rs.next()){
            local.setNome(rs.getString("nome"));
            local.setCidade(rs.getString("cidade"));
            local.setId(rs.getInt("id"));
            local.setLatitude(rs.getFloat("latitude"));
            local.setLongitude(rs.getFloat("longitude"));
        }
        stmt.close();
        conecta.close();
        return local;
    }
    
    public List<Local> ListaLocais() throws Exception{
        ArrayList<Local> locais = new ArrayList<>(); 

        // carregar o driver           
       // criar a declaracao (statement) sql
       String sql = "select * from _local";
       Connection conecta = ConectaMysql.getConexao();
       PreparedStatement stmt =conecta.prepareStatement(sql);
       // executar instrucao sql
       ResultSet rs = stmt.executeQuery();
       // manipular o resultado da instrucao sql
       while(rs.next()){
           Local local = new Local();
           local.setId(rs.getInt("id"));
           local.setCidade(rs.getString("cidade"));
           local.setLatitude(rs.getFloat("latitude"));
           local.setLongitude(rs.getFloat("longitude"));
           local.setNome(rs.getString("nome"));
           locais.add(local);
       }

       stmt.close();
       conecta.close();
       return locais;
    }
    
    public void UpdateLocal(Local local) throws Exception{
        local.setCidade(FuncoesUteis.GetCidade(local.getLatitude(),local.getLongitude()));
        String sql = "update _local set nome =?, cidade=?, latitude =?, longitude =?"
                + "where id = ?";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        
        stmt.setString(1, local.getNome());
        stmt.setString(2, local.getCidade());
        stmt.setFloat(3, local.getLatitude());
        stmt.setFloat(4, local.getLongitude());
        stmt.setInt(5, local.getId());
        stmt.executeUpdate();
        stmt.close();
        conecta.close();
    }

    public List<Local> ListaLocais(String idUsuario) throws Exception {
           ArrayList<Local> locais = new ArrayList<>(); 

        // carregar o driver           
       // criar a declaracao (statement) sql
       String sql = "select * from _local l inner join localUsuario lu on lu.idLocal = l.id inner join Usuario u on lu.idUsuario = u.id where u.id = ? ; ";
       Connection conecta = ConectaMysql.getConexao();
       PreparedStatement stmt =conecta.prepareStatement(sql);
       stmt.setString(1, idUsuario);
       // executar instrucao sql
       ResultSet rs = stmt.executeQuery();
       // manipular o resultado da instrucao sql
       while(rs.next()){
           Local local = new Local();
           local.setId(rs.getInt("id"));
           local.setCidade(rs.getString("cidade"));
           local.setLatitude(rs.getFloat("latitude"));
           local.setLongitude(rs.getFloat("longitude"));
           local.setNome(rs.getString("nome"));
           locais.add(local);
       }

       stmt.close();
       conecta.close();
       return locais;
    }
}
