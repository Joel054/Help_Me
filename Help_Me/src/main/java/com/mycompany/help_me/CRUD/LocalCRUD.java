/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.help_me.CRUD;

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
public class LocalCRUD {

    public LocalCRUD() {
    }
    public void InsertLocal(Local local) throws Exception{
        String sql = "insert into _local(nome,latitude,longitude)"
                + "values (?,?,?);";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setString(1, local.getNome());
        stmt.setFloat(2, local.getLatitude());
        stmt.setFloat(3, local.getLongitude());
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
        String sql = "update _local set nome =?, latitude =?, longitude =?"
                + "where id = ?";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setString(1, local.getNome());
        stmt.setFloat(2, local.getLatitude());
        stmt.setFloat(3, local.getLongitude());
        stmt.setInt(4, local.getId());
        stmt.executeUpdate();
        stmt.close();
        conecta.close();
    }

    public List<Local> ListaLocais(int idUsuario) throws Exception {
           ArrayList<Local> locais = new ArrayList<>(); 

        // carregar o driver           
       // criar a declaracao (statement) sql
       String sql = "select * from _local l where exists("
               + "select id from LocalUsuario lu inner join Usuario u on u.id = lu.idUsuario  where l.id = lu.idLocal and lu.idUsuario = ? ); ";
       Connection conecta = ConectaMysql.getConexao();
       PreparedStatement stmt =conecta.prepareStatement(sql);
       stmt.setInt(1, idUsuario);
       // executar instrucao sql
       ResultSet rs = stmt.executeQuery();
       // manipular o resultado da instrucao sql
       while(rs.next()){
           Local local = new Local();
           local.setId(rs.getInt("id"));
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
