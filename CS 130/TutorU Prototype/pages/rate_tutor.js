var tutorID;

// Extract the tutor's ID from the url
function getInfo() {
	// BACKEND: must pass the tutor's id via URL with name "tid"
	tutorID = location.href.match(/[?&]tid=([^&]*)/)[1];
	
	var ref = new Firebase('https://tutoru-v1.firebaseio.com/tutors');
	var refTutor = ref.child(tutorID);
	refTutor.once('value', function(data) {
		// FRONTEND: tutor's name
		document.getElementById('idName').innerHTML = 'Name: <strong>' +data.val().name +'</strong>';
	});
}

function submit() {
	var ref = new Firebase('https://tutoru-v1.firebaseio.com/tutors');
	var refTutor = ref.child(tutorID);
	refTutor.once('value', function(data) {
		// Retrieve existing values
		var sumVal = parseFloat(data.val().feedback.sum);
		var count = parseFloat(data.val().feedback.count);
		
		// Retrieve the rating given by the student
		var ratings = document.getElementsByName('ratingOverall');
		for(var i = 0; i < ratings.length; i++)
			if(ratings[i].checked) {
				sumVal += parseFloat(ratings[i].value);
				count++;
			}
		
		// Update the feedback object in database
		refTutor.child('feedback').update({sum:sumVal});
		refTutor.child('feedback').update({count:count});
		
		// If the comment is not empty, update database
		if($('#comment').val() != "")
			refTutor.child('feedback').child('comments').push($('#comment').val());
		
		// Update the average rating
		var avg = sumVal/count;
		refTutor.update({rating:avg.toFixed(2)});
		
		location.replace('rating_confirm.html');
	});
}