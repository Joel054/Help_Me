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
  
    $(document).ready(function(){
      $('.tabs').tabs();
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