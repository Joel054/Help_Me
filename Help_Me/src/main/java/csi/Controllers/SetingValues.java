/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package csi.Controllers;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Clecio
 */
public class SetingValues {
    public enum StatusAjuda{Iniciado, EmProcesso, Finalizado, Cancelado, AvaliadoPorAjudante, AvaliadoPorAjudado, AvaliadoAll}
    public static String keyCodeGoogleApis ="AIzaSyB8S-wCG4Adqc2pRqeIYr-CyH6Mual8mZk";
    public enum Requests{
        Feed{
            @Override
            public String toString(){
                return ("inicio");
            }
        }
        ,Login_Error{
            @Override
            public String toString(){
                return ("/LoginError.jsp");
            }
        }
        ,Perfil_Logged_User{
            @Override
            public String toString(){
                return ("/PerfilLoggedUser.jsp");
            }
        },Perfil_Oter_User{
            @Override
            public String toString(){
                return ("/PerfilOterUser.jsp");
            }
        }
        ,Perfil_Error{
            @Override
            public String toString(){
                return ("/PerfilOterUser.jsp");
            }
        },
        User_already_exists{
            @Override
            public String toString(){
                return ("/PerfilOterUser.jsp");
            }
        }
    };
    private static final int buffingFeed = 10;
    private static final int raioAceito = 5000;
    
    
    
    public static int getBuffingFeed(){
        return buffingFeed;
    }

    static int getRaioAceito() {
        return raioAceito;
    }

    
}

