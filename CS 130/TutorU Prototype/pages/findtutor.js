var errorRating = 10000;
var errorDist = 10;
var radius = 15.0;
var allSubjects = {};
var studentID = 80;
var studentLocation;
var tutorIndex;
var tutorCount;
var reversed;
var map;
var tutorMarker;

// Generate HTML drop-down menu for all subjects
function subjectSelect() {
	var ref = new Firebase('https://tutoru-v1.firebaseio.com/subjects');
	
	// The label tag for the drop-down menu
	var label= document.createElement('select');
	label.id = 'idSelect';
	
	// Obtain the subject titles and put into menu
	ref.once('value', function(data) {
		for (var i=0; i < data.val().length; i++) {
			allSubjects = data.val();
			var option = document.createElement('option');
			option.value = allSubjects[i];
			option.text = allSubjects[i];
			label.appendChild(option);
		}
	});
	
	document.getElementById('divSelect').appendChild(label);
}

// Button to initiate the search for tutors
function findButton() {
	var button = document.createElement('button');
	button.innerHTML = 'Find tutors';
	button.onclick = function(){find()};
	document.getElementById('divFindButton').appendChild(button);
}

// Buttons related to the displaying of tutors
function tutorButtons() {
	// The label tag for all the buttons
	var label= document.createElement('p');
	label.id = 'idTutorButtons';

	// Button to display the previous tutor
	var pButton = document.createElement('button');
	pButton.innerHTML = 'Previous tutor';
	pButton.onclick = function(){prev()};
	label.appendChild(pButton);

	// Button to display the next tutor
	var nButton = document.createElement('button');
	nButton.innerHTML = 'Next tutor';
	nButton.onclick = function(){next()};
	label.appendChild(nButton);
	
	document.getElementById('divTutorButtons').appendChild(label);
}

// Obtain the student's Google Maps location
function locateStudent() {
	studentLocation = [];
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode(
		{'address':$('#idLocation').val()},
		function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				studentLocation = {
					lat: results[0].geometry.location.lat(),
					lng: results[0].geometry.location.lng()
				};
				drawMap(studentLocation.lat, studentLocation.lng);
				drawMarker(studentLocation.lat, studentLocation.lng, 'Student');
			}
			else
				alert(status)
		}
	);
}

// Display Google Maps
function drawMap(lat, lng) {
	var latlng = new google.maps.LatLng(lat, lng);
	var myOptions = {
		zoom: 14,
		center: latlng,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	map = new google.maps.Map(document.getElementById('idMap'), myOptions);
}

// Place a Google Maps marker
function drawMarker(lat, lng, titleVar) {
	var latlng = new google.maps.LatLng(lat, lng);
	
	if(titleVar == 'Student')
		var image = {
			url: 'markerStudent.png',
			size: new google.maps.Size(45, 45),
			origin: new google.maps.Point(0, 0),
			anchor: new google.maps.Point(22, 22)
		};
	else
		var image = {
			url: 'markerTutor.png',
			size: new google.maps.Size(38, 45),
			origin: new google.maps.Point(0, 0),
			anchor: new google.maps.Point(19, 22)
		};
	
	var marker = new google.maps.Marker({
		position: latlng,
		map: map,
		title: titleVar,
		icon: image
	});
	
	if(titleVar == 'Tutor')
		tutorMarker = marker;
}

function find() {
	var ref = new Firebase('https://tutoru-v1.firebaseio.com/');
	
	// Remove previous tutor request data
	var refStudentReq = ref.child('students').child(studentID).child('tutorRequest');
	refStudentReq.set({});
	
	// Display the other tutor-related buttons
	tutorButtons();
	
	filterTutors(ref, refStudentReq);
}

// Filter out tutors who: do not tutor the student's requested subject, are too far away, are offline
function filterTutors(ref, refStudentReq) {
	ref.once('value', function(data) {
		// Given the string title of a subject, obtain the numerical ID
		var subjectID = $.inArray($('#idSelect').val(), data.val().subjects);
		
		var refAll = ref.child('tutors');
		refAll.once('value', function(data) {
			var length = Object.keys(data.val()).length;
			var index = 0;
			var ratingObj = {}
			var done = false;
			
			// For each tutor from the list of all tutors
			for(id in data.val()) {
				var refTutor = refAll.child(id);
				refTutor.once('value', function(data) {
					var tutor = data.val();
					getTutorLocation(refStudentReq, subjectID, tutor, ratingObj, done);
					
					index++;
					if(index == length-1)
						done = true;
				});
			}
		});
	});
}

// Finds the tutor's location, calculates the distance to the student and stores the data in database
function getTutorLocation(refStudentReq, subjectID, tutor, ratingObj, done) {
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode(
		{'address': tutor.location},
		function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				var tutorLocation = results[0].geometry.location;
				var distance = google.maps.geometry.spherical.computeDistanceBetween(
					new google.maps.LatLng(studentLocation.lat, studentLocation.lng),
					new google.maps.LatLng(tutorLocation.lat(), tutorLocation.lng())
				);
				
				// Convert from meters to miles
				distance = Number(distance*0.000621371).toFixed(2);
				
				// If the tutor teaches the subject requested by the student and is online and is less than [radius] miles away, save tutor data
				if($.inArray(subjectID, tutor.subjects) >= 0 && tutor.available && distance < radius) {
					refStudentReq.push({
						id:tutor.id,
						dist:distance,
						rating:tutor.rating,
						lat:tutorLocation.lat(),
						lng:tutorLocation.lng()
					});
					
					// Create an index based on ratings
					var k = (errorRating*tutor.rating)+Math.round(errorDist*distance);
					ratingObj[k] = tutor.id;
				}
				
				// If all tutors have been scanned
				if(done) {
					refStudentReq.child('ratingOrder').update(ratingObj);
					orderTutors(refStudentReq);
				}
			}
			else
				alert(status);
	});
}

