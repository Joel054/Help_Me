/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.help_me.CRUD;

import Modelos.Facebook;
import Modelos.Local;
import Modelos.Usuario;
import conexao.ConectaMysql;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;

/**
 *
 * @author Clecio
 */
public class UsuarioCRUD {
    
    public static Facebook call_me(String access_token) throws Exception {
    String url = "https://graph.facebook.com/v3.0/me?fields=id%2Cname%2Cpicture%2Cemail%2Clocation%2Clink&access_token="+access_token;
     
    URL obj = new URL(url);
    HttpURLConnection con = (HttpURLConnection) obj.openConnection();
    // optional default is GET
    con.setRequestMethod("GET");
    //add request header
    con.setRequestProperty("User-Agent", "Mozilla/5.0");
    int responseCode = con.getResponseCode();
    System.out.println("\nSending 'GET' request to URL : " + url);
    System.out.println("Response Code : " + responseCode);
    BufferedReader in = new BufferedReader(
            new InputStreamReader(con.getInputStream()));
    String inputLine;
    StringBuffer response = new StringBuffer();
    while ((inputLine = in.readLine()) != null) {
       response.append(inputLine);
    }
    in.close();
    //print in String
    System.out.println(response.toString());
     
    Facebook facebook = new Facebook();
    JSONObject myResponse = new JSONObject(response.toString());
    
    //id
    facebook.setId(myResponse.getString("id"));    
    //nome
    facebook.setNome(myResponse.getString("name"));
    //email
    facebook.setEmail(myResponse.getString("email"));
    //foto
    JSONObject picture_response=myResponse.getJSONObject("picture");
    JSONObject data_response=picture_response.getJSONObject("data");
    System.out.println("URL : "+data_response.getString("url"));
    facebook.setFoto(data_response.getString("url"));
    //local id e nome
    JSONObject location_response=myResponse.getJSONObject("location");
    facebook.setLocalId(location_response.getString("id"));
    facebook.setLocal(location_response.getString("name"));
    //link p face
    facebook.setLink(myResponse.getString("link"));

    return facebook;
   }
    
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
