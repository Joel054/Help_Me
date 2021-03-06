/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package csi.Controllers;

import csi.Modelos.Ajuda;
import csi.Modelos.Facebook;
import csi.Modelos.Usuario;
import csi.com.mycompany.help_me.CRUD.AjudaCRUD;
import csi.com.mycompany.help_me.CRUD.UsuarioCRUD;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Clecio
 */
@Controller
public class FeedController {

    
   
    
    @RequestMapping("login")
    public ModelAndView login(String linkFacebook) throws Exception{
        ModelAndView mv = null;
        UsuarioCRUD usuarioCrud = new UsuarioCRUD();
        Facebook facebook = usuarioCrud.call_me(linkFacebook);
        Usuario usuario = usuarioCrud.Autentica(facebook.getId());
        if(usuario != null){
            usuario.setLinkFacebook(linkFacebook);
            usuario.setFoto(facebook.getFoto());
            usuario.setNome(facebook.getNome());
            usuario.setUrlFacebook(facebook.getLink());
            usuarioCrud.UpdateUsuario(usuario);
            System.out.println(""+usuario.getId()+"   linkface:  "+usuario.getLinkFacebook());
            mv = FuncoesUteis.GeraMVFeed(usuario.getId(), SetingValues.Requests.Feed.toString());
           // mv.addObject("offset",SetingValues.getBuffingFeed());
        }else{
            mv  = new ModelAndView(SetingValues.Requests.Index.toString());
            mv.addObject("LoginError", "Usuario não existente");
            mv.addObject("logedAuto","não logar");
        }
        return mv;
    }
    
    @RequestMapping("perfil")
    public ModelAndView getPerfil(String linkFacebook) throws Exception{
        ModelAndView mv = null;
        UsuarioCRUD usuarioCrud = new UsuarioCRUD();
        Facebook facebook = usuarioCrud.call_me(linkFacebook);
        Usuario usuario = usuarioCrud.Autentica(facebook.getId());
        if(usuario != null){
            usuario.setLinkFacebook(linkFacebook);
            usuarioCrud.UpdateUsuario(usuario);
            System.out.println(""+usuario.getId()+"   linkface:  "+usuario.getLinkFacebook());
            mv = FuncoesUteis.GeraMVFeed(usuario.getId(), SetingValues.Requests.Perfil_Logged_User.toString());
           // mv.addObject("offset",SetingValues.getBuffingFeed());
        }else{
            mv  = new ModelAndView(SetingValues.Requests.Index.toString());
            mv.addObject("LoginError", "Usuario não existente");
            mv.addObject("logedAuto","não logar");
        }
        return mv;
    }
    
  
    @RequestMapping("registrar")
    public ModelAndView RegistrerUser(String linkFacebook) throws Exception{
        ModelAndView mv = null;
        UsuarioCRUD usuarioCrud = new UsuarioCRUD();
        Facebook facebook = usuarioCrud.call_me(linkFacebook);
        Usuario usuario = usuarioCrud.Autentica(facebook.getId());
        if(usuario != null){
            mv  = new ModelAndView(SetingValues.Requests.Index.toString());
            mv.addObject("RegisterError", "Usuario ja existente");         
        }else{
            usuario = new Usuario(facebook.getId());
            usuario.setLinkFacebook(linkFacebook);
            usuario.setNome(facebook.getNome());
            usuario.setFoto(facebook.getFoto());
            usuario.setUrlFacebook(facebook.getLink());
            usuarioCrud.InsertUsuario(usuario);
            mv = login(linkFacebook);
        }
        return mv;
    }
    
}
