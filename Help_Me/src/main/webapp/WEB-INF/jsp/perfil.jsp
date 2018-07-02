<%-- 
    Document   : Cadastro
    Created on : 15/06/2018, 21:33:11
    Author     : vitor
--%>
    <%--<%@include file="inicio.jsp" %>--%>
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
    <script>(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = 'https://connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v3.0&appId=197552614211211&autoLogAppEvents=1';
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));
    </script>
     <script type="text/javascript">
        window.onload = function(){
        getLocation();
    };
    </script>

<body>
    <jsp:include page="_partials/menu.jsp" flush="true" />
    <!--botao editar perfil-->
<div class="fixed-action-btn" style="bottom: 260px;">
    <a href="#editar_perfil" class="btn-floating btn-large waves-effect waves-light rosa modal-trigger">
        <i class="large material-icons">edit</i>
    </a>
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
    <div class="container">
        <div class="row">
            <div class="card col m12 s12 white">
                <div class="container center" style="padding: 20px">
                    <h5 style="font-weight: bold"> Selecione o que voce quer visualizar:</h5>
                    <a class="waves-effect waves-light btn-large deep-orange black-text"><i class="material-icons left">list</i>Todos</a>
                    <button class="waves-effect waves-light btn-large black-text">
                        <i class="material-icons left">group_add</i>Meus Pedidos</button>
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
                                                    <div class="col s12 m4 m-t-20 center">
                                                        <c:choose>
                                                            <c:when test="${UsuarioLogado.id == ajuda.idUsuario}">
                                                                <form action="deleteAjuda" method="post">
                                                                   <input type="hidden" name="idAjuda" value="${ajuda.id}">
                                                                   <input type="hidden" name="idUsuario" value="${UsuarioLogado.id}"/>
                                                                   <button  type="submit" class="btn btn-danger glyphicon glyphicon-remove red" style="width:80%">Excluir Ajuda</button>
                                                                </form>
                                                            </c:when>
                                                        </c:choose>
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
                                                            <c:when test="${ajudaProcesso.status == 'Iniciado' && UsuarioLogado.id == ajuda.idUsuario}">
                                                                    <form action="updateAjudaEmProcesso" method="post"> 
                                                                        <h6> ${ajudaProcesso.ajudante.nome} quer ajudar você nesta tarefa!</h6>
                                                                        <input type="hidden" name="id" value="${ajudaProcesso.id}">
                                                                        <input type="hidden" name="idAjudado" value="${ajudaProcesso.idAjudado}">
                                                                        <input type="hidden" name="idAjudante" value="${ajudaProcesso.idAjudante}"/>
                                                                        <input type="hidden" name="idAjuda" value="${ajuda.id}"/>
                                                                        <input type="hidden" name="status" value="EmProcesso"/>
                                                                        <input type="hidden" name="idUsuario" value="${UsuarioLogado.id}"/>
                                                                        <input type="hidden" name="pagina" value="perfil"/>
                                                                        <button  type="submit" class="btn btn-large orange" style="width:80%">aceitar</button>
                                                                    </form>
                                                            </c:when>
                                                            <c:when test="${ajudaProcesso.status == 'EmProcesso' && UsuarioLogado.id == ajuda.idUsuario}">
                                                                <form action="updateAjudaEmProcesso" method="post"> 
                                                                    <h6>A ajuda com ${ajudaProcesso.ajudante.nome} foi realizada? ${ajudaProcesso.status}</h6>
                                                                    <input type="hidden" name="id" value="${ajudaProcesso.id}">
                                                                    <input type="hidden" name="idAjudado" value="${ajudaProcesso.idAjudado}">
                                                                    <input type="hidden" name="idAjudante" value="${ajudaProcesso.idAjudante}"/>
                                                                    <input type="hidden" name="idAjuda" value="${ajuda.id}"/>
                                                                    <input type="hidden" name="status" value="Finalizado"/>
                                                                    <input type="hidden" name="idUsuario" value="${UsuarioLogado.id}"/>
                                                                    <input type="hidden" name="pagina" value="perfil"/>
                                                                    <button  type="submit" class="btn btn-large orange" style="width:80%">Finalizar Tarefa</button>
                                                                </form>
                                                            </c:when>
                                                            <c:when test="${ajudaProcesso.status == 'Finalizado'}">
                                                                 <p>${ajudaProcesso.ajudante.nome} ajudou nesta tarefa!</p>
                                                            </c:when>
                                                            <c:when test="${ajudaProcesso.status == 'Iniciado' && ajuda.idUsuario == ajudaProcesso.idAjudado}">
                                                                 <h6>Esperando resposta de ${ajudaProcesso.ajudado.nome}: ${ajudaProcesso.status}</h6>
                                                            </c:when>
                                                            <c:when test="${ajudaProcesso.status == 'EmProcesso' && ajuda.idUsuario == ajudaProcesso.idAjudado}">
                                                                 <h6>${ajudaProcesso.ajudado.nome} aceitou sua solicitacao de Ajuda: ${ajudaProcesso.status}</h6>
                                                            </c:when>
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

                            </c:otherwise>
                        </c:choose>
                </c:forEach>

            </div>
        </div>
    </div>
</div>
<!--END index-->
<jsp:include page="_partials/scripts.jsp" flush="true" />
</body>
</html>

