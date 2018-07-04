/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package csi.Controllers;

import csi.Modelos.Usuario;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

/**
 *
 * @author clecio
 */
@Controller
public class IndexController {

    //@RequestMapping(value = {"","/"})
    public String index(){
        
        return "redirect:inicial";
    }
    
    @RequestMapping("inicial")
    public String home(){
        
        return SetingValues.Requests.Index.toString();
    }
    
    @RequestMapping(value = {""})
    public RedirectView home2(){
        
        return new RedirectView("inicial", true);
    }
    
    @RequestMapping("logout")
    public String logout(HttpSession session){
        session.invalidate();
        return SetingValues.Requests.Index.toString();
    }
    @RequestMapping("testee")
    public ResponseEntity<List<Usuario>> teste(String nome) throws Exception{
        List<Usuario> ls = new ArrayList<>();
        ls.add(new Usuario("1", nome, "www.sdfsdfsdf"));
         return new ResponseEntity<List<Usuario>>(ls, HttpStatus.OK);
    }
  
}
