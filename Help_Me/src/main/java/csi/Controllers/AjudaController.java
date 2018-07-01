/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package csi.Controllers;

import csi.Modelos.Ajuda;
import csi.Modelos.Usuario;
import csi.com.mycompany.help_me.CRUD.AjudaCRUD;
import csi.com.mycompany.help_me.CRUD.UsuarioCRUD;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Clecio
 */
@Controller
public class AjudaController {
    @RequestMapping("newAjuda")
    public String NewAjuda(Ajuda ajuda) throws Exception{
        AjudaCRUD ac = new AjudaCRUD();
        ac.InsertAjuda(ajuda);
        UsuarioCRUD uc = new UsuarioCRUD();
        Usuario u = uc.GetUsuario(ajuda.getIdUsuario());
        return "redirect:login?linkFacebook="+u.getLinkFacebook();
    }
    
    @RequestMapping("updateAjuda")
    public ModelAndView EditAjuda(Ajuda ajuda) throws Exception{
        ModelAndView mv = null;
        AjudaCRUD ac = new AjudaCRUD();
        ac.UpdateAjuda(ajuda);
        
        mv = FuncoesUteis.GeraMVFeed(ajuda.getIdUsuario(), SetingValues.Requests.Feed.toString());
        
        return mv;
    }
    
    @RequestMapping("deleteAjuda")
    public ModelAndView EditAjuda(int idAjuda,String idUsuario) throws Exception{
        ModelAndView mv = null;
        AjudaCRUD ac = new AjudaCRUD();
        ac.DeleteAjuda(idAjuda);
        
        mv = FuncoesUteis.GeraMVFeed(idUsuario, SetingValues.Requests.Feed.toString());
        
        return mv;
    }
}
