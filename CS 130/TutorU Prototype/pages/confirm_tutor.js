// BACKEND: I've hard-coded the student user at the moment
var ref = new Firebase('https://tutoru-v1.firebaseio.com/');
var authData = ref.getAuth();
var studentID = authData.uid.substr(12);

var refTutorRequest;
var subjectID;
var subjectList;
var studentCoord;

// The rating value is multiplied by this number and is used to calculate rankings
var errorRating = 10000;
// The rating value (x.xx) is multiplied by this number and is used to calculate rankings
var errorDist = 100;
// In miles
var radius = 15.0;

var tutorID;
var tutorIndex;
var tutorCount;
var reversed;

function init() {
	// Retrieve the student's latitude and longitude info
	studentCoord = {
		lat: location.href.match(/[?&]slat=([^&]*)/)[1],
		lng: location.href.match(/[?&]slng=([^&]*)/)[1]
	};
	
	subjectID = location.href.match(/[?&]sid=([^&]*)/)[1];
	
	// Obtain the subject titles and put into object
	ref = new Firebase('https://tutoru-v1.firebaseio.com/');
	ref.child('subjects').once('value', function(data) {
		subjectList = data.val();
		
		// Remove previous tutor request data
		refTutorRequest = ref.child('students').child(studentID).child('tutorRequest');
		refTutorRequest.set({});
		
		filterTutors();
	});
}

// Filter out tutors who: do not tutor the student's requested subject, are too far away, are offline
function filterTutors() {
	ref.once('value', function(data) {
		var refAllTutors = ref.child('tutors');
		refAllTutors.once('value', function(data) {
			var numTutors = Object.keys(data.val()).length;
			var index = 0;
			var ratingObj = {};
			
			// For each tutor from the list of all tutors, get the tutor's location and other information
			for(id in data.val()) {
				var refTutor = refAllTutors.child(id);
				refTutor.once('value', function(data) {
					var tutor = data.val();
					
					// If the tutor teaches the subject requested by the student and is online
					if(($.inArray(parseInt(subjectID), tutor.subjects) >= 0 && tutor.available) || index == numTutors-1)
						getTutorLocation(tutor, ratingObj, index == numTutors-1);
					index++;
				});
			}
		});
	});
}

// Finds the tutor's location, calculates the distance to the student and stores the data in database
function getTutorLocation(tutor, ratingObj, done) {
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode(
		{'address': tutor.location},
		function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				var tutorLocation = results[0].geometry.location;
				var distance = google.maps.geometry.spherical.computeDistanceBetween(
					new google.maps.LatLng(studentCoord.lat, studentCoord.lng),
					new google.maps.LatLng(tutorLocation.lat(), tutorLocation.lng())
				);
				
				// Convert from meters to miles
				distance = Number(distance*0.000621371);
				
				// If the tutor is less than [radius] miles away, save tutor data
				if($.inArray(parseInt(subjectID), tutor.subjects) >= 0 && tutor.available && distance < radius) {
					refTutorRequest.push({
						id:tutor.id,
						dist:distance.toFixed(2),
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
					if(Object.keys(ratingObj).length == 0)
						location.replace('no_tutor_available.html');
					else {
						refTutorRequest.child('ratingOrder').update(ratingObj);
						orderTutors();
					}
				}
			}
			else
				// FRONTEND: ugly alert window
				alert(status);
	});
}

function orderTutors() {
	refTutorRequest.once('value', function(data) {
		var refRatings = data.val().ratingOrder;
		tutorCount = Object.keys(refRatings).length;
		
		// If the highest ratingOrder value is less than [radius*errorDist],
		// then the tutor has no ratings and the value is based solely on proximity => lower value is better (closer)
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

// Display the nth tutor in the ordered list
function showTutor(n) {
	ref.child('students').child(studentID).child('tutorRequest').once('value', function(data) {
		var tutors = data.val().ratingOrder;
		
		var requestObj;
		for(reqID in data.val())
			if(parseInt(data.val()[reqID].id) == parseInt(tutors[Object.keys(tutors)[n]]))
				requestObj = data.val()[reqID];
		
		ref.child('tutors').child(tutors[Object.keys(tutors)[n]]).once('value', function(data) {
			var tutor = data.val();
			tutorID = tutor.id;
			
			drawMap(requestObj.lat, requestObj.lng);
			
			// FRONTEND: tutor's information gets displayed here
			document.getElementById('tName').innerHTML = 'Name: <strong>' +tutor.name +'</strong>';
			document.getElementById('tLocation').innerHTML = '<strong>Location:</strong> ' +tutor.location;
			document.getElementById('tDistance').innerHTML = '<strong>Distance:</strong> ' +requestObj.dist +' miles';
			document.getElementById('tFee').innerHTML = '<strong>Fee:</strong> $' +tutor.fee +'/hr';
			document.getElementById('tUntil').innerHTML = '<strong>Available until:</strong> ' +tutor.availableUntil;
			
			// FRONTEND: display tutor's subjects
			var msg = '';
			for(var i = 0; i < tutor.subjects.length; i++)
				msg += subjectList[tutor.subjects[i]] +'<br />';
			document.getElementById('tSubjects').innerHTML = msg;
			
			// FRONTEND: display tutor's rating
			document.getElementById('tRating').innerHTML = '<strong>Overall rating:</strong> ' +tutor.rating +'/5';
			var starVal = Math.round(tutor.rating*2.0)/2.0;
			var stars = document.getElementsByName('ratingOverall');
			for(var i = 0; i < stars.length; i++)
				if(stars[i].value == String(starVal))
					stars[i].checked = true;
			
			// FRONTEND: display the comments the tutor received
			var cmt = '';
			for(c in tutor.feedback.comments)
				cmt += '<p style="float: left; margin-bottom:15px; "><a>' + tutor.feedback.comments[c] +'</a></p><hr>';
			document.getElementById('tComments').innerHTML = cmt;
		});
	});
}

// Display Google Maps with both student and tutor markers
function drawMap(lat, lng) {
	// FRONTEND: map gets displayed here
	document.getElementById('divMap').innerHTML =
		'<iframe src="map.html?slat=' + studentCoord.lat + '&slng=' + studentCoord.lng
		+ '&lat=' + lat + '&lng=' + lng + '" frameBorder="0" width="300px" height="200px"></iframe>';
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

function back() {
	var url = 'student_subject.html?slat=' + studentCoord.lat + '&slng=' + studentCoord.lng;
	location.replace(url);
}

function confirm() {
	// Store session information in database for later retrieval
	refTutorRequest.set({
		id:tutorID,
		duration: 0
	});
	var refTutor = ref.child('tutors').child(tutorID).child('tutorRequest');
	refTutor.set({
		id:studentID,
		duration:0
	});
	
	location.replace('time_chat.html?sid=' + studentID + '&tid=' + tutorID);
}