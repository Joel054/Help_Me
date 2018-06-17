/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package csi.Controllers;

import csi.Modelos.AjudaProcesso;
import csi.com.mycompany.help_me.CRUD.AjudaProcessoCRUD;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Clecio
 */
@RequestMapping("updateLocal")
public class AjudaEmProcessoController {
    
    @RequestMapping("newAjudaEmProcesso")
    public ModelAndView NewAjudaEmProcesso(AjudaProcesso ajudaProcesso, String idUsuario)throws Exception{
        ModelAndView mv = null;
        AjudaProcessoCRUD ac = new AjudaProcessoCRUD();
        ac.InsertAjudaProcesso(ajudaProcesso);
        
        mv = FuncoesUteis.GeraMVFeed(idUsuario, SetingValues.Requests.Feed.toString());
        
        return mv;
    }
    
    @RequestMapping("updateAjudaEmProcesso")
    public ModelAndView UpdatejudaEmProcesso(AjudaProcesso ajudaProcesso, String idUsuario)throws Exception{
        ModelAndView mv = null;
        AjudaProcessoCRUD ac = new AjudaProcessoCRUD();
        ac.UpdateAjudaProcesso(ajudaProcesso);
        
        mv = FuncoesUteis.GeraMVFeed(idUsuario, SetingValues.Requests.Feed.toString());
        
        return mv;
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
