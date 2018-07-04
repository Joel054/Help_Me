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
        }(document, 'script', 'facebook-jssdk'));
    </script>
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
                document.getElementById('fukForm').action='login';
                statusChangeCallback(response);
            });
        }
        function checkLoginStateReg() {
            FB.getLoginStatus(function(response) {
                document.getElementById('fukForm').action='registrar';
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
        <div class="nav-wrapper yellow container" id="inicio">
            <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
            <ul class="left hide-on-med-and-down">
                    <li><a href="#sobre" style="font-family: moon;" class="black-text text-darken-15 pulse">sobre</a></li>
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
            <li><a href="#inicio" style="font-family: moon;" class="black-text text-darken-15">inicio</a></li>
            <li><a href="#sobre" style="font-family: moon;" class="black-text text-darken-15">sobre</a></li>
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
                    <div class="btn-fb" style="margin-top: 40px;">
                        <form action="login" method="POST" id="fukForm">
                            <input type="hidden" name="linkFacebook" id="linkFacebook"/>
                        </form>  
                                                
                    </div>

                     <!-- Modal Trigger -->
                    <a class="waves-effect waves-light btn modal-trigger deep-orange" href="#login">Entrar</a>
                    <a class="waves-effect waves-light btn modal-trigger orange" href="#cadastro">Cadastrar-se</a>
  
                    <!-- Modal Structure -->
                    <div id="login" class="modal">
                        <div class="modal-content">
                            <h4>Fazer Login</h4>
                            <p>Entre com o Facebook:</p>
                            <a class=" fb-login-button z-depth-3" data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="true" scope="public_profile,email,user_location,user_link,user_birthday" onlogin="checkLoginState();"></a>
                        </div>
                        <div class="modal-footer center">
                            <a class="modal-close waves-effect waves-green btn-flat text-orange">Fechar</a>
                        </div>
                    </div>
                    <div id="cadastro" class="modal">
                        <div class="modal-content">
                            <h4>Cadastrar-se</h4>
                            <p>Entre com o Facebook:</p>
                            <a class=" fb-login-button z-depth-3" data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="true" scope="public_profile,email,user_location,user_link,user_birthday" onlogin="checkLoginStateReg();"></a>
                        </div>
                        <div class="modal-footer center">
                            <a class="modal-close waves-effect waves-green btn-flat text-orange">Fechar</a>
                        </div>
                    </div>
                </div>
                      </div>
                  </div>
              </div>

    <div class="container">
        <div class="row"><img src="img/abelha.gif" alt="" style="height: 100%; width: 100%; margin-top: 40px;"></div>
    </div>
    
    <div class="carousel" id="sobre">
        <div class="row"><h4 class="center">Inspire-se!</h4></div>
        <a class="carousel-item" href="#one!"><img src="img/uno.jpg"></a>
        <a class="carousel-item" href="#two!"><img src="img/dos.jpg"></a>
        <a class="carousel-item" href="#three!"><img src="img/3.jpg"></a>
        <a class="carousel-item" href="#four!"><img src="img/4.jpg"></a>
        <a class="carousel-item" href="#five!"><img src="img/5.jpg"></a>
    </div>

    <footer class="page-footer  yellow z-depth-3">
      <div class="container">
        <div class="row">
          <div class="col l12 s12  flow-text">
            <h5 class="black-text "><b>Help mi</b>, doe um pouco de sí.</h5>
            <blockquote class="black-text text-lighten-4"><b>Conectar pessoas</b> que precisam realizar tarefas esporádicas com aquelas que desejam ajudar, através de uma rede social de ajuda na qual é possível cadastrar tarefas diárias e também solicitar pedido de auxílio em tarefas.</blockquote>
          </div>
        </div>   
      </div>
      <div class="footer-copyright #ffc107 amber ">
        <div class="container center">
            <h6 class="white-text" >by clecio, vitor, joel</h6>
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
        $(document).ready(function(){
            $('.modal').modal();
        });
        $('.btn-botao').on('click', function(){
            $('#cadastro').modal();
        });
        $('.btn-new').on('click', function(){
            $('#login').modal();
        });
        $(document).ready(function(){
            $('.carousel').carousel();
        });
        
    </script>
</body>
</html>