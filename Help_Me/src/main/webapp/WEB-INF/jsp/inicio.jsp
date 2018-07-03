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
    }(document, 'script', 'facebook-jssdk'));
    </script>
    <script type="text/javascript">
        window.onload = function(){
        getLocation();
    };
    </script>
<body>
<jsp:include page="_partials/menu.jsp" flush="true" />   
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
    <!--Card ajuda-->
    <jsp:include page="_partials/card_ajuda.jsp" flush="true" />>
    <!--card detalhes da ajuda-->
    <jsp:include page="_partials/card_detalhes.jsp" flush="true" />
    <!--Card solicitação pedido-->
    <jsp:include page="_partials/card_solicitacao-ajuda.jsp" flush="true" />
    <!--End Card solicitação pedido-->
    <!-- armazenar info para chamar perfil no menu -->
    <form action="login" method="post" id="login" name="login">
        <input type="hidden" name="linkFacebook" value="${UsuarioLogado.linkFacebook}"/>
    </form>
    <form action="perfil" method="post" id="perfil" name="perfil">
        <input type="hidden" name="linkFacebook" value="${UsuarioLogado.linkFacebook}"/>
    </form>
</main>
<jsp:include page="_partials/scripts.jsp" flush="true" />
</body>
</html>