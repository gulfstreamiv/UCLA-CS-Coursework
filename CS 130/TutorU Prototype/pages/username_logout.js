var ref = new Firebase('https://tutoru-v1.firebaseio.com/');
var authData = ref.getAuth();
var userId = authData.uid.substr(12);

//call back that listen for changes
ref.onAuth(authDataCallback);
function authDataCallback(authData) {
  if (authData)
    console.log("User " + authData.uid.substr(12) + " is logged in with " + authData.provider);
  else 
    console.log("User is logged out");
}

var userPtr = ref.child("tutors").child(userId);
userPtr.once("value", function(snapshot){
  user = snapshot.val();
  document.getElementById("demo").innerHTML = "Hello " + user.name;
});

function logout(){
  ref.unauth();
  console.log("User is logged out");
}