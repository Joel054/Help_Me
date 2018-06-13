/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.help_me.CRUD;

import Modelos.Ajuda;
import Modelos.Local;
import conexao.ConectaMysql;
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
public class AjudaCRUD {
    
    public static void main(String[] args) throws Exception {
        LocalCRUD lc = new LocalCRUD();
        List<Local> loc = lc.ListaLocais(); 
       
        AjudaCRUD ac =new AjudaCRUD();
        //ac.ListaAjudas(loc,2,2,2);
    }
    public void InsertAjuda(Ajuda ajuda) throws Exception{
        String sql = "insert into Ajuda(titulo,descricao,idUsuario,udLocal,tipo)"
                + "values (?,?,?,?,?);";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setString(1, ajuda.getTitulo());
        stmt.setString(2, ajuda.getDescricao());
        stmt.setInt(3, ajuda.getIdUsuario());
        stmt.setInt(4, ajuda.getIdLocal());
        stmt.setString(5, ajuda.getTipo());
        stmt.execute();
        stmt.close();
        conecta.close();
    }
    
    public void DeleteAjuda(int idAjuda) throws SQLException, Exception{
        String sql = "DELETE from Ajuda where id =?";
        
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setInt(1, idAjuda);
        stmt.executeUpdate();
        stmt.close();
        conecta.close();
    }
    
    public Ajuda GetAjuda(int id) throws Exception{
        String sql = "select * from Ajuda where id =?";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        Ajuda ajuda = new Ajuda();
        while(rs.next()){
            ajuda.setTitulo(rs.getString("titulo"));
            ajuda.setTipo(rs.getString("tipo"));
            ajuda.setDescricao(rs.getString("descricao"));
            ajuda.setId(rs.getInt("id"));
            ajuda.setIdLocal(rs.getInt("idLocal"));
            ajuda.setIdUsuario(rs.getInt("idUsuario"));
        }
        stmt.close();
        conecta.close();
        return ajuda;
    }
    
    public List<Ajuda> ListaAjudas() throws Exception{
        ArrayList<Ajuda> ajudas = new ArrayList<>(); 

        // carregar o driver           
       // criar a declaracao (statement) sql
       String sql = "select * from Ajuda";
       Connection conecta = ConectaMysql.getConexao();
       PreparedStatement stmt =conecta.prepareStatement(sql);
       // executar instrucao sql
       ResultSet rs = stmt.executeQuery();
       // manipular o resultado da instrucao sql
       while(rs.next()){
           Ajuda ajuda = new Ajuda();
           ajuda.setTitulo(rs.getString("titulo"));
           ajuda.setTipo(rs.getString("tipo"));
           ajuda.setDescricao(rs.getString("descricao"));
           ajuda.setId(rs.getInt("id"));
           ajuda.setIdLocal(rs.getInt("idLocal"));
           ajuda.setIdUsuario(rs.getInt("idUsuario"));
           ajudas.add(ajuda);
       }

       stmt.close();
       conecta.close();
       return ajudas;
    }
    
    public void UpdateAjuda(Ajuda ajuda) throws Exception{
        String sql = "update Ajuda set titulo =?, descricao =?, idUsuario =?, idLocal =?, tipo =?"
                + "where id = ?";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setString(1, ajuda.getTitulo());
        stmt.setString(2, ajuda.getDescricao());
        stmt.setInt(3, ajuda.getIdUsuario());
        stmt.setInt(4, ajuda.getIdLocal());
        stmt.setString(5, ajuda.getTipo());
        stmt.setInt(6, ajuda.getId());
        stmt.executeUpdate();
        stmt.close();
        conecta.close();
    }

    public List<Ajuda> ListaAjudas(int idUsuario) throws Exception {
            ArrayList<Ajuda> ajudas = new ArrayList<>(); 

        // carregar o driver           
       // criar a declaracao (statement) sql
       String sql = "select * from Ajuda a where idUsuario = ? ; ";
       Connection conecta = ConectaMysql.getConexao();
       PreparedStatement stmt =conecta.prepareStatement(sql);
       stmt.setInt(1, idUsuario);
       // executar instrucao sql
       ResultSet rs = stmt.executeQuery();
       // manipular o resultado da instrucao sql
       while(rs.next()){
           Ajuda ajuda = new Ajuda();
           ajuda.setTitulo(rs.getString("titulo"));
           ajuda.setTipo(rs.getString("tipo"));
           ajuda.setDescricao(rs.getString("descricao"));
           ajuda.setId(rs.getInt("id"));
           ajuda.setIdLocal(rs.getInt("idLocal"));
           ajuda.setIdUsuario(rs.getInt("idUsuario"));
           ajudas.add(ajuda);
       }

       stmt.close();
       conecta.close();
       return ajudas;
    }

    
    public List<Ajuda> ListaAjudas(int idUsuario, int buffingFeed, int distancia, int offset) throws Exception {
         ArrayList<Ajuda> ajudas = new ArrayList<>(); 

        // carregar o driver           
       // criar a declaracao (statement) sql
       
       String sql = "select * from _local l2 inner join Ajuda a on a.idLocal = l2.id inner join usuario u on u.id = a.idUsuario"
               + " inner join localusuario lu on lu.idUsuario = u.id inner join _local l on l.id = lu.idLocal "
               + "where (sqrt((l2.latitude - l.latitude)*(l2.latitude - l.latitude)))+"
               + "(sqrt((l2.longitude - l.longitude)*(l2.longitude - l.longitude)))<? and u.id = ? "
               + "ORDER BY a.id DESC limit ?;";
              
       Connection conecta = ConectaMysql.getConexao();
       PreparedStatement stmt =conecta.prepareStatement(sql);
       stmt.setInt(1, idUsuario);
       stmt.setInt(2, distancia);
       stmt.setInt(3, offset+buffingFeed);
       // executar instrucao sql
       ResultSet rs = stmt.executeQuery();
       int aux = 1;
       // manipular o resultado da instrucao sql
       while(rs.next()){
            //regeita os 'offset'primeiros
            if(aux>offset){
               Ajuda ajuda = new Ajuda();
               ajuda.setTitulo(rs.getString("titulo"));
               ajuda.setTipo(rs.getString("tipo"));
               ajuda.setDescricao(rs.getString("descricao"));
               ajuda.setId(rs.getInt("id"));
               ajuda.setIdLocal(rs.getInt("idLocal"));
               ajuda.setIdUsuario(rs.getInt("idUsuario"));
               ajudas.add(ajuda);
            }
            aux++;
       }

       stmt.close();
       conecta.close();
       return ajudas;
    }
}
