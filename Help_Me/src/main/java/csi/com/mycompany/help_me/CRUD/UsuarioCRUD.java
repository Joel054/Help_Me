/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package csi.com.mycompany.help_me.CRUD;

import csi.Modelos.Facebook;
import csi.Modelos.Local;
import csi.Modelos.Usuario;
import csi.conexao.ConectaMysql;
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
        String url = "https://graph.facebook.com/v3.0/me?fields=id%2Cname%2Cpicture%2Cemail%2Clocation%2Clink%2Cbirthday&access_token="+access_token;
     
        System.out.println(access_token+" linkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
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
        facebook.setAccess_token(access_token);
        //data de aniversario
        facebook.setAniversario(myResponse.getString("birthday"));
        
        return facebook;
    }
    
    public void InsertUsuario(Usuario usuario) throws Exception{
        String sql = "insert into Usuario(id,nome,urlFacebook,telefone,foto,linkFacebook)"
                + "values (?,?,?,?,?,?);";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setString(1, usuario.getId());
        stmt.setString(2, usuario.getNome());
        stmt.setString(3, usuario.getUrlFacebook());
        stmt.setString(4, usuario.getTelefone());
        stmt.setString(5, usuario.getFoto());
        stmt.setString(6, usuario.getLinkFacebook());
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
    
    public Usuario GetUsuario(String id) throws Exception{
        String sql = "select * from Usuario where id =?";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setString(1, id);
        ResultSet rs = stmt.executeQuery();
        Usuario usuario = new Usuario();
        while(rs.next()){
            usuario.setNome(rs.getString("nome"));
            usuario.setId(rs.getString("id"));
            usuario.setUrlFacebook(rs.getString("urlFacebook"));
            usuario.setTelefone(rs.getString("telefone"));
            usuario.setFoto(rs.getString("foto"));
            usuario.setLinkFacebook(rs.getString("linkFacebook"));
     
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
        usuario.setId(rs.getString("id"));
        usuario.setUrlFacebook(rs.getString("urlFacebook"));
        usuario.setTelefone(rs.getString("telefone"));
        usuario.setFoto(rs.getString("foto"));
        usuario.setLinkFacebook(rs.getString("linkFacebook"));
           usuarios.add(usuario);
       }

       stmt.close();
       conecta.close();
       return usuarios;
    }
    
    public void UpdateUsuario(Usuario usuario) throws Exception{
        String sql = "update Usuario set nome =?, urlFacebook =?, telefone =?, foto=?, linkFacebook=? "
                + "where id = ?";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        
        stmt.setString(1, usuario.getNome());
        stmt.setString(2, usuario.getUrlFacebook());
        stmt.setString(3, usuario.getTelefone());
        stmt.setString(4, usuario.getFoto());
        stmt.setString(5, usuario.getLinkFacebook());
        stmt.setString(6, usuario.getId());

        stmt.executeUpdate();
        stmt.close();
            conecta.close();
    }

    public Usuario Autentica(String id) throws SQLException, Exception {
        String sql = "select * from Usuario where id =?";
        Connection conecta = ConectaMysql.getConexao();
        PreparedStatement stmt =conecta.prepareStatement(sql);
        stmt.setString(1, id);
        ResultSet rs = stmt.executeQuery();
        Usuario usuario = null;
        while(rs.next()){
            usuario = new Usuario();
            usuario.setNome(rs.getString("nome"));
            usuario.setId(rs.getString("id"));
            usuario.setUrlFacebook(rs.getString("urlFacebook"));
            usuario.setTelefone(rs.getString("telefone"));
            usuario.setFoto(rs.getString("foto"));
            usuario.setLinkFacebook(rs.getString("linkFacebook"));
     
        }
        stmt.close();
        conecta.close();
        return usuario;
    }
}
