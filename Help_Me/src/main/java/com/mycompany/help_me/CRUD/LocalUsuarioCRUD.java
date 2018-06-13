/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.help_me.CRUD;

import Modelos.Local;
import Modelos.LocalUsuario;
import Modelos.Usuario;
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
public class LocalUsuarioCRUD {
    public void InsertLocalUsuario(LocalUsuario localUsuario) throws Exception{
        String sql = "insert into LocalUsuario(idUsuario,idLocal)"
                + "values (?,?);";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setInt(1, localUsuario.getIdUsuario());
        stmt.setInt(2, localUsuario.getIdLocal());
        stmt.execute();
        stmt.close();
        conecta.close();
    }
    
    public void DeleteLocalUsuario(int idAjuda) throws SQLException, Exception{
        String sql = "DELETE from LocalUsuario where id =?";
        
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setInt(1, idAjuda);
        stmt.executeUpdate();
        stmt.close();
        conecta.close();
    }
    
    public LocalUsuario GetLocalUsuario(int id) throws Exception{
        String sql = "select * from LocalUsuario where id =?";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        LocalUsuario localU = new LocalUsuario();
        while(rs.next()){
            localU.setIdLocal(rs.getInt("idLocal"));
            localU.setIdUsuario(rs.getInt("idUsuario"));
            localU.setId(rs.getInt("id"));
        }
        stmt.close();
        conecta.close();
        return localU;
    }
    
    public List<Local> ListaLocaisUsuario(int idUsuario) throws Exception{
        ArrayList<Local> locais = new ArrayList<>(); 

        // carregar o driver           
       // criar a declaracao (statement) sql
       String sql = "select * from LocalUsuario where id =?";
       Connection conecta = ConectaMysql.getConexao();
       PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setInt(1, idUsuario);
       // executar instrucao sql
       ResultSet rs = stmt.executeQuery();
       // manipular o resultado da instrucao sql
       while(rs.next()){
           int idLocal = rs.getInt("idLocal");
           LocalCRUD localCRUD = new LocalCRUD();
           Local local =localCRUD.GetLocal(idLocal);
           locais.add(local);
       }
       stmt.close();
       conecta.close();
       return locais;
    }
    
    public List<Usuario> ListaUsuariosLocal(int idLocal) throws Exception{
        ArrayList<Usuario> usuarios = new ArrayList<>(); 

        // carregar o driver           
       // criar a declaracao (statement) sql
       String sql = "select * from LocalUsuario where id =?";
       Connection conecta = ConectaMysql.getConexao();
       PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setInt(1, idLocal);
       // executar instrucao sql
       ResultSet rs = stmt.executeQuery();
       // manipular o resultado da instrucao sql
       while(rs.next()){
           int idUsuario = rs.getInt("idUsuario");
           UsuarioCRUD usuarioCRUD = new UsuarioCRUD();
           Usuario usuario =usuarioCRUD.GetUsuario(idUsuario);
           usuarios.add(usuario);
       }
       stmt.close();
       conecta.close();
       return usuarios;
    }
    
    public void UpdateLocalUsuario(LocalUsuario localUsuario) throws Exception{
        String sql = "update LocalUsuario set idUsuario =?, idLocal =?"
                + "where id = ?";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setInt(1, localUsuario.getIdUsuario());
        stmt.setInt(2, localUsuario.getIdLocal());
        stmt.setInt(3, localUsuario.getId());
        stmt.executeUpdate();
        stmt.close();
        conecta.close();
    }
}
