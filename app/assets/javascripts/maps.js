function initMap() {
  var mapPlaceholder = $('#map');

  var latLong = {lat: mapPlaceholder.data('latitude'), lng: mapPlaceholder.data('longitude')};

  var map = new google.maps.Map(mapPlaceholder[0], {
    center: latLong,
    zoom: 15

  }); //details for loading the map on the page

  var marker = new google.maps.Marker({
    position: latLong,
    map: map,
    title: 'Pothole!',
  });
}
