/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Clecio
 */
public class SetingValues {
    public enum StatusAjuda{Iniciado, EmProcesso, Finalizado, Cancelado, AvaliadoPorAjudante, AvaliadoPorAjudado, AvaliadoAll}
    public enum Requests{
        Feed{
            @Override
            public String toString(){
                return ("/Feed.jsp");
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

