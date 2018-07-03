<%@page import="csi.Modelos.Facebook"%>
<%@page import="csi.com.mycompany.help_me.CRUD.UsuarioCRUD"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:forEach var="ajuda" items="${ajudasFeed}"> 
        <c:choose>
            <c:when test="${ajuda.tipo == 'pedidoDeAjuda'}">
                <!--card de ajuda-->
                <div class="container">
                    <div class="col s12 m12">
                        <div class="card darken-1 white">
                            <div class="card-image " style="
                                height: 10px;
                                background-color: orange;
                                background-image: linear-gradient(to bottom, transparent 1px, rgba(0,0,0,.1) 1px);
                                background-size: auto 1px;">
                            </div>
                            <div class="card-content black-text">
                                <div class="cabecalho-card">
                                    <div class="row">
                                        <div class="col s12 m4">
                                            <div class="row">
                                                <div class="col s6 m3">
                                                    <img src="${facebook.foto}" class="circle" height="60px" width="60px" src="img/1.jpg">
                                                </div>
                                                <div class="col s6 m9 m-t-20">
                                                    <h6>${ajuda.usuario.nome}</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col s12 m4 center m-t-20">
                                            <h6><b>Pedido de Ajuda</b></h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="container card-description">
                                    <p>${ajuda.titulo}</p>
                                    <p>${ajuda.descricao}</p>
                                    <p style="margin: 20px; font-size: 14px">${ajuda.local.nome}</p>
                                </div>
                                <div class="card-action">
                                    <div class="center">
                                        <c:choose>
                                            <c:when test="${ajuda.usuario.id != UsuarioLogado.id }"> 
                                                <% boolean aux = true; %>
                                                <c:forEach var="ajudaProcesso" items="${ajuda.emProcesso}">
                                                    <c:choose>
                                                        <c:when test="${ajudaProcesso.idAjudante == UsuarioLogado.id }">
                                                            <% aux = false; %>
                                                            <c:choose>
                                                                <c:when test="${ajudaProcesso.status == 'Iniciado' }">
                                                                    <h6 class="orange-text">Seu pedido foi enviado para ${ajudaProcesso.ajudado.nome}: ${ajudaProcesso.status}</h6>
                                                                </c:when>
                                                                <c:when test="${ajudaProcesso.status == 'EmProcesso' }">
                                                                    <h6 class="blue-text">${ajudaProcesso.ajudado.nome} aceitou sua solicitacao de Ajuda. ${ajudaProcesso.status}</h6>
                                                                </c:when>
                                                                <c:when test="${ajudaProcesso.status == 'Finalizado' }">
                                                                    <h6 class="green-text">${ajudaProcesso.ajudante.nome} ajudou ${ajudaProcesso.ajudado.nome} nesta tarefa!</h6>
                                                                </c:when>
                                                            </c:choose>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                                <% if(aux == true){ %>
                                                    <h6 class="orange-text" >Ajude ${ajuda.usuario.nome} neste pedido!</h6>
                                                    <form action="newAjudaEmProcesso" method="post"> 
                                                        <input type="hidden" name="idAjudado" value="${ajuda.usuario.id}">
                                                        <input type="hidden" name="idAjudante" value="${UsuarioLogado.id}"/>
                                                        <input type="hidden" name="idAjuda" value="${ajuda.id}"/>
                                                        <input type="hidden" name="status" value="Iniciado"/>
                                                        <input type="hidden" name="idUsuario" value="${UsuarioLogado.id}"/>  

                                                        <button type="submit" class="btn btn-large orange" style="width: 80%">Ajudar</button>
                                                    </form>
                                                <% } %>      
                                            </c:when> 
                                            <c:otherwise>
                                                <% boolean oq = true; %>   
                                                <c:forEach var="ajudaProcesso" items="${ajuda.emProcesso}">
                                                    <c:choose>
                                                        <c:when test="${ajudaProcesso.idAjudante != UsuarioLogado.id }">
                                                            <% oq = false; %>
                                                            <c:choose>
                                                                <c:when test="${ajudaProcesso.status == 'Iniciado'}">
                                                                        <form action="updateAjudaEmProcesso" method="post"> 
                                                                            <h6 class="PINK-text"> ${ajudaProcesso.ajudante.nome} quer ajudar você nesta tarefa!</h6>
                                                                            <input type="hidden" name="id" value="${ajudaProcesso.id}">
                                                                            <input type="hidden" name="idAjudado" value="${ajudaProcesso.idAjudado}">
                                                                            <input type="hidden" name="idAjudante" value="${ajudaProcesso.idAjudante}"/>
                                                                            <input type="hidden" name="idAjuda" value="${ajuda.id}"/>
                                                                            <input type="hidden" name="status" value="EmProcesso"/>
                                                                            <input type="hidden" name="idUsuario" value="${UsuarioLogado.id}"/>
                                                                            <input type="hidden" name="pagina" value="login"/>
                                                                            <button  type="submit" class="btn btn-large orange" style="width:80%">aceitar</button>
                                                                        </form>
                                                                </c:when>
                                                                <c:when test="${ajudaProcesso.status == 'EmProcesso'}">
                                                                        <form action="updateAjudaEmProcesso" method="post"> 
                                                                        <h6 class="blue-text" >A ajuda com ${ajudaProcesso.ajudante.nome} foi realizada? ${ajudaProcesso.status}</h6>
                                                                        <input type="hidden" name="id" value="${ajudaProcesso.id}">
                                                                        <input type="hidden" name="idAjudado" value="${ajudaProcesso.idAjudado}">
                                                                        <input type="hidden" name="idAjudante" value="${ajudaProcesso.idAjudante}"/>
                                                                        <input type="hidden" name="idAjuda" value="${ajuda.id}"/>
                                                                        <input type="hidden" name="status" value="Finalizado"/>
                                                                        <input type="hidden" name="idUsuario" value="${UsuarioLogado.id}"/>
                                                                        <input type="hidden" name="pagina" value="login"/>
                                                                        <button  type="submit" class="btn btn-large orange" style="width:80%">Finalizar Tarefa</button>
                                                                    </form>
                                                                </c:when>
                                                                <c:when test="${ajudaProcesso.status == 'Finalizado' && UsuarioLogado.id == ajudaProcesso.idAjudado}">
                                                                     <h6 class="green-text">${ajudaProcesso.ajudante.nome} ajudou ${ajudaProcesso.ajudado.nome} nesta tarefa!</h6>
                                                                </c:when>
                                                            </c:choose>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach> 
                                                <% if(oq == true){ %>
                                                    <p class="black-text">Esta ajuda ainda nao tem pedidos!</p>
                                                <% } %>  
                                            </c:otherwise>
                                        </c:choose>   
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:when test="${ajuda.tipo == 'OferecendoAjuda'}">
                <!--card de ajuda-->
                <div class="container">
                    <div class="col s12 m12">
                        <div class="card darken-1 white">
                            <div class="card-image " style="
                                height: 10px;
                                background-color: #FF5722;
                                background-image: linear-gradient(to bottom, transparent 1px, rgba(0,0,0,.1) 1px);
                                background-size: auto 1px;">
                            </div>
                            <div class="card-content black-text">
                                <div class="cabecalho-card">
                                    <div class="row">
                                        <div class="col s12 m4">
                                            <div class="row">
                                                <div class="col s6 m3">
                                                    <img src="${facebook.foto}" class="circle" height="60px" width="60px" src="img/1.jpg">
                                                </div>
                                                <div class="col s6 m9 m-t-20">
                                                    <h6>${ajuda.usuario.nome} </h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col s12 m4 center m-t-20">
                                            <h6><b>Oferecendo Ajuda</b></h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="container card-description">
                                    <p>${ajuda.titulo}</p>
                                    <p>${ajuda.descricao}</p>
                                    <p style="margin: 20px; font-size: 14px">${ajuda.local.nome}</p>
                                </div>
                                <div class="card-action">
                                    <div class="center">
                                        <c:choose>
                                            <c:when test="${ajuda.usuario.id != UsuarioLogado.id }"> 
                                                <% boolean aux1 = true; %>
                                                <c:forEach var="ajudaProcesso" items="${ajuda.emProcesso}">
                                                    <c:choose>
                                                        <c:when test="${ajudaProcesso.idAjudante == UsuarioLogado.id }">
                                                            <% aux1 = false; %>
                                                            <c:choose>
                                                                <c:when test="${ajudaProcesso.status == 'Iniciado' }">
                                                                    <h6 class="orange-text">Seu pedido de ajuda foi enviado para ${ajudaProcesso.ajudante.nome}: ${ajudaProcesso.status}</h6>
                                                                </c:when>
                                                                <c:when test="${ajudaProcesso.status == 'EmProcesso' }">
                                                                    <h6 class="blue-text">${ajudaProcesso.ajudante.nome} aceitou sua solicitacao de ajuda.</h6> 
                                                                </c:when>
                                                                <c:when test="${ajudaProcesso.status == 'Finalizado' }">
                                                                    <h6 class="green-text">${ajudaProcesso.ajudado.nome} ajudou ${ajudaProcesso.ajudante.nome}!</h6>
                                                                </c:when>
                                                            </c:choose>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                                <% if(aux1 == true){ %>
                                                    <h6 class="deep-orange-text" >Solicitar Ajuda de ${ajuda.usuario.nome} neste pedido!</h6>
                                                    <form action="newAjudaEmProcesso" method="post"> 
                                                        <input type="hidden" name="idAjudado" value="${ajuda.usuario.id}">
                                                        <input type="hidden" name="idAjudante" value="${UsuarioLogado.id}"/>
                                                        <input type="hidden" name="idAjuda" value="${ajuda.id}"/>
                                                        <input type="hidden" name="status" value="Iniciado"/>
                                                        <input type="hidden" name="idUsuario" value="${UsuarioLogado.id}"/>  

                                                        <button type="submit" class="btn btn-large deep-orange" style="width: 80%">Pedir Ajuda</button>
                                                    </form>
                                                <% } %>      
                                            </c:when> 
                                            <c:otherwise>
                                                <% boolean oq1 = true; %>   
                                                <c:forEach var="ajudaProcesso" items="${ajuda.emProcesso}">
                                                    <c:choose>
                                                        <c:when test="${ajudaProcesso.idAjudante != UsuarioLogado.id }">
                                                            <% oq1 = false; %>
                                                            <c:choose>
                                                                <c:when test="${ajudaProcesso.status == 'Iniciado'}">
                                                                        <form action="updateAjudaEmProcesso" method="post"> 
                                                                            <h6 class="PINK-text"> ${ajudaProcesso.ajudado.nome} quer sua ajuda nesta tarefa!</h6>
                                                                            <input type="hidden" name="id" value="${ajudaProcesso.id}">
                                                                            <input type="hidden" name="idAjudado" value="${ajudaProcesso.idAjudado}">
                                                                            <input type="hidden" name="idAjudante" value="${ajudaProcesso.idAjudante}"/>
                                                                            <input type="hidden" name="idAjuda" value="${ajuda.id}"/>
                                                                            <input type="hidden" name="status" value="EmProcesso"/>
                                                                            <input type="hidden" name="idUsuario" value="${UsuarioLogado.id}"/>
                                                                            <input type="hidden" name="pagina" value="login"/>
                                                                            <button  type="submit" class="btn btn-large deep-orange" style="width:80%">Aceitar</button>
                                                                        </form>
                                                                </c:when>
                                                                <c:when test="${ajudaProcesso.status == 'EmProcesso'}">
                                                                        <form action="updateAjudaEmProcesso" method="post"> 
                                                                        <h6 class="blue-text" >A ajuda com ${ajudaProcesso.ajudado.nome} foi realizada? ${ajudaProcesso.status}</h6>
                                                                        <input type="hidden" name="id" value="${ajudaProcesso.id}">
                                                                        <input type="hidden" name="idAjudado" value="${ajudaProcesso.idAjudado}">
                                                                        <input type="hidden" name="idAjudante" value="${ajudaProcesso.idAjudante}"/>
                                                                        <input type="hidden" name="idAjuda" value="${ajuda.id}"/>
                                                                        <input type="hidden" name="status" value="Finalizado"/>
                                                                        <input type="hidden" name="idUsuario" value="${UsuarioLogado.id}"/>
                                                                        <input type="hidden" name="pagina" value="login"/>
                                                                        <button  type="submit" class="btn btn-large deep-orange" style="width:80%">Finalizar Tarefa</button>
                                                                    </form>
                                                                </c:when>
                                                                <c:when test="${ajudaProcesso.status == 'Finalizado' && UsuarioLogado.id == ajudaProcesso.idAjudante}">
                                                                     <h6 class="green-text">${ajudaProcesso.ajudado.nome} ajudou ${ajudaProcesso.ajudante.nome} nesta tarefa!</h6>
                                                                </c:when>
                                                            </c:choose>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach> 
                                                <% if(oq1 == true){ %>
                                                    <p class="black-text">Esta ajuda ainda nao tem pedidos!</p>
                                                <% } %>  
                                            </c:otherwise>
                                        </c:choose>   
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
        </c:choose>
    </c:forEach>