/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package csi.Controllers;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
        return "index";
    }
}
