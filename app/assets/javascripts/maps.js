$(document).on('ready page:load', function() {
  var mapPlaceholder = $('#show_map');
  var latLong = {lat: mapPlaceholder.data('latitude'), lng: mapPlaceholder.data('longitude')}
var initialLocation;
var customIcon = "http://maps.google.com/mapfiles/ms/icons/yellow-dot.png"
// Yellow map marker
var browserSupportFlag =  new Boolean();
  var myOptions = {
    zoom: 17,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("map"), myOptions);

  // Try W3C Geolocation (Preferred)
  if(navigator.geolocation) {
    browserSupportFlag = true;
    navigator.geolocation.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      map.setCenter(initialLocation);},
       function() {
      handleNoGeolocation(browserSupportFlag);
    });
  }
  // Browser doesn't support Geolocation
  else {
    browserSupportFlag = false;
    handleNoGeolocation(browserSupportFlag);
  }
  // Error msg if geoloction isn't supported
  function handleNoGeolocation(errorFlag) {
    if (errorFlag == true) {
      alert("Geolocation service failed.");
      initialLocation = newyork;
    } else {
      alert("Your browser doesn't support geolocation. We've placed you in Siberia.");
      initialLocation = siberia;
    }
    map.setCenter(initialLocation);
  }
    // Pothole Marker
  var marker = new google.maps.Marker({
   position: initialLocation,
   map: map,
   title: 'Current_pothole'
  });
    // Nearby markers
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


//OLD MAP CODE
// $(document).on('ready page:load', function() {
  // var mapPlaceholder = $('#map');
  // var latLong = {lat: mapPlaceholder.data('latitude'), lng: mapPlaceholder.data('longitude')}
//   var customIcon = "http://maps.google.com/mapfiles/ms/icons/yellow-dot.png"
//
//   var map = new google.maps.Map(mapPlaceholder[0], {
//    center: latLong,
//    zoom: 17
//   });
//
//   var marker = new google.maps.Marker({
//    position: latLong,
//    map: map,
//    title: 'Current_pothole'
//   });
//
//   var contentString = 25;
//
//   var infowindow = new google.maps.InfoWindow({
//     content: contentString
//   });
//
//   if (window.nearbys) {
//     nearbys.forEach(function(coord) {
//       new google.maps.Marker({
//         position: { lat: parseFloat(coord.lat), lng: parseFloat(coord.lng) },
//         map: map,
//         title: "Nearby_potholes",
//         icon: customIcon
//       });
//     });
//   }
//
// });

    
