$(document).on('ready page:load', function(){
});


function initMap() {
  var mapPlaceholder = $('#map');

  var map = new google.maps.Map(mapPlaceholder[0], {
    center: {lat: mapPlaceholder.data('latitude'), lng: mapPlaceholder.data('longitude')},
    zoom: 15

  }); //details for loading the map on the page
}
