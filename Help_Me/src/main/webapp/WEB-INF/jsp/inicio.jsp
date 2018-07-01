<%-- 
    Document   : Cadastro 
    Created on : 15/06/2018, 21:33:11
    Author     : vitor
--%>

<%@page import="csi.Modelos.Facebook"%>
<%@page import="csi.com.mycompany.help_me.CRUD.UsuarioCRUD"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Help Mi</title>
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="css/materialize.css">
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="css/responsive.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">

</head>
<!--<div id="fb-root"></div>-->
    <script>(function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = 'https://connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v3.0&appId=197552614211211&autoLogAppEvents=1';
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));</script>
    <script type="text/javascript">
  window.onload = function(){
  getLocation();
}
</script>

<body>
<!--  menu responsivo -->
<nav class="yellow">
    <div class="nav-wrapper yellow container">
        <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
        <!--menu normal-->
        <a href="" class="hide-on-med-and-down"><img src="img/logo-nova-texto.png"
                                                     style="height: 62px; width: 132px; font-family: moon;"></a>
        <!--localidade-->
        <div class="brand-logo center hide-on-med-and-down">
            <a class="dropdown-trigger black-text" href="#" style="font-family: moon;" data-target="dropdown">${facebook.local}<i
                    class="material-icons right black-text">expand_more</i></a>
            <ul id="dropdown" class="dropdown-content" style="font-family: moon;">
                <c:forEach var="locais" items="${UsuarioLogado.locais}"> 
                    <li><a href="#!" class="black-text">${locais.nome}</a></li>
                </c:forEach>
            </ul>
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
                <li><a href="#!" class="black-text">Inicio</a></li>
                <li><a href='javascript:perfil.submit()' class="black-text">histórico</a></li>
                <li><a href="#!" class="black-text">Inicio</a></li>
                <li><a href="index.jsp" class="fb-login-button black-text" data-button-type="login_with"  data-auto-logout-link="true" data-use-continue-as="true">Sair</a></li>
                
            </ul>
        </div>

        <!--menu responsivo-->
        <ul class="sidenav" id="mobile-demo">
            <li>
                <div class="user-view">
                <div class="background orange">

                </div>
                    <a href="#user" class="black-text" style="text-align: center"><img src="${facebook.foto}" class="circle"></a>
                    <a href="#name"><span class="white-text name">Olá</span></a>
                    <a href="#email"><span class="white-text email">Oriente-se</span></a>
                </div>
            </li>
            <li><a href="#" style="font-family: moon;" class="black-text text-darken-15">inicio</a></li>
            <li><a href="#" style="font-family: moon;" class="black-text text-darken-15">sobre</a></li>
            <li><!--localidade-->
                <a class="dropdown-trigger black-text" href="#" style="font-family: moon;" data-target="dropdown2">Local
                    <i class="material-icons right black-text">expand_more</i></a>
                <ul id="dropdown2" class="dropdown-content black-text">
                    <li><a href="#" style="font-family: moon;">teste</a></li>
                </ul>
            </li>
            </ul>
       
    </div>
</nav>

<!--botao adicionar ajuda-->
<div class="fixed-action-btn">
    <a href="#modal1" class="tooltipped btn-floating btn-large waves-effect waves-light deep-orange modal-trigger" data-position="left" data-tooltip="Criar nova solicitação">
        <i class="large material-icons">add</i>
    </a>
</div>
<div class="fixed-action-btn" style="bottom: 100px;">
    <a href="#modal-busca" class="tooltipped btn-floating btn-large waves-effect waves-light orange modal-trigger" data-position="left" data-tooltip="Buscar Ajuda">
        <i class="large material-icons">search</i>
    </a>
</div>
<div class="fixed-action-btn" style="bottom: 180px;">
    <a href="#modal-novolocal" class="tooltipped modal-trigger btn-floating  btn-large waves-effect waves-light light-red modal-trigger" data-position="left" data-tooltip="Alterar Localização atual">
        <i class="large material-icons">add_location</i>
    </a>
</div>

