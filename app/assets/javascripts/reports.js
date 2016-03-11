// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on("ready page:load", function(){
  $('#nearby-search').on('click', function(){
    if("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(success, error);
    }
  })
  // Sort by votes
  $('#votes-search').on('click', function(){

    $.ajax({
      url: '/reports',
      method: 'get',
      data: {votes: true},
      dataType: 'script',
    })

  })
  // Sort by status
  $('#status-search').on('click', function(){

    $.ajax({
      url: '/reports',
      method: 'get',
      data: {status: true},
      dataType: 'script',
    })

  })


})


 // Sort by location

function success(position){
  var lat = position.coords.latitude;  //this info comes from the if statement above
  var lon = position.coords.longitude;
  // console.log(lat, lon); --> check

  $.ajax({
    url: '/reports',
    method: 'get',
    data: {latitude: lat, longitude: lon },
    dataType: 'script',
  })

}

function error(error) {
  console.log('something went wrong!' + err.message);
}
