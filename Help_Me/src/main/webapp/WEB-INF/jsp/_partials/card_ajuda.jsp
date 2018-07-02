<%@page import="csi.Modelos.Facebook"%>
<%@page import="csi.com.mycompany.help_me.CRUD.UsuarioCRUD"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:forEach var="ajuda" items="${ajudasFeed}"> 
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
                                                    <h6>${ajuda.usuario.nome}</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col s12 m4 center m-t-20">
                                            <h5>${ajuda.tipo}</h5>
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
                                                    </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                                
                                                <% if(aux == true){ %>
                                                    <form action="newAjudaEmProcesso" method="post"> 
                                                        <input type="hidden" name="idAjudado" value="${ajuda.usuario.id}">
                                                        <input type="hidden" name="idAjudante" value="${UsuarioLogado.id}"/>
                                                        <input type="hidden" name="idAjuda" value="${ajuda.id}"/>
                                                        <input type="hidden" name="status" value="Iniciado"/>
                                                        <input type="hidden" name="idUsuario" value="${UsuarioLogado.id}"/>  

                                                        <button type="submit" class="btn btn-large orange" style="width: 80%">Ajudar</button>
                                                    </form>
                                                <% }else{ %>  
                                                    Seu pedido foi enviado
                                                <% } %> 
                                            </c:when> 
                                            <c:otherwise>
                                                <c:forEach var="ajudaProcesso" items="${ajuda.emProcesso}">
                                                        <c:choose>
                                                            <c:when test="${ajudaProcesso.status == 'Iniciado'}">
                                                                    <form action="updateAjudaEmProcesso" method="post"> 
                                                                        <h6> ${ajudaProcesso.ajudante.nome} quer ajudar você nesta tarefa!</h6>
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
                                                                    <h6>A ajuda com ${ajudaProcesso.ajudante.nome} foi realizada? ${ajudaProcesso.status}</h6>
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
                                                            <c:when test="${ajudaProcesso.status == 'Finalizado'}">
                                                                 <p>${ajudaProcesso.ajudante.nome} ajudou nesta tarefa!</p>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <p>ninguem ajudou nesta tarefa!</p>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>           
                                            </c:otherwise>
                                     </c:choose>   
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