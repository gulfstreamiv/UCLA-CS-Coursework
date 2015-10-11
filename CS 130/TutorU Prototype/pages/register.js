function toggleInput() {
	// If the user selects the student HTML radio button, remove the checkboxes and the location field
	if(document.getElementById('idStudent').checked)
		document.getElementById('divCheckboxes').innerHTML = '';
	else
		subjectCheckboxes();
}

// Generate HTML checkboxes for all subjects
function subjectCheckboxes() {
	var code = '';
	
	// Obtain the subject titles and create a checkbox for each
	var ref = new Firebase('https://tutoru-v1.firebaseio.com/subjects');
	ref.once('value', function(data) {
		for (var i = 0; i < data.val().length; i++) {
			var subjName = data.val()[i];
			
			// FRONTEND: checkboxes are created here
			code += '<input type="checkbox" name="subject[]" ' +'value=' +subjName +'>' +subjName + '<hr>';
		}
		document.getElementById('divCheckboxes').innerHTML = '<p style="margin-top:10px"><font size="3">Subject(s) you want to teach as a tutor:</font></p><br><br>'+code;
	});
}

function register() {
	var ref = new Firebase('https://tutoru-v1.firebaseio.com/');
	
	// Determine whether user is a student or tutor
	var isTutor = false;
	var refUsers = ref.child('students');
	if(document.getElementById('idTutor').checked) {
		refUsers = ref.child('tutors');
		isTutor = true;
	}
	
	// Extract the subject codes the tutor can teach
	var subjectList = [];
	var subjects = document.getElementsByName('subject[]');
	for (var i=0; i < subjects.length; i++)
		if (subjects[i].checked)
			subjectList.push(i);
	
	ref.createUser(
		{email:$('#idEmail').val(), password:$('#idPass').val()},
		function(error, userData) {
			if(error)
				// FRONTEND: I display an ugly alert box at the moment
				// BACKEND: email:key pair is already created at this point under Login&Auth menu. Need code to delete user
				alert(error);
			else {
				if(isTutor)
					refUsers.child(userData.uid.replace(/^\D+/g, '')).set({
						id:userData.uid.replace(/^\D+/g, ''),
						name:$('#idName').val(),
						email:$('#idEmail').val(),
						password:$('#idPass').val(),
						card:$('#idCard').val(),
						location:0,
						available:false,
						availableUntil:0,
						rating:0, fee:0,
						feedback: {
							comments:{},
							sum:0,
							count:0
						},
						subjects:subjectList
					});
				else
					refUsers.child(userData.uid.replace(/^\D+/g, '')).set({
						id:userData.uid.replace(/^\D+/g, ''),
						name:$('#idName').val(),
						email:$('#idEmail').val(),
						password:$('#idPass').val(),
						card:$('#idCard').val(),
						tutorRequest:{}
					});
			}
			// FRONTEND: this is where I replace the URL
			location.replace('../index.html');
		}
	);
}