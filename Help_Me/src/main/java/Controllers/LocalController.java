/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Modelos.Local;
import com.mycompany.help_me.CRUD.LocalCRUD;
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
        
        //adicionar models and view
        
        return mv;
    }
    
    @RequestMapping("updateLocal")
    public ModelAndView UpdateLocal(Local local) throws Exception{
        ModelAndView mv = null;
        LocalCRUD lc = new LocalCRUD();
        lc.UpdateLocal(local);
        
        //adicionar models and view
        
        return mv;
    }
    
    @RequestMapping("deleteLocal")
    public ModelAndView DeleteLocal(int idLocal) throws Exception{
        ModelAndView mv = null;
        LocalCRUD lc = new LocalCRUD();
        lc.DeleteLocal(idLocal);
        
        //adicionar models and view
        
        return mv;
    }
}
