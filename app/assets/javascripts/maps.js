$(document).on('ready page:load', function() {
 var mapPlaceholder = $('#map');
 var latLong = {lat: mapPlaceholder.data('latitude'), lng: mapPlaceholder.data('longitude')}
 var customIcon = "http://maps.google.com/mapfiles/ms/icons/yellow-dot.png"

 var map = new google.maps.Map(mapPlaceholder[0], {
   center: latLong,
   zoom: 17
 });

 var marker = new google.maps.Marker({
   position: latLong,
   map: map,
   title: 'Current_pothole'
 });

 if (window.nearbys) {
   nearbys.forEach(function(coord) {
     new google.maps.Marker({
       position: { lat: parseFloat(coord.lat), lng: parseFloat(coord.lng) },
       map: map,
       title: "Nearby_potholes",
       icon: customIcon
     });
   });
 }
});
