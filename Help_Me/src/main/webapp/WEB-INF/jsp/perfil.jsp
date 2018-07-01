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
            <a class="dropdown-trigger black-text" href="#" style="font-family: moon;" data-target="dropdown">Camobi<i
                    class="material-icons right black-text">expand_more</i></a>
            <ul id="dropdown" class="dropdown-content" style="font-family: moon;">
                <li><a href="#" class="black-text">teste</a></li>
                <li><a href="#" class="black-text">teste</a></li>
                <li><a href="#" class="black-text">teste</a></li>
            </ul>
        </div>
        <!--menu: inicio, historico-->
         <div class="brand-logo right hide-on-med-and-down">
             <a class='dropdown-trigger black-text' href='#' style="font-family: moon bold;" data-target='dropdown1'>Menu<i
                    class="material-icons right">expand_more</i></a>
            <!-- Dropdown Structure -->
            <ul id='dropdown1' class='dropdown-content black-text'>
                <li style="text-align: center"><a href="#!" class="black-text"><img src="${facebook.foto}" class="circle">
                        Perfil</a></li>
                <li><a href="#!" class="black-text">Inicio</a></li>
                <li><a href="#!" class="black-text">Inicio</a></li>
                <li><a href="#!" class="black-text">Inicio</a></li>
                <li><a href="#!" class="fb-login-button black-text" data-button-type="login_with"  data-auto-logout-link="true" data-use-continue-as="true">Sair</a></li>
                
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
<div class="fixed-action-btn" style="bottom: 260px;">
    <a href="#buscar" class="btn-floating btn-large waves-effect waves-light rosa modal-trigger">
        <i class="large material-icons">edit</i>
    </a>
</div>

