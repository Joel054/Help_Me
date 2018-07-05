<%@page import="csi.Modelos.Facebook"%>
<%@page import="csi.com.mycompany.help_me.CRUD.UsuarioCRUD"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>  <!--menu-->
<!--  menu responsivo -->
<nav class="yellow">
    <div class="nav-wrapper yellow container">
        <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
        <!--menu normal-->
        <a href="javascript:login.submit()" class="hide-on-med-and-down"><img src="img/logo-nova-texto.png" style="height: 62px; width: 132px; font-family: moon;"></a>
        <!--localidade-->
        <div class="brand-logo center hide-on-med-and-down">
            <a class=" black-text" href="#" style="font-family: moon;" data-target="dropdown">${facebook.local}</a>
            
        </div>
        <!--menu: inicio, historico-->
         <div class="brand-logo right hide-on-med-and-down">
             <a class='dropdown-trigger black-text' href='#' style="font-family: moon bold;" data-target='dropdown1'>Menu<i
                    class="material-icons right">expand_more</i></a>
            <!-- Dropdown Structure -->
            <ul id='dropdown1' class='dropdown-content black-text'>
                <li style="text-align: center" >
                     <a href='javascript:perfil.submit()' class="black-text"><img src="${facebook.foto}" class="circle">Perfil</a>
                </li>
                <li><a href="javascript:login.submit()" class="black-text">Inicio</a></li>
                <li><a href='javascript:perfil.submit()' class="black-text">Historico</a></li>
                <li><a href='javascript:sair.submit()' class="fb-login-button black-text" data-max-rows="1" data-button-type="login_with" data-auto-logout-link="true" data-use-continue-as="false">Sair</a></li>
                
            </ul>
        </div>
        <!--menu responsivo-->
        <ul class="sidenav" id="mobile-demo">
            <li>
                <div class="user-view">
                <div class="background orange"></div>
                <div class="row">
                    <div class="col s4 m4">    
                        <a href="#user" class="black-text" style="text-align: center"><img src="${facebook.foto}" class="circle"></a>
                    </div>    
                    <div class="col s8 m8">    
                        <p>${facebook.nome}</p>
                    </div>
                        <a href="#name"><span class="white-text name">olá</span></a>
                        <a><span class="white-text email">Oriente-se</span></a>
                    </div>
                </div>
            </li>
            <li><a href="#" style="font-family: moon;" class="black-text text-darken-15">Inicio</a></li>
            <li><a href="#" style="font-family: moon;" class="black-text text-darken-15">Perfil</a></li>
            <li><a href="#modal1" style="font-family: moon;" class="black-text text-darken-15 modal-trigger">Criar nova Ajuda</a></li>
            <li><a href="index.jsp" class="fb-login-button black-text" data-button-type="login_with"  data-auto-logout-link="true" data-use-continue-as="true">Sair</a></li>
        </ul>
       
    </div>
</nav>
<!--botoes laterais flutuantes-->
<!--botao adicionar ajuda-->
<div class="fixed-action-btn">
    <a href="#modal1" class="tooltipped btn-floating btn-large waves-effect waves-light deep-orange modal-trigger" data-position="left" data-tooltip="Criar nova solicitacao">
        <i class="large material-icons">add</i>
    </a>
</div>
<!--botao buscar-->
<div class="fixed-action-btn" style="bottom: 100px;">
    <a href="#modal-busca" class="tooltipped btn-floating btn-large waves-effect waves-light orange modal-trigger" data-position="left" data-tooltip="Buscar Ajuda">
        <i class="large material-icons">search</i>
    </a>
</div>
<!--botao adicionar local-->
<div class="fixed-action-btn" style="bottom: 180px;">
    <a href="#modal-novolocal" class="tooltipped modal-trigger btn-floating  btn-large waves-effect waves-light light-red modal-trigger" data-position="left" data-tooltip="Alterar Localizacao atual">
        <i class="large material-icons">add_location</i>
    </a>
</div>
    <!--<!-- Modal Pedir/oferecer ajuda -->
    <form action="newAjuda" method="post">
        <div id="modal1" class="modal modal-fixed-footer">
            <div class="modal-content center">
                    <div class="container">
                        <div class="row">
                            <div class="col s12">
                                <div class="row">
                                    <div class="input-field col s12" >
                                      <select id="tipo" name="tipo">
                                          <option value="OferecendoAjuda">Oferecer Ajuda</option>
                                          <option value="pedidoDeAjuda">Pedir ajuda</option>
                                      </select>
                                      <label for="textarea1">Selecione o tipo de ajuda</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <textarea id="textarea1" class="materialize-textarea" id="titulo" name="titulo"></textarea>
                                        <label for="textarea1">Titulo</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <textarea id="textarea1" class="materialize-textarea" id="descricao" name="descricao"></textarea>
                                        <label for="textarea1">Descricao</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12" >
                                      <select id="idLocal" name="idLocal">
                                        <c:forEach var="locais" items="${UsuarioLogado.locais}"> 
                                            <option value="${locais.id}">${locais.nome}</option>
                                        </c:forEach>
                                      </select>
                                      <label for="textarea1">Selecione o local</label>
                                    </div>
                                    <input type="hidden" name="idUsuario" id="idUsuario" value="${facebook.id}"/>
                                </div>
                            </div>
                        </div>
                    
                    </div>
            </div>
            <div class="modal-footer">
                <a href="#!" class="modal-close waves-effect waves-green btn-flat left grey">Fechar</a>
                <button onclick="M.toast({html: 'Ajuda Inserida', classes: 'rounded'})" class="modal-close waves-effect waves-green btn-flat right orange btn" type="submit">Confirmar</button>
            </div>
        </div>
    </form>
    <!-- Modal Cadastrar novo local -->
    <div id="modal-novolocal" class="modal modal-fixed-footer">
        <form action="newLocal" method="post">
            <div class="modal-content center">
              <h4>Cadastrar novo Local</h4>
                <div class="row">
                    <div class="col m9 s12">
                        <div id="map" style="width:100%;height:100%;"></div>
                    </div>
                    <div class="col m3 s12">
                        <p id="demo"></p>
                        <textarea id="textarea1" class="materialize-textarea" id="nome" name="nome" required></textarea>
                        <label for="textarea1">De um nome para seu local</label>
                        <input type="hidden" name="idUsuario" id="idUsuario" value="${facebook.id}"/>
                        <input type="hidden" name="latitude" id="latitude"/>
                        <input type="hidden" name="longitude" id="longitude"/>
                    </div>


                </div>

            </div>
            <div class="modal-footer">
              <button type="submit" onclick="M.toast({html: 'Local Inserido', classes: 'rounded'})" class="modal-close waves-effect waves-green btn-flat">Concluir</button>
            </div>
        </form>
    </div>
    <!-- Modal Busca-->
     <div id="modal-busca" class="modal bottom-sheet">
    <div class="modal-content">
      <h4>Buscar</h4>
       <nav>
            <div class="nav-wrapper white">
              <form>
                <div class="input-field">
                  <input id="search" type="search" required>
                  <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                  <i class="material-icons">close</i>
                </div>
              </form>
            </div>
        </nav>
    </div>
  </div>

