/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Modelos.Ajuda;
import Modelos.Local;
import Modelos.Usuario;
import com.mycompany.help_me.CRUD.AjudaCRUD;
import com.mycompany.help_me.CRUD.LocalCRUD;
import com.mycompany.help_me.CRUD.UsuarioCRUD;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Clecio
 */
public class FuncoesUteis {
    
    public static ModelAndView GeraMV(int idUsuario, String view, int offset) throws Exception{
        ModelAndView mv = null;
        
        UsuarioCRUD usuarioCrud = new UsuarioCRUD();
        Usuario usuario = usuarioCrud.GetUsuario(idUsuario);
        usuario.setPerfilAll();
        AjudaCRUD ajudaCrud = new AjudaCRUD();
        
        List<Ajuda> ajudasFeed = ajudaCrud.ListaAjudas(usuario.getId(),SetingValues.getBuffingFeed(), SetingValues.getRaioAceito(),offset);
        try{
            
            mv  = new ModelAndView(view);
            mv.addObject("UsuarioLogado", usuario);
            mv.addObject("ajudasFeed", ajudasFeed);
            mv.addObject("offset",offset+SetingValues.getBuffingFeed());
            
        } catch (Exception ex) {
            Logger.getLogger(FuncoesUteis.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return mv;
    }
}