<main>
    
    <!--busca-->
    <div id="#buscar" class="container" style="margin-top: 20px">
        <div class="row ">
            <div class="col m12 s12">
                <form>
                    <div class="input-field">
                        <input id="search" type="search" placeholder="Buscar" style="background-color: #ffff8d;">
                        <label for="search"><i class="material-icons">search</i></label>
                        <i class="material-icons prefix">close</i>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--end busca-->

    
    <c:forEach var="ajudas" items="${ajudasFeed}"> 
        <c:choose>
            <c:when test="${ajudas.tipo != 'OferecendoAjuda'}">
                <!--card de ajuda-->
                <div class="container">
                    <div class="col s12 m12">
                        <div class="card darken-1 white">
                            <div class="card-content black-text">
                                <div class="cabecalho-card">
                                    <div class="row">
                                        <div class="col s12 m4">
                                            <div class="row">
                                                <div class="col s6 m3">
                                                    <img src="${facebook.foto}" class="circle" height="60px" width="60px" src="img/1.jpg">
                                                </div>
                                                <div class="col s6 m9 m-t-20">
                                                    <h6>${ajudas.usuario.nome}</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col s12 m4 center m-t-20">
                                            <h5>${ajudas.tipo}</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="container card-description">
                                    <p>${ajudas.titulo}</p>
                                    <p>${ajudas.descricao}</p>
                                    <p style="margin: 20px; font-size: 14px">${ajudas.local.nome}</p>
                                </div>
                                <div class="card-action">
                                    <div class="center">
                                        <form action="newAjudaEmProcesso" method="post"> 
                                            <input type="hidden" name="idAjudado" value="${ajudas.usuario.id}">
                                            <input type="hidden" name="idAjudante" value="${UsuarioLogado.id}"/>
                                            <input type="hidden" name="idAjuda" value="${ajudas.id}"/>
                                            <input type="hidden" name="status" value="Iniciado"/>
                                            <input type="hidden" name="idUsuario" value="${UsuarioLogado.id}"/>  
                                            
                                            <button type="submit" class="btn btn-large orange" style="width: 80%">Ajudar</button>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
            <!--card de ajuda-->
                <div class="container">
                    <div class="col s12 m12">
                        <div class="card darken-1 white">
                            <div class="card-content black-text">
                                <div class="cabecalho-card">
                                    <div class="row">
                                        <div class="col s12 m4">
                                            <div class="row">
                                                <div class="col s6 m3">
                                                    <img src="${facebook.foto}" class="circle" height="60px" width="60px" src="img/1.jpg">
                                                </div>
                                                <div class="col s6 m9 m-t-20">
                                                    <h6>${ajudas.usuario.nome}</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col s12 m4 center m-t-20">
                                            <h5>${ajudas.tipo}</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="container card-description">
                                    <p>${ajudas.titulo}</p>
                                    <p>${ajudas.descricao}</p>
                                    <p style="margin: 20px; font-size: 14px">${ajudas.local.nome}</p>
                                </div>
                                <div class="card-action">
                                    <div class="center">
                                        <form action="newAjudaEmProcesso" method="post"> 
                                            <input type="hidden" name="idAjudado" value="${ajudas.usuario.id}">
                                            <input type="hidden" name="idAjudante" value="${UsuarioLogado.id}"/>
                                            <input type="hidden" name="idAjuda" value="${ajudas.id}"/>
                                            <input type="hidden" name="status" value="Iniciado"/>
                                            <input type="hidden" name="idUsuario" value="${UsuarioLogado.id}"/>  
                                            
                                            <button type="submit" class="btn btn-large deep-orange" style="width: 80%">Pedir Ajuda</button>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <!--end card ajuda-->
    <!--card detalhes da ajuda-->
    <div class="container">
        <div class="col s12 m12">
            <div class="card darken-1 white">
                <div class="card-content black-text">
                    <div class="cabecalho-card">
                        <div class="row">
                            <div class="col s12 m4">
                                <div class="row">
                                    <div class="col s6 m3">
                                        <img class="circle" height="60px" width="60px" src="img/1.jpg">
                                    </div>
                                    <div class="col s6 m9 m-t-20">
                                        <h6>NOME</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col s12 m4 center m-t-20">

                            </div>
                            <div class="col s12 m4 m-t-20 center">
                                <h6>Perfil</h6>
                            </div>
                        </div>
                    </div>
                    <div class="container card-description">
                        <p>Lorem ipsum aosiudhj aisu Lorem ipsum aos iudhj ais uLorem ipsum aosi udhj aisuL orem ipsum
                            aos udhj aisu hasoduifh aosiudfh uisdfh </p>

                        <p style="margin: 20px; font-size: 14px">DATA 20/02/2012</p>
                    </div>
                    <div class="card-action">
                        <div class="center">
                            <a href="#" class="btn btn-large orange" style="width: 40%">Solicitar</a>
                            <a href="#" class="btn btn-large orange" style="width: 40%">Cancelar</a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!--End Detalhes-->
    <!--Card solicitação pedido-->
    <div class="container">
        <div class="col s12 m12">
            <div class="card darken-1 white">
                <div class="card-content black-text">
                    <div class="cabecalho-card">
                        <div class="row">
                            <div class="col s12 m4">
                                <div class="row">
                                    <div class="col s6 m3">
                                        <img class="circle" height="60px" width="60px" src="img/1.jpg">
                                    </div>
                                    <div class="col s6 m9 m-t-20">
                                        <h6>NOME</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col s12 m4 center m-t-20">

                            </div>
                            <div class="col s12 m4 m-t-20 center">
                                <h6>Perfil</h6>
                            </div>
                        </div>
                    </div>
                    <div class="container card-description">
                        <p>Lorem ipsum aosiudhj aisu Lorem ipsum aos iudhj ais uLorem ipsum aosi udhj aisuL orem ipsum
                            aos udhj aisu hasoduifh aosiudfh uisdfh </p>

                        <p style="margin: 20px; font-size: 14px">DATA 20/02/2012</p>
                    </div>
                    <div class="card-action">
                        <div class="center">
                            <a href="#" class="btn btn-large orange" style="width: 80%">João Solicitou ajuda nesta
                                tarefa</a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!--End Card solicitação pedido-->
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
                <button class="modal-close waves-effect waves-green btn-flat right orange" type="submit">Confirmar</button>
            </div>
        </div>
    </form>
    <!--end-MODAL-->  
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
                    <label for="textarea1">Dê um nome para seu local</label>
                    <input type="hidden" name="idUsuario" id="idUsuario" value="${facebook.id}"/>
                    <input type="hidden" name="latitude" id="latitude"/>
                    <input type="hidden" name="longitude" id="longitude"/>
                    </div>


                </div>

            </div>
            <div class="modal-footer">
              <button type="submit"  class="modal-close waves-effect waves-green btn-flat">Concluir</button>
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
    
    <!-- armazenar info para chamar perfil no menu -->
    <form action="perfil" method="post" id="perfil" name="perfil">
        <input type="hidden" name="linkFacebook" value="${UsuarioLogado.linkFacebook}"/>
    </form>
    
