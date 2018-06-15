/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Modelos.Ajuda;
import Modelos.Local;
import Modelos.Usuario;
import Controllers.SetingValues;
import com.mycompany.help_me.CRUD.AjudaCRUD;
import com.mycompany.help_me.CRUD.LocalCRUD;
import com.mycompany.help_me.CRUD.UsuarioCRUD;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 *
 * @author Clecio
 */
public class FuncoesUteis {
    public static void main(String[] args) throws Exception {
                Local l1 = new Local(0, "zxczxc","sm", -29.691084f, -53.810689f);
                Local l2 = new Local(0, "zxczxc","sm", -29.688437f, -53.812609f);
                List<Local> ll = new ArrayList<>();
                ll.add(l2);
                l2 = new Local(0, "zxczxc","sm", -29.686293f, -53.816825f);
                ll.add(l2);
	       GetDistancias(l1,ll);
    }
    public static ModelAndView GeraMV(int idUsuario, String view) throws Exception{
        ModelAndView mv = null;
        
        UsuarioCRUD usuarioCrud = new UsuarioCRUD();
        Usuario usuario = usuarioCrud.GetUsuario(idUsuario);
        usuario.setPerfilAll();
        AjudaCRUD ajudaCrud = new AjudaCRUD();
        
        List<Ajuda> ajudasFeed = ajudaCrud.ListaAjudas(usuario.getId());
        try{
            
            mv  = new ModelAndView(view);
            mv.addObject("UsuarioLogado", usuario);
            mv.addObject("ajudasFeed", ajudasFeed);
            
        } catch (Exception ex) {
            Logger.getLogger(FuncoesUteis.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return mv;
    }
    public static String GetCidade(float latitude, float longitude) throws ParserConfigurationException, SAXException, IOException, XPathExpressionException{
        String caminhoArquivo = "https://maps.google.com/maps/api/geocode/xml?address="+latitude+","+longitude+"&key="+SetingValues.keyCodeGoogleApis;
        String filtro = "/GeocodeResponse/result[contains(type,'locality')]/address_component[contains(type,'locality')]/long_name";
        String cidade = FiltroXML(caminhoArquivo,filtro);
        return cidade;
    }
    public static List<Float> GetDistancias(Local origem, List<Local> destinos) throws SAXException, IOException, ParserConfigurationException, XPathExpressionException{
        String destino ="";
        int aux = 0;
        for(Local l : destinos){
            destino = destino+l.getLatitude()+","+l.getLongitude();
            aux++;
            if(aux<destinos.size()){
                destino = destino+"|";
            }
        }
        String caminhoArquivo = "https://maps.googleapis.com/maps/api/distancematrix/xml?units=imperial&origins="+origem.getLatitude()+","+origem.getLongitude()+"&destinations="+destino+"&key="+SetingValues.keyCodeGoogleApis;
        System.out.println(caminhoArquivo);
        String filtro = "/*";
        String resposta = FiltroXML(caminhoArquivo,filtro);
        System.out.println(resposta);
        return null;
    }
    static String FiltroXML(String caminhoArquivo,String Filtro) throws SAXException, IOException, ParserConfigurationException, XPathExpressionException{
        DocumentBuilderFactory factory =
        DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse(caminhoArquivo);
        javax.xml.xpath.XPath xPath =  XPathFactory.newInstance().newXPath();
        XPathExpression xPathExpression = xPath.compile(Filtro);
        NodeList lista = (NodeList) xPathExpression.evaluate(document,XPathConstants.NODESET);
        for(int i = 0; i < lista.getLength();i++) {
            Element entrada = (Element) lista.item(i);
            return (entrada.getTextContent());
        }
        return "";
    }
}
