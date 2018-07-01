MENU PRONTO
    <%--
    Document   : perfil
    Created on : 01/07/2018, 18:09:06
    Author     : Joel
--%>
<%--<%@include file="inicio.jsp" %>--%>

<%@page import="csi.Modelos.Facebook"%>
<%@page import="csi.com.mycompany.help_me.CRUD.UsuarioCRUD"%>

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
    <%@include file="inicio.jsp" %>
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
<!--botao buscar-->
<div class="fixed-action-btn" style="bottom: 100px;">
    <a href="#modal-busca" class="tooltipped btn-floating btn-large waves-effect waves-light orange modal-trigger" data-position="left" data-tooltip="Buscar Ajuda">
        <i class="large material-icons">search</i>
    </a>
</div>
<!--botao adicionar local-->
<div class="fixed-action-btn" style="bottom: 180px;">
    <a href="#modal-novolocal" class="tooltipped modal-trigger btn-floating  btn-large waves-effect waves-light light-red modal-trigger" data-position="left" data-tooltip="Alterar Localização atual">
        <i class="large material-icons">add_location</i>
    </a>
</div>
<!--botao editar perfil-->
<div class="fixed-action-btn" style="bottom: 260px;">
    <a href="#editar_perfil" class="btn-floating btn-large waves-effect waves-light rosa modal-trigger">
        <i class="large material-icons">edit</i>
    </a>
</div>
    <div>   
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
                        <img style="    border: 1px solid #999;border-color: black;width: 100px;height: 100px;border-radius: 50px;position: absolute;" class="circle"src="img/1.jpg">

                    </figure>

                <div class="card-content" style="height: 180px;">

                    <div class="row pt-2">
                        <div class="col s12 m3 offset-m2">
                            <h4 class="card-title grey-text text-darken-4">${facebook.nome}</h4>
                            <p class="medium-small grey-text">Roraima,1000. Camobi-SM</p>
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
                    <span class="card-title grey-text text-darken-4">Joel Ferreira da Silva
                      <i class="material-icons right">close</i>
                    </span>
                    </p>
                    <p>
                        <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                            <path fill="#ff9800" d="M12,2C6.5,2 2,6.14 2,11.25C2,14.13 3.42,16.7 5.65,18.4L5.71,22L9.16,20.12L9.13,20.11C10.04,20.36 11,20.5 12,20.5C17.5,20.5 22,16.36 22,11.25C22,6.14 17.5,2 12,2M13.03,14.41L10.54,11.78L5.5,14.41L10.88,8.78L13.46,11.25L18.31,8.78L13.03,14.41Z" />
                        </svg>
                         fsilvajoel</p>
                    <p>
                        <i class="material-icons text-orange text-darken-2">perm_phone_msg</i> (54) 991291310</p>
                    <p>
                        <i class="material-icons text-orange text-darken-2">email</i> mail@inf.ufsm.br</p>
                    <p>
                        <i class="material-icons text-orange text-darken-2">cake</i> 02 de Junho de 1990</p>
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
                <div class="container">
                    <ul class="collapsible popout">
                        <li>
                            <div class="collapsible-header"><i class="material-icons">filter_drama</i>First</div>
                            <div class="collapsible-body"><span>Lorem ipsum dolor sit amet. Lorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit amet</span>
                            </div>
                        </li>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">place</i>Second</div>
                            <div class="collapsible-body"><span>Lorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit amet.</span>
                            </div>
                        </li>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">whatshot</i>Third</div>
                            <div class="collapsible-body"><span>Lorem ipsum dolor sit amet.</span></div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal editar user -->
    <div id="editar_perfil" class="modal modal-fixed-footer">
        <div class="modal-content center">
            <div class="row">
            <form class="col s12">
                <div class="row">
                    <div class="input-field col s12">
                        <input disabled value="${facebook.nome}" id="disabled" type="text" class="validate">
                        <label for="disabled">Nome</label>
                    </div>
                </div>
                <div class="row">
                  <div class="input-field col s6">
                    <input placeholder="Placeholder" id="first_name" type="text" class="validate">
                    <label for="first_name">First Name</label>
                  </div>
                  <div class="input-field col s6">
                    <input id="last_name" type="text" class="validate">
                    <label for="last_name">Last Name</label>
                  </div>
                </div>
                
                <div class="row">
                    <div class="input-field col s12">
                        <!--<input id="password" type="tel" class="validate">-->
                        <input type="text" name="telefone" data-mask="(00) 0000-0000" data-mask-selectonfocus="true" />

                        <!--<label for="password">Telefone</label>-->
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="email" type="email" class="validate">
                        <label for="email">Email</label>
                    </div>
                </div>              
            </form>
        </div>
        </div>
        <div class="modal-footer">
            <a href="#!" class="modal-close waves-effect waves-green btn-flat left grey">Fechar</a>
            <a href="#!" class="modal-close waves-effect waves-green btn-flat right orange" type="submit">Confirmar</a>
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
//    mascara para o telefone
    $(document).ready(function(){
    $('#telefone').mask('(00) 0000-0000');
});
</script>
</body>
</html>

