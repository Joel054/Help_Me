/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package csi.Controllers;

import csi.Modelos.AjudaProcesso;
import csi.Modelos.Usuario;
import csi.com.mycompany.help_me.CRUD.AjudaProcessoCRUD;
import csi.com.mycompany.help_me.CRUD.UsuarioCRUD;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Clecio
 */
@Controller
public class AjudaEmProcessoController {
    
    @RequestMapping("newAjudaEmProcesso")
    public String NewAjudaEmProcesso(AjudaProcesso ajudaProcesso, String idUsuario)throws Exception{
        AjudaProcessoCRUD ac = new AjudaProcessoCRUD();
        ac.InsertAjudaProcesso(ajudaProcesso);
        
        UsuarioCRUD uc = new UsuarioCRUD();
        Usuario u = uc.GetUsuario(idUsuario);
        return "redirect:login?linkFacebook="+u.getLinkFacebook();
    }
    
    @RequestMapping("updateAjudaEmProcesso")
    public String UpdatejudaEmProcesso(AjudaProcesso ajudaProcesso, String idUsuario)throws Exception{
        AjudaProcessoCRUD ac = new AjudaProcessoCRUD();
        System.out.println("aqui é: "+ ajudaProcesso.getId());
        ac.UpdateAjudaProcesso(ajudaProcesso);
        
        UsuarioCRUD uc = new UsuarioCRUD();
        Usuario u = uc.GetUsuario(idUsuario);
        return "redirect:perfil?linkFacebook="+u.getLinkFacebook();
    }
    
    @RequestMapping("deleteAjudaEmProcesso")
    public ModelAndView DeletejudaEmProcesso(int idAjudaProcesso, String idUsuario)throws Exception{
        ModelAndView mv = null;
        AjudaProcessoCRUD ac = new AjudaProcessoCRUD();
        ac.DeleteAjudaProcesso(idAjudaProcesso);
        
        mv = FuncoesUteis.GeraMVFeed(idUsuario, SetingValues.Requests.Feed.toString());
        
        return mv;
    }
}
