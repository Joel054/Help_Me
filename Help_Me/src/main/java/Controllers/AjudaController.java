/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Modelos.Ajuda;
import com.mycompany.help_me.CRUD.AjudaCRUD;
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
    public ModelAndView NewAjuda(Ajuda ajuda) throws Exception{
        ModelAndView mv = null;
        AjudaCRUD ac = new AjudaCRUD();
        ac.InsertAjuda(ajuda);
        
        //adicionar models and view
        
        return mv;
    }
    
    @RequestMapping("updateAjuda")
    public ModelAndView EditAjuda(Ajuda ajuda) throws Exception{
        ModelAndView mv = null;
        AjudaCRUD ac = new AjudaCRUD();
        ac.UpdateAjuda(ajuda);
        
        //adicionar models and view
        
        return mv;
    }
    
    @RequestMapping("deleteAjuda")
    public ModelAndView EditAjuda(int idAjuda) throws Exception{
        ModelAndView mv = null;
        AjudaCRUD ac = new AjudaCRUD();
        ac.DeleteAjuda(idAjuda);
        
        //adicionar models and view
        
        return mv;
    }
}