<main>
    
    <div class="container">
        <div id="profile-page" class="section">
            <!-- profile-page-header -->
            <div id="profile-page-header" class="card">
                <div class="card-image waves-effect waves-block waves-light" style="
                height: 15px;
                background-color: #f89800;
                background-image: linear-gradient(to bottom, transparent 1px, rgba(0,0,0,.1) 1px);
                background-size: auto 2px;">
                </div>
                <figure class="card-profile-image">
                    <img style="border: 1px solid #999;border-color: orange;width: 60px;height: 60px;border-radius: 50px;position: absolute;" class="circle" src="${facebook.foto}">
                </figure>

                <div class="card-content">

                    <div class="row pt-2">
                        <div class="col s12 m3 offset-m2">
                            <h4 class="card-title grey-text text-darken-4"><a href="${facebook.link}" target="_blank">${facebook.nome}</a></h4>
                            <p class="medium-small grey-text">${facebook.local}</p>
                        </div>
                        <div class="col s12 m3 center-align">
                            <h4 class="card-title grey-text text-darken-4">10</h4>
                            <p class="medium-small grey-text">Ajudas recebidas</p>
                        </div>
                        <div class="col s12 m3 center-align">
                            <h4 class="card-title grey-text text-darken-4">6</h4>
                            <p class="medium-small grey-text">Ajudas Oferecidas</p>
                        </div>
                        <div class="col s12 m1 right-align">
                            <div class="center-align">
                                <p>Mais Detalhes:</p>
                            <a class="btn-floating activator waves-effect waves-light rec accent-2 center">
                                <i class="material-icons">perm_identity</i>
                            </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-reveal">
                    <p>
                    <span class="card-title grey-text text-darken-4">${facebook.nome}
                      <i class="material-icons right">close</i>
                    </span>
                    </p>
                    <p>
                        <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                            <path fill="#ff9800" d="M12,2C6.5,2 2,6.14 2,11.25C2,14.13 3.42,16.7 5.65,18.4L5.71,22L9.16,20.12L9.13,20.11C10.04,20.36 11,20.5 12,20.5C17.5,20.5 22,16.36 22,11.25C22,6.14 17.5,2 12,2M13.03,14.41L10.54,11.78L5.5,14.41L10.88,8.78L13.46,11.25L18.31,8.78L13.03,14.41Z" />
                        </svg>
                         tem q ver como pegar</p>
                    <p>
                        <i class="material-icons text-orange text-darken-2">perm_phone_msg</i>nao tem como pegar do face</p>
                    <p>
                        <i class="material-icons text-orange text-darken-2">email</i>${facebook.email}</p>
                    <p>
                        <i class="material-icons text-orange text-darken-2">cake</i>${facebook.aniversario}</p>
                </div>
            </div>
            <!--/ profile-page-header -->
            <!-- profile-page-content -->
        </div>
    </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="card col m12 s12 white">
                <div class="container center" style="padding: 20px">
                    <h5 style="font-weight: bold"> Selecione o que voce quer visualizar:</h5>
                    <a class="waves-effect waves-light btn-large deep-orange black-text"><i class="material-icons left">list</i>Todos</a>
                    <a class="waves-effect waves-light btn-large black-text"><i
                            class="material-icons left">group_add</i>Meus Pedidos</a>
                    <a class="waves-effect waves-light btn-large yellow black-text"><i class="material-icons right">forum</i>Minhas
                        Ajudas</a>
                </div>
                <div class="container center">
                    <h4 style="padding: 20px">Meus Pedidos</h4>
                </div>
                
                    <c:forEach var="ajuda" items="${UsuarioLogado.ajudas}"> 
                        <c:choose>
                            <c:when test="${ajuda.tipo == 'pedidoDeAjuda'}">
                            <div class="container">
                                <div class="col s12 m12">
                                    <div class="card darken-1 white">
                                        <div class="card-content black-text">
                                            <div class="cabecalho-card">
                                                <div class="row">
                                                    <div class="col s12 m4">
                                                        <div class="row">
                                                            <div class="col s6 m5">
                                                                <img class="circle" height="60px" width="60px" src="${facebook.foto}">
                                                            </div>
                                                            <div class="col s6 m7">
                                                                <h6>${ajuda.usuario.nome}</h6>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="container card-description">
                                                <h5>${ajuda.titulo}</h5>
                                                <p>${ajuda.descricao} </p>
                                                <p style="margin: 20px; font-size: 14px">${ajuda.local.nome}</p>
                                            </div>
                                            <div class="card-action">
                                                <div class="center">
                                                    <c:forEach var="ajudaProcesso" items="${ajuda.emProcesso}">
                                                        <c:choose>
                                                            <c:when test="${ajudaProcesso.status == 'Iniciado'}">
                                                                    <form action="updateAjudaEmProcesso" method="post"> 
                                                                        ${ajudaProcesso.ajudante.nome} quer ajudar você nesta tarefa! ${ajudaProcesso.status}
                                                                        <input type="hidden" name="id" value="${ajudaProcesso.id}">
                                                                        <input type="hidden" name="idAjudado" value="${ajudaProcesso.idAjudado}">
                                                                        <input type="hidden" name="idAjudante" value="${ajudaProcesso.idAjudante}"/>
                                                                        <input type="hidden" name="idAjuda" value="${ajuda.id}"/>
                                                                        <input type="hidden" name="status" value="EmProcesso"/>
                                                                        <input type="hidden" name="idUsuario" value="${UsuarioLogado.id}"/>

                                                                        <button  type="submit" class="btn btn-large orange" style="width:80%">aceitar</button>
                                                                    </form>
                                                            </c:when>
                                                            <c:when test="${ajudaProcesso.status == 'EmProcesso'}">
                                                                <form action="updateAjudaEmProcesso" method="post"> 
                                                                    A ajuda foi realizada? ${ajudaProcesso.status}
                                                                    <input type="hidden" name="id" value="${ajudaProcesso.id}">
                                                                    <input type="hidden" name="idAjudado" value="${ajudaProcesso.idAjudado}">
                                                                    <input type="hidden" name="idAjudante" value="${ajudaProcesso.idAjudante}"/>
                                                                    <input type="hidden" name="idAjuda" value="${ajuda.id}"/>
                                                                    <input type="hidden" name="status" value="Finalizado"/>
                                                                    <input type="hidden" name="idUsuario" value="${UsuarioLogado.id}"/>

                                                                    <button  type="submit" class="btn btn-large orange" style="width:80%">Finalizar Tarefa</button>
                                                                </form>
                                                            </c:when>
                                                            <c:otherwise>
                                                                A ajuda foi finalizada!
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:when>
                            <c:otherwise>
                                <div class="container">
                                <div class="col s12 m12">
                                    <div class="card darken-1 white">
                                        <div class="card-content black-text">
                                            <div class="cabecalho-card">
                                                <div class="row">
                                                    <div class="col s12 m4">
                                                        <div class="row">
                                                            <div class="col s6 m5">
                                                                <img class="circle" height="60px" width="60px" src="${facebook.foto}">
                                                            </div>
                                                            <div class="col s6 m7">
                                                                <h6>${ajuda.usuario.nome}</h6>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="container card-description">
                                                <h5>${ajuda.titulo}</h5>
                                                <p>${ajuda.descricao} </p>
                                                <p style="margin: 20px; font-size: 14px">${ajuda.local.nome}</p>
                                            </div>
                                            <div class="card-action">
                                                <c:forEach var="ajudaProcesso" items="${ajuda.emProcesso}">
                                                        <div class="center">
                                                            ${ajudaProcesso.ajudante.nome} quer sua ajuda!
                                                            <a href="#" class="btn btn-large deep-orange" style="width: 80%">aceitar</a>
                                                        </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:otherwise>
                        </c:choose>
                </c:forEach>
                
            </div>
        </div>
    </div>
    
    <!-- Modal Pedir/oferecer ajuda -->
    <form action="#">
        <div id="modal1" class="modal modal-fixed-footer">
            <div class="modal-content center">
                    <p>
                        <label>
                            <input name="group1" type="radio" checked/>
                            <span>Oferecer Ajuda</span>
                        </label>
                    </p>
                    <p>
                        <label>
                            <input name="group1" type="radio"/>
                            <span>Pedir ajuda</span>
                        </label>
                    </p>
                    <div class="container">
                        <div class="row">
                            <div class="col s12">
                                <div class="row">
                                    <div class="input-field col s12">
                                        <textarea id="textarea1" class="materialize-textarea"></textarea>
                                        <label for="textarea1">Descricao</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col s6 m6">
                                        Dia:<input type="date" name="day">
                                    </div>
                                    <div class="col s6 m6">
                                        Hora:<input id="time" type="time">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col s12">
                                        Local: <a class="dropdown-trigger black-text" href="#"
                                                        style="font-family: moon;" data-target="dropdown4">Camobi<i
                                            class="material-icons black-text">expand_more</i></a>
                                        <ul id="dropdown4" class="dropdown-content" style="font-family: moon;">
                                            <li><a href="#" class="black-text">teste</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

            </div>
            <div class="modal-footer">
                <a href="#!" class="modal-close waves-effect waves-green btn-flat left grey">Fechar</a>
                <a href="#!" class="modal-close waves-effect waves-green btn-flat right orange" type="submit">Confirmar</a>
            </div>
        </div>
    </form>
    <!--end-MODAL-->  
    <!-- Modal Cadastrar novo local -->
    <div id="modal-novolocal" class="modal modal-fixed-footer">
        <form action="#">
                <div class="modal-content center">
              <h4>Cadastrar novo Local</h4>
              <p>A bunch of text</p>
            </div>
            <div class="modal-footer">
              <a href="#!" class="modal-close waves-effect waves-green btn-flat">Concluir</a>
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



</script>

</body>
</html>

