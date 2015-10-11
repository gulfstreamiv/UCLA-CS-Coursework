var coord;

// Retrieve the student's latitude and longitude info for relaying
function init() {
	coord = {
		lat: location.href.match(/[?&]slat=([^&]*)/)[1],
		lng: location.href.match(/[?&]slng=([^&]*)/)[1]
	};
}

// Generate HTML drop-down menu for all subjects
function subjects() {
	var ref = new Firebase('https://tutoru-v1.firebaseio.com/subjects');
	
	// The label tag for the drop-down menu
	var label= document.createElement('select');
	label.id = 'idSelect';
	
	// Obtain the subject titles and put into menu
	ref.once('value', function(data) {
		for (var i=0; i < data.val().length; i++) {
			var option = document.createElement('option');
			option.value = data.val()[i];
			option.text = data.val()[i];
			label.appendChild(option);
		}
	});
	
	document.getElementById('divSelect').appendChild(label);
}

function confirm() {
	var ref = new Firebase('https://tutoru-v1.firebaseio.com/');
	ref.once('value', function(data) {
		// Given the string title of a subject, obtain the numerical ID
		var subjectID = $.inArray($('#idSelect').val(), data.val().subjects);
		
		var url = 'confirm_tutor.html?slat=' + coord.lat + '&slng=' + coord.lng + '&sid=' + subjectID;
		location.replace(url);
	});
}