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
    public ModelAndView NewAjudaEmProcesso(AjudaProcesso ajudaProcesso)throws Exception{
        ModelAndView mv = null;
        AjudaProcessoCRUD ac = new AjudaProcessoCRUD();
        ac.InsertAjudaProcesso(ajudaProcesso);
        
        //adicionar models and view
        
        return mv;
    }
    
    @RequestMapping("updateAjudaEmProcesso")
    public ModelAndView UpdatejudaEmProcesso(AjudaProcesso ajudaProcesso)throws Exception{
        ModelAndView mv = null;
        AjudaProcessoCRUD ac = new AjudaProcessoCRUD();
        ac.UpdateAjudaProcesso(ajudaProcesso);
        
        //adicionar models and view
        
        return mv;
    }
    
    @RequestMapping("deleteAjudaEmProcesso")
    public ModelAndView DeletejudaEmProcesso(int idAjudaProcesso)throws Exception{
        ModelAndView mv = null;
        AjudaProcessoCRUD ac = new AjudaProcessoCRUD();
        ac.DeleteAjudaProcesso(idAjudaProcesso);
        
        //adicionar models and view
        
        return mv;
    }
}