</main>
<!--logo, icone -->
<!--END index-->

<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- Compiled and minified JavaScript -->
<script src="js/materialize.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('.sidenav').sidenav();
    });

    document.addEventListener('DOMContentLoaded', function () {
        var elems = document.querySelectorAll('.dropdown-trigger');
        var instances = M.Dropdown.init(elems, options);
    });

    // Or with jQuery

    $('.dropdown-trigger').dropdown();
    document.addEventListener('DOMContentLoaded', function () {
        var elems = document.querySelectorAll('.modal');
        var instances = M.Modal.init(elems, options);
        var alignment = true;
    });

    // Or with jQuery

    $(document).ready(function () {
        $('.modal').modal();
    });
    //Tooltip
    $(document).ready(function(){
        $('.tooltipped').tooltip();
    });
    
    // select
    $(document).ready(function(){
    $('select').formSelect();
  });



</script>

<script>
var x = document.getElementById("demo");

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(myMap);
        navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}

function showPosition(position) {
    x.innerHTML = "Latitude: " + position.coords.latitude + 
    "<br>Longitude: " + position.coords.longitude;
    document.getElementById('latitude').value = ""+position.coords.latitude;
    document.getElementById('longitude').value = ""+position.coords.longitude;
}

function myMap(position) {
  var mapCanvas = document.getElementById("map");
  var myCenter=new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
  var mapOptions = {center: myCenter, zoom: 16};
  var marker = new google.maps.Marker({position:myCenter});
  var map = new google.maps.Map(mapCanvas, mapOptions);
  marker.setMap(map);
  google.maps.event.addListener(map, 'click', function(event) {
      // ------------------------- possivel implementacao para marcar ponto no mapa
    //placeMarker(map, event.latLng);
  });
}

function placeMarker(map, location) {
  var marker = new google.maps.Marker({
    position: location,
    map: map
  });
  var infowindow = new google.maps.InfoWindow({
    content: 'Latitude: ' + location.lat() + '<br>Longitude: ' + location.lng()
  });
  infowindow.open(map,marker);
}
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCmGfRWwdWoZ60npIg3nzj92UOdeBCG_sY&callback=myMap"></script>

</body>
</html>