function orderTutors(refStudentReq) {
	refStudentReq.once('value', function(data) {
		var refRatings = data.val().ratingOrder;
		tutorCount = Object.keys(refRatings).length;
		
		// If the highest ratingOrder value is less than [radius*errorDist],
		// then the tutor has no ratings and the value is based soley on proximity => lower value is better (closer)
		if(parseInt(Object.keys(refRatings)[tutorCount - 1]) <= (radius*errorDist)) {
			reversed = false;
			tutorIndex = 0;
		}
		else {
			reversed = true;
			tutorIndex = tutorCount-1;
		}
		
		showTutor(tutorIndex);
	});
}

// Display the nth tutor in the list
function showTutor(n) {
	var ref = new Firebase('https://tutoru-v1.firebaseio.com/students');
	ref.child(studentID).child('tutorRequest').once('value', function(data) {
		var tutors = data.val().ratingOrder;
		
		var requestObj;
		for(reqID in data.val())
			if(parseInt(data.val()[reqID].id) == parseInt(tutors[Object.keys(tutors)[n]]))
				requestObj = data.val()[reqID];
		
		var refTutor = new Firebase('https://tutoru-v1.firebaseio.com/tutors');
		refTutor.child(tutors[Object.keys(tutors)[n]]).once('value', function(data) {
			var tutor = data.val();
			
			// Clear existing contents
			document.getElementById('divTutor').innerHTML = '';
			
			var label= document.createElement('p');
			label.id = 'idTutorInfo';
			
			var msg =
				'<b>' + tutor.name + '</b><br />'
				+'Location: ' + tutor.location + '<br />'
				+'Distance: ' + requestObj.dist + ' miles<br />'
				+'Rating: ' + tutor.rating + '<br />'
				+'<u>Subjects:</u><br />';
				for(var i = 0; i < tutor.subjects.length; i++)
					msg += '- ' + allSubjects[tutor.subjects[i]] +'<br />';
			
			label.innerHTML = msg;
			document.getElementById('divTutor').appendChild(label);
			
			// Remove any existing Google Maps markers for tutors
			if(!(tutorMarker === undefined))
				tutorMarker.setMap(null);
			var latlng = new google.maps.LatLng(requestObj.lat, requestObj.lng);
			map.panTo(latlng);
			drawMarker(requestObj.lat, requestObj.lng, 'Tutor');
		});
	});
}

function prev() {
	if(reversed && tutorIndex < tutorCount-1) {
		tutorIndex++;
		showTutor(tutorIndex);
	}
	else if(!reversed && tutorIndex > 0) {
		tutorIndex--;
		showTutor(tutorIndex);
	}
	else;
}

function next() {
	if(reversed && tutorIndex > 0) {
		tutorIndex--;
		showTutor(tutorIndex);
	}
	else if(!reversed && tutorIndex < tutorCount-1) {
		tutorIndex++;
		showTutor(tutorIndex);
	}
	else;
}

google.maps.event.addDomListener(window, 'load', drawMarker);