<%-- 
    Document   : index
    Created on : 15/06/2018, 20:45:09
    Author     : vitor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
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
    
    <div id="fb-root"></div>
    <script>(function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = 'https://connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v3.0&appId=197552614211211&autoLogAppEvents=1';
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));</script>

</head>

	<!--<body style="background-image: url('img/background.jpg');background-size: cover" >-->
<body>
    <main>
    <script>
     // This is called with the results from from FB.getLoginStatus().
        function statusChangeCallback(response) {
           console.log('statusChangeCallback');
           console.log(response);
           console.log(response.authResponse.accessToken);
           //alert(response.authResponse.accessToken);
           if (response.status === 'connected') {
               //window.location.href='inicio.jsp?access_token='+response.authResponse.accessToken;
                document.getElementById('linkFacebook').value = ""+response.authResponse.accessToken;
                document.getElementById('fukForm').submit();
           } else {
           // The person is not logged into your app or we are unable to tell.
           document.getElementById('status').innerHTML = 'Please log ' +
           'into this app.';
           }
        }
     // This function is called when someone finishes with the Login
     // Button. See the onlogin handler attached to it in the sample
     // code below.
        function checkLoginState() {
            FB.getLoginStatus(function(response) {
                statusChangeCallback(response);
            });
        }
        window.fbAsyncInit = function() {
            FB.init({
                appId : '197552614211211',
                cookie : true, // enable cookies to allow the server to access 
                // the session
                xfbml : true, // parse social plugins on this page
                version : 'v2.8' // use graph api version 2.8
            });
            FB.getLoginStatus(function(response) {
                if(${logedAuto == null})
                    statusChangeCallback(response);
            });
        };
     // Load the SDK asynchronously
        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "https://connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
     // Here we run a very simple test of the Graph API after login is
     // successful. See statusChangeCallback() for when this call is made.
    </script>
    <!--  menu responsivo -->
    <nav class="yellow">
        <div class="nav-wrapper yellow container">
            <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
            <ul class="left hide-on-med-and-down">
                    <li><a href="#" style="font-family: moon;" class="black-text text-darken-15">sobre</a></li>
            </ul>
            <a href="#" class="brand-logo right"><img src="img/logo-nova.png" style="height: 54px; width: 68px;"></a>

            <ul class="sidenav" id="mobile-demo">
            <li>
                <div class="user-view">
                <div class="background orange">

                </div>
                    <a href="#user"><img class="circle" src="img/logo-nova.png"></a>
                    <a href="#name"><span class="white-text name">Olá</span></a>
                    <a href="#email"><span class="white-text email">Oriente-se</span></a>
                </div>
            </li>
            <li><a href="#" style="font-family: moon;" class="black-text text-darken-15">inicio</a></li>
            <li><a href="#" style="font-family: moon;" class="black-text text-darken-15">sobre</a></li>
            </ul>
        </div>
    </nav>

    <!--logo, icone -->
    <div class="container">
        <div class="row">
            <div class="col s12 m6 l6">
                <div class="col s12 m12 l12 l-help">
                    <span class="logo-relp" style="font-family: moon;">HELP </span><br>
                </div>
                <div class="row">
                    <div class="col s4 m4 l4 logo-mi">
                        <span style="font-family: moon;">Mi,</span>
                    </div>
                    <div class="col s8 m8 l8 logo-small-text sub-logo">
                        <span style="font-family: moon;">DOE<br> UM POUCO <br> DE SI.</span>
                    </div>
                </div>
            </div>

            <div class="col s12 m6 l6 wrapper">
                <div>

                    <img src="img/logo-nova-texto.png" style="height: 126px; width: 262px; margin-top: 10px;"><br>
                    <!--<div style="margin-top: 15px;">-->
                        <!--<span style="font: 20px moon bold; " class="flow-text">Ajude alguem!<br>De um HELP!</span>-->

                    <!--</div>-->

                    <div class="btn-fb" style="margin-top: 40px;">
                        <form action="login" method="post" id="fukForm">
                            <input type="hidden" name="linkFacebook" id="linkFacebook"/>
                        </form>  
                        <a class=" fb-login-button waves-effect waves-light btn-large z-depth-3" data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="true" scope="public_profile,email,user_location,user_link" onlogin="checkLoginState();"></a>
                       
                    </div>
                    
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row"><img src="img/abelha-voando.png" alt="" style="height: 100%; width: 100%; margin-top: 40px;""></div>
    </div>

    <footer class="page-footer orange z-depth-3">
      <div class="container">
        <div class="row">
          <div class="col l12 s12 center">
            <h5 class="black-text">Help mi, doe um pouco de sí.</h5>
            <p class="black-text text-lighten-4"><b>Conectar pessoas</b> que precisam realizar tarefas esporádicas com aquelas que desejam ajudar, através de uma rede social de ajuda na qual é possível cadastrar tarefas diárias e também solicitar pedido de auxílio em tarefas.</p>
          </div>
        </div>
      </div>
      <div class="footer-copyright">
        <div class="container center">
        by clecio, vitor, joel
        </div>
      </div>
    </footer>
    </main>
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <!-- Compiled and minified JavaScript -->
    <script src="js/materialize.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.sidenav').sidenav();
        });
    </script>
</body>
</html>