$(document).on('page:change', function() {
  $('.is-data-table').DataTable();

  $('.datetimepicker').datetimepicker({
    // put here your custom picker options, that should be applied for all pickers
  });

  $('.datetimerange').each(function(){
    var $this = $(this)
    var range1 = $($this.find('.input-group')[0])
    var range2 = $($this.find('.input-group')[1])

    if(range1.data("DateTimePicker").date() != null)
      range2.data("DateTimePicker").minDate(range1.data("DateTimePicker").date());

    if(range2.data("DateTimePicker").date() != null)
      range1.data("DateTimePicker").maxDate(range2.data("DateTimePicker").date());

    range1.on("dp.change",function (e) {
      if(e.date)
        range2.data("DateTimePicker").minDate(e.date);
      else
        range2.data("DateTimePicker").minDate(false);
    });

    range2.on("dp.change",function (e) {
      if(e.date)
        range1.data("DateTimePicker").maxDate(e.date);
      else
        range1.data("DateTimePicker").maxDate(false);
    });
  });


  $("#slideshow1").owlCarousel({
    autoPlay : 3000,
    navigation : false, // Show next and prev buttons
    slideSpeed : 300,
    paginationSpeed : 400,
    singleItem:true,
    stopOnHover : true,

    autoHeight : true
  });

  if($('#map').length ){
    initMap();
  }
});



function initMap() {
  var myLatLng = {lat: 11.5764052, lng: 104.9204733};

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 18,
    center: myLatLng
  });

  var marker = new google.maps.Marker({
    position: myLatLng,
    map: map,
    title: 'Ministry of economy and finance'
  });
}