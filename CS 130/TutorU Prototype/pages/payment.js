// BACKEND: need to dynamically get the student's ID
var ref = new Firebase('https://tutoru-v1.firebaseio.com/');
var authData = ref.getAuth();
var studentID = authData.uid.substr(12);
var tutorID;

function init() {
	var ref = new Firebase('https://tutoru-v1.firebaseio.com/');
	var refTutorRequest = ref.child('students').child(studentID).child('tutorRequest');
	
	refTutorRequest.once('value', function(data) {
		var session = data.val();
		
		ref.child('tutors').child(session.id).once('value', function(data) {
			var tutor = data.val();
			tutorID = tutor.id;
		
			var hours = parseInt(parseFloat(session.duration)/60.0);
			var minutes = parseInt(parseInt(session.duration)%60);
		
			// FRONTEND: the text is output from here
			document.getElementById('idInfo').innerHTML =
				'The session with ' + tutor.name + ' was for ' + hours + ' hour(s) and ' + minutes + ' minutes.';
		
			var amount = (hours+(parseFloat(minutes)/60.0))*parseFloat(tutor.fee);
			document.getElementById('idFee').innerHTML = 'The amount is $' + amount.toFixed(2) + '.';
		});
	});
}

function submit() {
    if (confirm("ATTENTION: You are about to finalize your order! Your action will not be revoked!") == true) {
        window.location="rate_tutor.html?tid=" + tutorID;
    } else {
  
    }
}