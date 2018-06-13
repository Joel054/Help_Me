/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.help_me.CRUD;

import Modelos.Local;
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
public class UsuarioCRUD {
    
    public void InsertUsuario(Usuario usuario) throws Exception{
        String sql = "insert into Usuario(nome,idade,likes,deslikes,linkFacebook)"
                + "values (?,?,?,?,?);";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setString(1, usuario.getNome());
        stmt.setInt(2, usuario.getIdade());
        stmt.setInt(3, usuario.getLikes());
        stmt.setInt(4, usuario.getDeslikes());
        stmt.setString(5, usuario.getLinkFacebook());
        stmt.execute();
        stmt.close();
        conecta.close();
    }
    
    public void DeleteUsuario(int idUsuario) throws SQLException, Exception{
        String sql = "DELETE from Usuario where id =?";
        
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setInt(1, idUsuario);
        stmt.executeUpdate();
        stmt.close();
        conecta.close();
    }
    
    public Usuario GetUsuario(int id) throws Exception{
        String sql = "select * from Usuario where id =?";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        Usuario usuario = new Usuario();
        while(rs.next()){
            usuario.setNome(rs.getString("nome"));
            usuario.setId(rs.getInt("id"));
            usuario.setIdade(rs.getInt("idade"));
            usuario.setLikes(rs.getInt("likes"));
            usuario.setDeslikes(rs.getInt("deslikes"));
            usuario.setLinkFacebook(rs.getString("linkFacebook"));
     /*       String sql1 = "select * from _Local l\n"
                            + "where exists( select idLcal from LocalUsuario where idUsuario = ? and idLocal = l.id);";
            PreparedStatement stmt1 =conecta.prepareStatement(sql);
            stmt1.setInt(1, id);
            ResultSet rs1 = stmt1.executeQuery();
            while(rs1.next()){
                Local local = new Local();
                local.setId(rs1.getInt("id"));
                local.setLatitude(rs1.getFloat("latitude"));
                local.setLongitude(rs1.getFloat("longitude"));
                local.setNome(rs1.getString("nome"));
                usuario.addLocais(local);
            }
         */
        }
        stmt.close();
        conecta.close();
        return usuario;
    }
    
    public List<Usuario> ListaUsuarios() throws Exception{
        ArrayList<Usuario> usuarios = new ArrayList<>(); 

        // carregar o driver           
       // criar a declaracao (statement) sql
       String sql = "select * from Usuario";
       Connection conecta = ConectaMysql.getConexao();
       PreparedStatement stmt =conecta.prepareStatement(sql);
       // executar instrucao sql
       ResultSet rs = stmt.executeQuery();
       // manipular o resultado da instrucao sql
       while(rs.next()){
           Usuario usuario = new Usuario();
           usuario.setNome(rs.getString("nome"));
           usuario.setId(rs.getInt("id"));
           usuario.setIdade(rs.getInt("idade"));
           usuario.setLikes(rs.getInt("likes"));
           usuario.setDeslikes(rs.getInt("deslikes"));
           usuario.setLinkFacebook(rs.getString("linkFacebook"));
           usuarios.add(usuario);
       }

       stmt.close();
       conecta.close();
       return usuarios;
    }
    
    public void UpdateUsuario(Usuario usuario) throws Exception{
        String sql = "update Usuario set nome =?, idade =?, likes =?, deslikes=?, linkFacebook=? "
                + "where id = ?";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        
        stmt.setString(1, usuario.getNome());
        stmt.setInt(2, usuario.getIdade());
        stmt.setInt(3, usuario.getLikes());
        stmt.setInt(4, usuario.getDeslikes());
        stmt.setString(5, usuario.getLinkFacebook());
        

        stmt.executeUpdate();
        stmt.close();
            conecta.close();
    }

    public Usuario Autentica(String linkFacebook) throws SQLException, Exception {
        String sql = "select * from Usuario where linkFacebook =?";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setString(1, linkFacebook);
        ResultSet rs = stmt.executeQuery();
        Usuario usuario = null;
        while(rs.next()){
            usuario = new Usuario();
            usuario.setNome(rs.getString("nome"));
            usuario.setId(rs.getInt("id"));
            usuario.setIdade(rs.getInt("idade"));
            usuario.setLikes(rs.getInt("likes"));
            usuario.setDeslikes(rs.getInt("deslikes"));
            usuario.setLinkFacebook(rs.getString("linkFacebook"));
     
        }
        stmt.close();
        conecta.close();
        return usuario;
    }
}
