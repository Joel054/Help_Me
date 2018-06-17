/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package csi.Controllers;

import csi.Modelos.Local;
import csi.com.mycompany.help_me.CRUD.LocalCRUD;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Clecio
 */
@Controller
public class LocalController {
    @RequestMapping("newLocal")
    public ModelAndView NewLocalUsuario(Local local,int idUsuario) throws Exception{
        ModelAndView mv = null;
        LocalCRUD lc = new LocalCRUD();
        lc.InsertLocal(local,idUsuario);
        
        return FuncoesUteis.GeraMVFeed(idUsuario, SetingValues.Requests.Feed.toString());
        
    }
    
    @RequestMapping("updateLocal")
    public ModelAndView UpdateLocal(Local local, int idUsuario) throws Exception{
        ModelAndView mv = null;
        LocalCRUD lc = new LocalCRUD();
        lc.UpdateLocal(local);
        
        return FuncoesUteis.GeraMVFeed(idUsuario, SetingValues.Requests.Feed.toString());
    }
    
    @RequestMapping("deleteLocal")
    public ModelAndView DeleteLocal(int idLocal, int idUsuario) throws Exception{
        ModelAndView mv = null;
        LocalCRUD lc = new LocalCRUD();
        lc.DeleteLocal(idLocal);
        
        return FuncoesUteis.GeraMVFeed(idUsuario, SetingValues.Requests.Feed.toString());
    }
}
