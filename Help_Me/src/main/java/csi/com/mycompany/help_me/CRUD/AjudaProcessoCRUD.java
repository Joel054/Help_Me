/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package csi.com.mycompany.help_me.CRUD;

import csi.Modelos.AjudaProcesso;
import csi.conexao.ConectaMysql;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Clecio
 */
public class AjudaProcessoCRUD {
    public void InsertAjudaProcesso(AjudaProcesso ajuda) throws Exception{
        String sql = "insert into AjudaProcesso(idAjudado,idAjudante,idAjuda,status)"
                + "values (?,?,?,?);";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setString(1, ajuda.getIdAjudado());
        stmt.setString(2, ajuda.getIdAjudante());
        stmt.setInt(3, ajuda.getIdAjuda());
        stmt.setString(4, ajuda.getStatus());
        stmt.execute();
        stmt.close();
        conecta.close();
    }
    
    public void DeleteAjudaProcesso(int idAjuda) throws SQLException, Exception{
        String sql = "DELETE from AjudaProcesso where id =?";
        
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setInt(1, idAjuda);
        stmt.executeUpdate();
        stmt.close();
        conecta.close();
    }
    
    public AjudaProcesso GetAjudaProcesso(int id) throws Exception{
        String sql = "select * from AjudaProcesso where id =?";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        AjudaProcesso ajuda = new AjudaProcesso();
        while(rs.next()){
            ajuda.setIdAjuda(rs.getInt("idAjuda"));
            ajuda.setIdAjudante(rs.getString("idAjudante"));
            ajuda.setIdAjudado(rs.getString("idAjudado"));
            ajuda.setStatus(rs.getString("status"));
            ajuda.setId(rs.getInt("id"));
        }
        stmt.close();
        conecta.close();
        return ajuda;
    }
    
    public List<AjudaProcesso> ListaAjudaProcessos() throws Exception{
        ArrayList<AjudaProcesso> ajudas = new ArrayList<>(); 

        // carregar o driver           
       // criar a declaracao (statement) sql
       String sql = "select * from AjudaProcesso";
       Connection conecta = ConectaMysql.getConexao();
       PreparedStatement stmt =conecta.prepareStatement(sql);
       // executar instrucao sql
       ResultSet rs = stmt.executeQuery();
       // manipular o resultado da instrucao sql
       while(rs.next()){
           AjudaProcesso ajuda = new AjudaProcesso();
           ajuda.setIdAjuda(rs.getInt("idAjuda"));
           ajuda.setIdAjudante(rs.getString("idAjudante"));
           ajuda.setIdAjudado(rs.getString("idAjudado"));
           ajuda.setStatus(rs.getString("status"));
           ajuda.setId(rs.getInt("id"));
           ajudas.add(ajuda);
       }

       stmt.close();
       conecta.close();
       return ajudas;
    }
    
    public void UpdateAjudaProcesso(AjudaProcesso ajuda) throws Exception{
        String sql = "update AjudaProcesso set idAjudado =?, idAjudante =?, idAjuda =?, status =?"
                + "where id = ?";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setString(1, ajuda.getIdAjudado());
        stmt.setString(2, ajuda.getIdAjudante());
        stmt.setInt(3, ajuda.getIdAjuda());
        stmt.setString(4, ajuda.getStatus());
        stmt.setInt(5, ajuda.getId());
        stmt.executeUpdate();
        stmt.close();
        conecta.close();
    }
    public List<AjudaProcesso> ListaAjudaProcessos(int idUsuario) throws Exception{
        ArrayList<AjudaProcesso> ajudas = new ArrayList<>(); 
        
        // carregar o driver           
       // criar a declaracao (statement) sql
       String sql = "select * from AjudaProgresso ap where idAjudado = ? or idAjudante = ?;";
       Connection conecta = ConectaMysql.getConexao();
       PreparedStatement stmt =conecta.prepareStatement(sql);
       stmt.setInt(1, idUsuario);
       stmt.setInt(2, idUsuario);
       // executar instrucao sql
       ResultSet rs = stmt.executeQuery();
       // manipular o resultado da instrucao sql
       while(rs.next()){
           AjudaProcesso ajuda = new AjudaProcesso();
           ajuda.setIdAjuda(rs.getInt("ap.idAjuda"));
           ajuda.setIdAjudante(rs.getString("ap.idAjudante"));
           ajuda.setIdAjudado(rs.getString("ap.idAjudado"));
           ajuda.setStatus(rs.getString("ap.status"));
           ajuda.setId(rs.getInt("ap.id"));           
           ajudas.add(ajuda);
       }

       stmt.close();
       conecta.close();
       return ajudas;
    }
    public List<AjudaProcesso> ListaAjudaProcessos(int id, String campo) throws Exception{
        ArrayList<AjudaProcesso> ajudas = new ArrayList<>(); 
        
        // carregar o driver           
       // criar a declaracao (statement) sql
       String sql = "select * from AjudaProgresso ap where "+campo+" = ?;";
       Connection conecta = ConectaMysql.getConexao();
       PreparedStatement stmt =conecta.prepareStatement(sql);
       stmt.setInt(1, id);
       // executar instrucao sql
       ResultSet rs = stmt.executeQuery();
       // manipular o resultado da instrucao sql
       while(rs.next()){
           AjudaProcesso ajuda = new AjudaProcesso();
           ajuda.setIdAjuda(rs.getInt("ap.idAjuda"));
           ajuda.setIdAjudante(rs.getString("ap.idAjudante"));
           ajuda.setIdAjudado(rs.getString("ap.idAjudado"));
           ajuda.setStatus(rs.getString("ap.status"));
           ajuda.setId(rs.getInt("ap.id"));           
           ajudas.add(ajuda);
       }

       stmt.close();
       conecta.close();
       return ajudas;
    }
}
