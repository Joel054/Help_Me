/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Modelos.Ajuda;
import Modelos.Usuario;
import com.mycompany.help_me.CRUD.AjudaCRUD;
import com.mycompany.help_me.CRUD.UsuarioCRUD;
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
        Usuario usuario = usuarioCrud.Autentica(linkFacebook);
        if(usuario != null){
            AjudaCRUD ajudaCrud = new AjudaCRUD();
            usuario.setLocais();
            List<Ajuda> ajudasFeed = ajudaCrud.ListaAjudasFeed(usuario.getId());
            mv  = new ModelAndView(SetingValues.Requests.Feed.toString());
            mv.addObject("UsuarioLogado", usuario);
            mv.addObject("ajudasFeed", ajudasFeed);
           // mv.addObject("offset",SetingValues.getBuffingFeed());
        }else{
            mv  = new ModelAndView(SetingValues.Requests.Login_Error.toString());
        }
        return mv;
    }
    
    
    @RequestMapping("getPerfil")
    public ModelAndView getPerfil(int idUsuario) throws Exception{
        UsuarioCRUD usuarioCrud = new UsuarioCRUD();
        Usuario usuario = usuarioCrud.GetUsuario(idUsuario);
        ModelAndView mv;
        if(usuario != null){
            usuario.setPerfilAll();
            mv = new ModelAndView(SetingValues.Requests.Perfil_Logged_User.toString());
            mv.addObject("perfilUsuario");
        }else{
            mv = new ModelAndView(SetingValues.Requests.Perfil_Error.toString());
        }
        return mv;
    }
    @RequestMapping("Registrar")
    public ModelAndView RegistrerUser(String linkFacebook) throws Exception{
        ModelAndView mv = null;
        UsuarioCRUD usuarioCrud = new UsuarioCRUD();
        Usuario usuario = usuarioCrud.Autentica(linkFacebook);
        if(usuario != null){
            mv  = new ModelAndView(SetingValues.Requests.User_already_exists.toString());            
        }else{
            AjudaCRUD ajudaCrud = new AjudaCRUD();
            usuario = new Usuario(linkFacebook);
            usuarioCrud.InsertUsuario(usuario);
            login(linkFacebook);
        }
        return mv;
    }
}
