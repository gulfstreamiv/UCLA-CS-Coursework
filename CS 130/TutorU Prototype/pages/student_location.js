var coord;

// Obtain the student's Google Maps location
function locateStudent(replace) {
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode(
		{'address':$('#idLocation').val()},
		function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				coord = {
					lat: results[0].geometry.location.lat(),
					lng: results[0].geometry.location.lng()
				};
				
				// FRONTEND: map iframe is generated here
				if(replace) {
					var url = 'student_subject.html?slat=' + coord.lat + '&slng=' + coord.lng;
					location.replace(url);
				}
				else
					document.getElementById('divMap').innerHTML =
						'<iframe src="map.html?slat=' + coord.lat + '&slng=' + coord.lng
						+'" frameBorder="0" width="300px" height="200px"></iframe>';
			}
			else
				// FRONTEND: ugly alert window at the moment
				alert(status)
		}
	);
}

function confirm() {
	locateStudent(true);
}