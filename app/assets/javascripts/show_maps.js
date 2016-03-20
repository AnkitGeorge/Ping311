$('#show_map').on('load', function initialize() {
  var mapPlaceholder = $('#show_map');
  var latLong = {lat: mapPlaceholder.data('latitude'), lng: mapPlaceholder.data('longitude')};
var initialLocation;
var customIcon = "http://maps.google.com/mapfiles/ms/icons/yellow-dot.png"
// Yellow map marker

var browserSupportFlag =  new Boolean();
  var myOptions = {
    zoom: 17,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    center: latLong //NEW LINE
  };
  var map = new google.maps.Map(document.getElementById("show_map"), myOptions);

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



// NEW CODE FROM THE WEEKEND

// $(document).on('ready page:load', function() {
//
//   var userCords;
//   var pos;
//   var infoWindow = null;
//   var mapPlaceholder = $('#show_map');
//   var latLong = {lat: mapPlaceholder.data('latitude'), lng: mapPlaceholder.data('longitude')};
//
// //Start geolocation
//
//   if (navigator.geolocation) {
//     function error(err) {
//       console.warn('ERROR(' + err.code + '): ' + err.message);
//     }
//
//     function success(pos){
//       userCords = pos.coords;
//           // return userCords;
//     }
//
//       // Get the user's current position
//     navigator.geolocation.getCurrentPosition(success, error);
//       // console.log(pos.latitude + " " + pos.longitude);
//     }
//
//   else {
//     alert('Geolocation is not supported in your browser');
//   }
// //End Geo location
//
//   //map options
//   var mapOptions = {
//     zoom: 14,
//     center: new google.maps.LatLng(43.6472849, -79.3870757),
//     panControl: false,
//     panControlOptions: {
//       position: google.maps.ControlPosition.BOTTOM_LEFT
//     },
//     zoomControl: true,
//     zoomControlOptions: {
//       style: google.maps.ZoomControlStyle.LARGE,
//       position: google.maps.ControlPosition.RIGHT_CENTER
//     },
//     scaleControl: false
//
//   };
//
//   //Adding infowindow option
//   infowindow = new google.maps.InfoWindow({
//     content: "Your current position"
//   });
//
//   //Fire up Google maps and place inside the map div
//   map = new google.maps.Map(document.getElementById('show_map'), mapOptions);
//
//   // $('#current_location').on("click", function() {
//   //
//   //
//   //   var current_coordinates = { lat: userCords.latitude, lng: userCords.longitude};
//   //
//   //   map.setCenter(current_coordinates);
//   //
//   //   var marker;
//   //
//   //   function createMarker(coords, map) {
//   //     marker = new google.maps.Marker({
//   //       position: coords,
//   //       map: show_map
//   //     });
//   //   }
//   //
//   //   createMarker(current_coordinates, map);
//   });
